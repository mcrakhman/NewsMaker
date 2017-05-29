//
//  NewsDetailServiceImpl.swift
//  NewsMaker
//
//  Created by m.rakhmanov on 29.05.17.
//  Copyright © 2017 HeadHunterLLC. All rights reserved.
//

import Foundation

class NewsDetailServiceImpl {
    fileprivate let urlFactory: URLFactory
    fileprivate let requestFactory: RequestFactory
    fileprivate let networkClient: NetworkClient
    fileprivate let deserializer: Deserializer
    fileprivate let detailNewsMapper: DetailNewsMapper
    fileprivate let detailNewsFetcher: DetailNewsFetcher

    fileprivate let queue = DispatchQueue.global()

    init(urlFactory: URLFactory,
         requestFactory: RequestFactory,
         networkClient: NetworkClient,
         deserializer: Deserializer,
         detailNewsMapper: DetailNewsMapper,
         detailNewsFetcher: DetailNewsFetcher) {
        self.urlFactory = urlFactory
        self.requestFactory = requestFactory
        self.networkClient = networkClient
        self.deserializer = deserializer
        self.detailNewsMapper = detailNewsMapper
        self.detailNewsFetcher = detailNewsFetcher
    }
}

extension NewsDetailServiceImpl: NewsDetailService {
    func updateNews(withConfiguration configuration: NewsDetailServiceConfiguration,
                    completion: @escaping NewsDetailServiceCompletion) {
        let responseCompletion: (() throws -> Void) -> () = { [weak self] response in
            guard let strongSelf = self else { return }
            do {
                try response()
                completion {
                    return try strongSelf.detailNewsFetcher.fetchDetailNews(withIdentifier: configuration.identifier)
                }
            } catch {
                completion { throw error }
            }
        }

        do {
            let url = try urlFactory.create(withAPIPath: .main,
                                            APIMethod: .detail,
                                            configuration: configuration)
            let requestFactoryConfiguration = RequestFactoryConfiguration(method: .GET,
                                                                          timoutInterval: 60.0,
                                                                          url: url)
            let request = requestFactory.create(requestFactoryConfiguration)
            performNetworkOperations(with: request, completion: responseCompletion)
        } catch let error {
            completion { throw error }
        }
    }

    func obtainNews(withConfiguration configuration: NewsDetailServiceConfiguration) throws -> DetailNewsModel? {
        return try detailNewsFetcher.fetchDetailNews(withIdentifier: configuration.identifier)
    }

    private func performNetworkOperations(with request: URLRequest,
                                          completion: @escaping (() throws -> Void) -> ()) {

        networkClient.perform(request: request) { [weak self] result in
            guard let strongSelf = self else { return }

            strongSelf.queue.async {
                do {
                    let response = try result()
                    let deserialized = try strongSelf.deserializer.deserialize(data: response)
                    try strongSelf.detailNewsMapper.mapAndSaveToCoreData(deserialized)

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
