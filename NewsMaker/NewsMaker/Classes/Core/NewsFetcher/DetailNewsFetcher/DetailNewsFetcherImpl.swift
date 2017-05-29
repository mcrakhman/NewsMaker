//
//  DetailNewsFetcherImpl.swift
//  NewsMaker
//
//  Created by m.rakhmanov on 29.05.17.
//  Copyright © 2017 HeadHunterLLC. All rights reserved.
//

import CoreData

class DetailNewsFetcherImpl {
    fileprivate let context: NSManagedObjectContext

    init(context: NSManagedObjectContext) {
        self.context = context
    }
}

extension DetailNewsFetcherImpl: DetailNewsFetcher {
    func fetchDetailNews(withIdentifier identifier: String) throws -> DetailNewsModel? {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: DetailNewsModel.entityName)
        fetchRequest.predicate = NSPredicate(format: "identifier == %@", identifier)

        let results = try context.fetch(fetchRequest)
        return results.first as? DetailNewsModel
    }
}
