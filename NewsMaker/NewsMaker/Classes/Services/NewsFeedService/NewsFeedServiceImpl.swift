//
//  NewsFeedServiceImpl.swift
//  NewsMaker
//
//  Created by m.rakhmanov on 27.05.17.
//  Copyright © 2017 HeadHunterLLC. All rights reserved.
//

import Foundation

class NewsFeedServiceImpl {

    fileprivate let urlFactory: URLFactory
    fileprivate let requestFactory: RequestFactory
    fileprivate let networkClient: NetworkClient
    fileprivate let deserializer: Deserializer
    fileprivate let newsMapper: BriefNewsMapper
    fileprivate let newsCleaner: NewsCleaner
    fileprivate let newsFetcher: NewsFetcher

    fileprivate let queue = DispatchQueue.global()

    init(urlFactory: URLFactory,
         requestFactory: RequestFactory,
         networkClient: NetworkClient,
         deserializer: Deserializer,
         newsFetcher: NewsFetcher,
         newsMapper: BriefNewsMapper,
         newsCleaner: NewsCleaner) {
        self.urlFactory = urlFactory
        self.requestFactory = requestFactory
        self.networkClient = networkClient
        self.deserializer = deserializer
        self.newsMapper = newsMapper
        self.newsCleaner = newsCleaner
        self.newsFetcher = newsFetcher
    }
}

extension NewsFeedServiceImpl: NewsFeedService {
    func updateNews(withConfiguration configuration: NewsFeedServiceConfiguration,
                    completion: @escaping NewsFeedServiceCompletion) {
        guard configuration.lastDate == nil
            else {
                completion { return try self.obtainNews(withConfiguration: configuration) }
                return
        }

        downloadNewsFromNetwork { response in
            do {
                try response()
                completion { return try self.obtainNews(withConfiguration: configuration) }
            } catch {
                completion { throw error }
            }
        }
    }

    func obtainNews(withConfiguration configuration: NewsFeedServiceConfiguration) throws -> [BriefNewsModel] {
        return try newsFetcher.fetchLastNews(fromDate: configuration.lastDate,
                                             amount: configuration.amountPerPage)
    }

    private func downloadNewsFromNetwork(completion: @escaping (() throws -> Void) -> ()) {
        do {
            let url = try urlFactory.create(withAPIPath: .main,
                                            APIMethod: .news,
                                            configuration: nil)
            let requestFactoryConfiguration = RequestFactoryConfiguration(method: .GET,
                                                                          timoutInterval: 60.0,
                                                                          url: url)
            let request = requestFactory.create(requestFactoryConfiguration)
            performNetworkOperations(with: request, completion: completion)
        } catch let error {
            completion { throw error }
        }
    }

    private func performNetworkOperations(with request: URLRequest,
                                          completion: @escaping (() throws -> Void) -> ()) {

        networkClient.perform(request: request) { [weak self] result in
            guard let strongSelf = self else { return }

            strongSelf.queue.async {
                do {
                    let response = try result()
                    let deserialized = try strongSelf.deserializer.deserialize(data: response)
                    try strongSelf.newsCleaner.deleteAllNews()
                    try strongSelf.newsMapper.mapAndSaveToCoreData(deserialized)

                    DispatchQueue.main.async {
                        completion { return }
                    }
                } catch let error {
                    DispatchQueue.main.async {
                        completion { throw error }
                    }
                }
            }
        }
    }
}
