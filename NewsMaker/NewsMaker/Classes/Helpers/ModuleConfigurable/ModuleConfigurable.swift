//
//  ModuleConfigurable.swift
//  NewsMaker
//
//  Created by m.rakhmanov on 29.05.17.
//  Copyright © 2017 HeadHunterLLC. All rights reserved.
//

protocol ModuleConfiguration {}

protocol ModuleConfigurable {
    func configure(with configuration: ModuleConfiguration)
}

protocol ModuleConfigurableProvider {
    var configurable: ModuleConfigurable? { get }
}
