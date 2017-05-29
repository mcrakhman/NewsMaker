//
//  DetailCellViewModelFactoryImpl.swift
//  NewsMaker
//
//  Created by m.rakhmanov on 26.05.17.
//  Copyright © 2017 HeadHunterLLC. All rights reserved.
//

import Foundation

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
        let textModel = NewsDetailTextCellViewModel(text: news.content.toHtmlAttributedString() ?? NSAttributedString())
        return [titleModel, textModel]
    }
}
