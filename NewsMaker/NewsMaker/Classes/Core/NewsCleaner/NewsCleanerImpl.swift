//
//  NewsCleanerImpl.swift
//  NewsMaker
//
//  Created by m.rakhmanov on 27.05.17.
//  Copyright © 2017 HeadHunterLLC. All rights reserved.
//

import CoreData

class NewsCleanerImpl {
    fileprivate let context: NSManagedObjectContext

    init(context: NSManagedObjectContext) {
        self.context = context
    }
}

extension NewsCleanerImpl: NewsCleaner {
    func deleteAllNews() throws {
        try context.performAndWaitSaveInParent {
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: BriefNewsModel.entityName)
            request.includesPropertyValues = false

            let objects = try self.context.fetch(request) as? [BriefNewsModel] ?? []
            objects.forEach(self.context.delete)
        }
    }
}
