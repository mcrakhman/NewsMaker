//
//  NSManagedObjectContext.swift
//  NewsMaker
//
//  Created by m.rakhmanov on 27.05.17.
//  Copyright © 2017 HeadHunterLLC. All rights reserved.
//

import CoreData

extension NSManagedObjectContext {
    func insertObject<A: NSManagedObject>() -> A {
        guard let obj = NSEntityDescription.insertNewObject(forEntityName: A.entityName,
                                                            into: self) as? A
            else {
                fatalError("Неправильный тип объекта")
        }

        return obj
    }

    func performAndWaitSaveInParent(_ completion: @escaping () throws -> ()) throws {
        var contextError: Error?
        self.performAndWait {
            do {
                try completion()
                try self.save()

                guard let parent = self.parent else { return }
                parent.performAndWait {
                    do {
                        try parent.save()
                    } catch {
                        contextError = error
                    }
                }
            } catch {
                contextError = error
            }
        }

        if let contextError = contextError {
            throw contextError
        }
    }
}
