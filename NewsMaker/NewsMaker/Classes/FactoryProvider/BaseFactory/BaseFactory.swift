//
//  BaseFactory.swift
//  NewsMaker
//
//  Created by m.rakhmanov on 26.05.17.
//  Copyright © 2017 HeadHunterLLC. All rights reserved.
//

class BaseFactory {
    let factoryProvider: FactoryProvider

    init(factoryProvider: FactoryProvider) {
        self.factoryProvider = factoryProvider
    }
}
