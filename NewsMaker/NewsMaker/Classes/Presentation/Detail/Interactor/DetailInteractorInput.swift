//
//  DetailInteractorInput.swift
//  NewsMaker
//
//  Created by m.rakhmanov on 26.05.17.
//  Copyright © 2017 HeadHunterLLC. All rights reserved.
//

import Foundation

protocol DetailInteractorInput {
    func findNews(withId identifier: String)
    func obtainNewsLocally(withId identifier: String)
}
