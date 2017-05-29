//
//  CoreDataCreatorImpl.swift
//  NewsMaker
//
//  Created by m.rakhmanov on 27.05.17.
//  Copyright © 2017 HeadHunterLLC. All rights reserved.
//

import CoreData

class CoreDataStackCreatorImpl {

    fileprivate struct Constants {
        static let storeFilename = "CoreDataModel.sqlite"
        static let modelName = "NewsModel"
        static let modelExtension = "momd"
    }
}

extension CoreDataStackCreatorImpl: CoreDataStackCreator {

    private func storeUrl(fromFilename filename: String) -> URL? {
        let documentsDirectoryUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first

        return documentsDirectoryUrl?.appendingPathComponent(filename)
    }

    func createStack(backgroundContext: NSManagedObjectContext, defaultContext: NSManagedObjectContext) {
        guard let modelUrl = Bundle.main.url(forResource: Constants.modelName,
                                             withExtension: Constants.modelExtension),
              let model = NSManagedObjectModel(contentsOf: modelUrl),
              let storeUrl = storeUrl(fromFilename: Constants.storeFilename)
            else {
                fatalError("Ошибка при создании модели")
        }

        let psc = NSPersistentStoreCoordinator(managedObjectModel: model)

        do {
            try psc.addPersistentStore(ofType: NSSQLiteStoreType,
                                       configurationName: nil,
                                       at: storeUrl,
                                       options: nil)
        } catch {
            fatalError("Ошибка при миграции стора: \(error)")
        }

        defaultContext.persistentStoreCoordinator = psc
        backgroundContext.parent = defaultContext
    }
}
