//
//  FeedCellViewModelFactoryImpl.swift
//  NewsMaker
//
//  Created by m.rakhmanov on 26.05.17.
//  Copyright © 2017 HeadHunterLLC. All rights reserved.
//

import Foundation

class FeedCellViewModelFactoryImpl: FeedCellViewModelFactory {

    fileprivate let dateFormatter: DateFormatter

    init(dateFormatter: DateFormatter) {
        self.dateFormatter = dateFormatter
    }

    func viewModels(fromNews news: [BriefNewsModel]) -> [CellViewModel] {
        return news.map(viewModel)
    }

    private func viewModel(from model: BriefNewsModel) -> NewsFeedCellViewModel {
        let dateString = dateFormatter.string(from: model.publicationDate as Date)
        let title = model.text.toHtmlAttributedString()?.string ?? ""
        return NewsFeedCellViewModel(dateString: dateString,
                                     text: title,
                                     identifier: model.identifier)
    }
}
