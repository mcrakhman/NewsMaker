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
        return NewsFeedCellViewModel(dateString: dateFormatter.string(from: model.publicationDate as Date),
                                     text: model.text,
                                     identifier: model.identifier)
    }
}
