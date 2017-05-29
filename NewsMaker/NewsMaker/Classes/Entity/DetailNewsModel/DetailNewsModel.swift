//
//  DetailNewsModel.swift
//  NewsMaker
//
//  Created by m.rakhmanov on 27.05.17.
//  Copyright © 2017 HeadHunterLLC. All rights reserved.
//

import CoreData

class DetailNewsModel: NSManagedObject {
    @NSManaged var title: String
    @NSManaged var identifier: String
    @NSManaged var content: String
    @NSManaged var creationDate: NSDate
    @NSManaged var lastModificationDate: NSDate
}
