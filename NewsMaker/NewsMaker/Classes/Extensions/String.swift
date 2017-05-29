//
//  String.swift
//  NewsMaker
//
//  Created by m.rakhmanov on 29.05.17.
//  Copyright © 2017 HeadHunterLLC. All rights reserved.
//

import UIKit
import Foundation

extension String {
    func toHtmlAttributedString() -> NSAttributedString? {
        let options: [String: Any] = [NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType,
                                      NSCharacterEncodingDocumentAttribute: String.Encoding.utf8.rawValue]
        guard let data = self.data(using: String.Encoding.utf8, allowLossyConversion: true),
            let attributedString = try? NSAttributedString(data: data,
                                                           options: options,
                                                           documentAttributes: nil)
            else {
                return nil
        }

        return attributedString
    }
}
