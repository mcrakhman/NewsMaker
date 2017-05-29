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

    fileprivate let queue = DispatchQueue.global()

    init(urlFactory: URLFactory,
         requestFactory: RequestFactory,
         networkClient: NetworkClient,
         deserializer: Deserializer) {
        self.urlFactory = urlFactory
        self.requestFactory = requestFactory
        self.networkClient = networkClient
        self.deserializer = deserializer

    }
}

extension NewsDetailServiceImpl: NewsDetailService {
    func updateNews(withId identifier: String, completion: @escaping NewsDetailServiceCompletion) {
        
    }
    
    func obtainNews(withId identifier: String) throws -> DetailNewsModel? {
        return nil
    }
}
