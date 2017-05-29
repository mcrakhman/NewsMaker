//
//  DetailNewsMapperImpl.swift
//  NewsMaker
//
//  Created by m.rakhmanov on 29.05.17.
//  Copyright © 2017 HeadHunterLLC. All rights reserved.
//

import CoreData

class DetailNewsMapperImpl {

    fileprivate struct Constants {
        static let millisecondsInSecond = 1000.0
    }

    fileprivate let context: NSManagedObjectContext

    init(context: NSManagedObjectContext) {
        self.context = context
    }
}

extension DetailNewsMapperImpl: DetailNewsMapper {
    func mapAndSaveToCoreData(_ object: Any) throws {
        guard let jsonDict = object as? [String: Any],
              let payload = jsonDict["payload"] as? [String: Any]
            else {
                throw MapperError.cannotParseData
        }

        try context.performAndWaitSaveInParent {
            self.mapElement(payload)
        }
    }

    private func mapElement(_ element: [String: Any]) {
        let model: DetailNewsModel = context.insertObject()
        model.creationDate = date(fromDictionary: element, forKey: "creationDate") ?? NSDate()
        model.lastModificationDate = date(fromDictionary: element, forKey: "lastModificationDate") ?? NSDate()

        if let titleDictionary = element["title"] as? [String: Any] {
            model.publicationDate = date(fromDictionary: titleDictionary, forKey: "publicationDate") ?? NSDate()
            model.identifier = titleDictionary["id"] as? String ?? ""
            model.title = titleDictionary["text"] as? String ?? ""
        }

        model.content = element["content"] as? String ?? ""
    }

    private func date(fromDictionary dictionary: [String: Any], forKey key: String) -> NSDate? {
        guard let publicationDate = dictionary[key] as? [String: Any],
              let milliseconds = publicationDate["milliseconds"] as? Int
            else {
                return nil
        }

        let seconds = TimeInterval(milliseconds) / Constants.millisecondsInSecond
        return NSDate(timeIntervalSince1970: seconds)
    }
}
