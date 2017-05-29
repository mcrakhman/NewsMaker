//
//  DetailNewsCleanerImpl.swift
//  NewsMaker
//
//  Created by m.rakhmanov on 29.05.17.
//  Copyright © 2017 HeadHunterLLC. All rights reserved.
//

import CoreData

class DetailNewsCleanerImpl {
    fileprivate let context: NSManagedObjectContext

    init(context: NSManagedObjectContext) {
        self.context = context
    }
}

extension DetailNewsCleanerImpl: DetailNewsCleaner {

    func deleteNews(withIdentifier identifier: String) throws {
        try context.performAndWaitSaveInParent {
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: DetailNewsModel.entityName)
            request.predicate = NSPredicate(format: "identifier == %@", identifier)
            request.includesPropertyValues = false

            let objects = try self.context.fetch(request) as? [DetailNewsModel] ?? []
            objects.forEach(self.context.delete)
        }
    }

    func deleteAllDetailNews() throws {
        try context.performAndWaitSaveInParent {
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: DetailNewsModel.entityName)
            request.includesPropertyValues = false

            let objects = try self.context.fetch(request) as? [DetailNewsModel] ?? []
            objects.forEach(self.context.delete)
        }
    }
}
