//
//  CoreFactoryImpl.swift
//  NewsMaker
//
//  Created by m.rakhmanov on 26.05.17.
//  Copyright © 2017 HeadHunterLLC. All rights reserved.
//

import CoreData

class CoreFactoryImpl: BaseFactory, CoreFactory {

    fileprivate let defaultContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    fileprivate let backgroundContext = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
    fileprivate let stackCreator = CoreDataStackCreatorImpl()

    override init(factoryProvider: FactoryProvider) {
        super.init(factoryProvider: factoryProvider)

        stackCreator.createStack(backgroundContext: backgroundContext, defaultContext: defaultContext)
    }

    func newsFetcher() -> NewsFetcher {
        return NewsFetcherImpl(context: defaultContext)
    }

    func newsCleaner() -> NewsCleaner {
        return NewsCleanerImpl(context: backgroundContext)
    }

    func briefNewsMapper() -> BriefNewsMapper {
        return BriefNewsMapperImpl(context: backgroundContext)
    }

    func networkClient() -> NetworkClient {
        return NetworkClientImplementation(session: URLSession.shared)
    }

    func requestFactory() -> RequestFactory {
        return RequestFactoryImplementation()
    }

    func urlFactory() -> URLFactory {
        return URLFactoryImplementation()
    }

    func jsonDeserializer() -> Deserializer {
        return JSONDeserializer()
    }
}
