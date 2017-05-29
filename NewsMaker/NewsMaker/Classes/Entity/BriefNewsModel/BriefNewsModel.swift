//
//  BriefNewsModel.swift
//  NewsMaker
//
//  Created by m.rakhmanov on 27.05.17.
//  Copyright © 2017 HeadHunterLLC. All rights reserved.
//

import CoreData

class BriefNewsModel: NSManagedObject {
    @NSManaged var apiName: String
    @NSManaged var text: String
    @NSManaged var bankInfoTypeIdentifier: Int
    @NSManaged var identifier: String
    @NSManaged var publicationDate: NSDate
}
