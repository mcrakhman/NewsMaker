//
//  BriefNewsMapperImpl.swift
//  NewsMaker
//
//  Created by m.rakhmanov on 27.05.17.
//  Copyright © 2017 HeadHunterLLC. All rights reserved.
//

import CoreData

class BriefNewsMapperImpl {

    fileprivate struct Constants {
        static let millisecondsInSecond = 1000.0
    }

    fileprivate let context: NSManagedObjectContext

    init(context: NSManagedObjectContext) {
        self.context = context
    }
}

extension BriefNewsMapperImpl: BriefNewsMapper {
    func mapAndSaveToCoreData(_ object: Any) throws {
        guard let jsonDict = object as? [String: Any],
              let payloadArray = jsonDict["payload"] as? [[String:Any]]
            else {
                throw MapperError.cannotParseData
        }

        try context.performAndWaitSaveInParent {
            for payload in payloadArray {
                self.mapElement(payload)
            }
        }
    }

    private func mapElement(_ element: [String: Any]) {
        let model: BriefNewsModel = context.insertObject()

        model.apiName = element["name"] as? String ?? ""
        model.identifier = element["id"] as? String ?? ""
        model.text = element["text"] as? String ?? ""
        model.bankInfoTypeIdentifier = element["bankInfoTypeId"] as? Int ?? 0

        if let publicationDate = element["publicationDate"] as? [String: Any],
           let milliseconds = publicationDate["milliseconds"] as? Int {
            let seconds = TimeInterval(milliseconds) / Constants.millisecondsInSecond
            model.publicationDate = NSDate(timeIntervalSince1970: seconds)
        }
    }
}
