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
        let titleModel = NewsDetailTitleCellViewModel(dateString: dateFormatter.string(from: news.creationDate as Date),
                              text: news.title)
        let textModel = NewsDetailTextCellViewModel(text: news.content)
        return [titleModel, textModel]
    }
}
