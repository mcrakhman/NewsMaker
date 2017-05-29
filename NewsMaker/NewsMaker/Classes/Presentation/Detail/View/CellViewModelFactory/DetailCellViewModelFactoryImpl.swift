//
//  DetailCellViewModelFactoryImpl.swift
//  NewsMaker
//
//  Created by m.rakhmanov on 26.05.17.
//  Copyright © 2017 HeadHunterLLC. All rights reserved.
//

import Foundation
import UIKit

class DetailCellViewModelFactoryImpl: DetailCellViewModelFactory {

    fileprivate let dateFormatter: DateFormatter

    init(dateFormatter: DateFormatter) {
        self.dateFormatter = dateFormatter
    }

    func viewModels(fromNews news: DetailNewsModel) -> [CellViewModel] {
        let dateString = dateFormatter.string(from: news.creationDate as Date)
        let title = news.title.toHtmlAttributedString()?.string ?? ""
        let titleModel = NewsDetailTitleCellViewModel(dateString: dateString,
                                                      text: title)

        let contentAttributedString = attributedString(fromContent: news.content)
        let textModel = NewsDetailTextCellViewModel(text: contentAttributedString)

        return [titleModel, textModel]
    }

    private func attributedString(fromContent content: String) -> NSAttributedString {
        let contentAttributedString = content.toHtmlAttributedString()?.mutableCopy() as? NSMutableAttributedString ?? NSMutableAttributedString()

        let rangeOfString = NSMakeRange(0, contentAttributedString.length)
        let font = UIFont.systemFont(ofSize: 14.0, weight: UIFontWeightRegular)

        contentAttributedString.enumerateAttribute(NSFontAttributeName,
                                                   in: rangeOfString,
                                                   options: .longestEffectiveRangeNotRequired,
                                                   using: { value, range, pointer in
                if (value as? UIFont) != nil {
                    contentAttributedString.addAttribute(NSFontAttributeName,
                                                         value: font,
                                                         range: range)
                }
        })

        return contentAttributedString.copy() as? NSAttributedString ?? NSAttributedString()
    }
}
