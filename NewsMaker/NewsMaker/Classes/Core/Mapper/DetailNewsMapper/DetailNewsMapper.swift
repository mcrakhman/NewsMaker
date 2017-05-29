//
//  DetailNewsMapper.swift
//  NewsMaker
//
//  Created by m.rakhmanov on 29.05.17.
//  Copyright © 2017 HeadHunterLLC. All rights reserved.
//

import Foundation

protocol DetailNewsMapper {
    func mapAndSaveToCoreData(_ object: Any) throws
}
