//
//  FactoryProviderImpl.swift
//  NewsMaker
//
//  Created by m.rakhmanov on 26.05.17.
//  Copyright © 2017 HeadHunterLLC. All rights reserved.
//

class FactoryProviderImpl: FactoryProvider {
    
    fileprivate lazy var _coreFactory: CoreFactory = {
        return CoreFactoryImpl(factoryProvider: self)
    }()

    fileprivate lazy var _serviceFactory: ServiceFactory = {
        return ServiceFactoryImpl(factoryProvider: self)
    }()

    fileprivate lazy var _helperFactory: HelperFactory = {
        return HelperFactoryImpl(factoryProvider: self)
    }()

    fileprivate lazy var _userStoryFactory: UserStoryFactory = {
        return UserStoryFactoryImpl(factoryProvider: self)
    }()

    func coreFactory() -> CoreFactory {
        return _coreFactory
    }

    func serviceFactory() -> ServiceFactory {
        return _serviceFactory
    }

    func helperFactory() -> HelperFactory {
        return _helperFactory
    }

    func userStoryFactory() -> UserStoryFactory {
        return _userStoryFactory
    }
}
