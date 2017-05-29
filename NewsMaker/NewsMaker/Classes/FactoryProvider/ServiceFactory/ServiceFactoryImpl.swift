//
//  ServiceFactoryImpl.swift
//  NewsMaker
//
//  Created by m.rakhmanov on 26.05.17.
//  Copyright © 2017 HeadHunterLLC. All rights reserved.
//

class ServiceFactoryImpl: BaseFactory, ServiceFactory {
    func newsFeedService() -> NewsFeedService {
        let coreFactory = factoryProvider.coreFactory()
        return NewsFeedServiceImpl(urlFactory: coreFactory.urlFactory(),
                                   requestFactory: coreFactory.requestFactory(),
                                   networkClient: coreFactory.networkClient(),
                                   deserializer: coreFactory.jsonDeserializer(),
                                   newsFetcher: coreFactory.newsFetcher(),
                                   newsMapper: coreFactory.briefNewsMapper(),
                                   newsCleaner: coreFactory.newsCleaner())
    }
}
