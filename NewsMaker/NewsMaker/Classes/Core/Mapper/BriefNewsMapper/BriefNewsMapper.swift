//
//  BriefNewsMapper.swift
//  NewsMaker
//
//  Created by m.rakhmanov on 27.05.17.
//  Copyright © 2017 HeadHunterLLC. All rights reserved.
//

import CoreData

protocol BriefNewsMapper {
    func mapAndSaveToCoreData(_ object: Any) throws
}
