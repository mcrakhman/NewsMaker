//
//  CoreDataCreator.swift
//  NewsMaker
//
//  Created by m.rakhmanov on 27.05.17.
//  Copyright © 2017 HeadHunterLLC. All rights reserved.
//

import CoreData

protocol CoreDataStackCreator {
    func createStack(backgroundContext: NSManagedObjectContext, defaultContext: NSManagedObjectContext)
}
