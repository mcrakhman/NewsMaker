//
//  FactoryProvider.swift
//  NewsMaker
//
//  Created by m.rakhmanov on 26.05.17.
//  Copyright © 2017 HeadHunterLLC. All rights reserved.
//

protocol FactoryProvider {
    func coreFactory() -> CoreFactory
    func serviceFactory() -> ServiceFactory
    func helperFactory() -> HelperFactory
    func userStoryFactory() -> UserStoryFactory
}
