//
//  NewsFetcherImpl.swift
//  NewsMaker
//
//  Created by m.rakhmanov on 28.05.17.
//  Copyright © 2017 HeadHunterLLC. All rights reserved.
//

import CoreData

class NewsFetcherImpl {
    fileprivate let context: NSManagedObjectContext

    init(context: NSManagedObjectContext) {
        self.context = context
    }
}

extension NewsFetcherImpl: NewsFetcher {
    func fetchLastNews(fromDate date: NSDate?, amount: Int) throws -> [BriefNewsModel] {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: BriefNewsModel.entityName)

        if let date = date {
            let predicate = NSPredicate(format: "publicationDate < %@", date)
            fetchRequest.predicate = predicate
        }

        let sectionSortDescriptor = NSSortDescriptor(key: "publicationDate", ascending: false)
        let sortDescriptors = [sectionSortDescriptor]

        fetchRequest.sortDescriptors = sortDescriptors
        fetchRequest.fetchBatchSize = amount
        fetchRequest.fetchLimit = amount
        
        let results = try context.fetch(fetchRequest)
        return results as? [BriefNewsModel] ?? []
    }
}
