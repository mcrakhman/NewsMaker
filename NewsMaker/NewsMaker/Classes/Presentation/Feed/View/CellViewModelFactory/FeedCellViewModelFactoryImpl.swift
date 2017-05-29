//
//  FeedCellViewModelFactoryImpl.swift
//  NewsMaker
//
//  Created by m.rakhmanov on 26.05.17.
//  Copyright © 2017 HeadHunterLLC. All rights reserved.
//

import Foundation

class FeedCellViewModelFactoryImpl: FeedCellViewModelFactory {

    fileprivate struct Constants {
        static let breakSymbol = "-*-*-*-"
    }

    fileprivate let dateFormatter: DateFormatter

    init(dateFormatter: DateFormatter) {
        self.dateFormatter = dateFormatter
    }

    func viewModels(fromNews news: [BriefNewsModel]) -> [CellViewModel] {
        let parsedStrings = parsedHtmlStrings(fromNews: news)
        var viewModels: [CellViewModel] = []

        for (oneNews, string) in zip(news, parsedStrings) {
            viewModels.append(viewModel(from: oneNews, parsedHtml: string))
        }

        return viewModels
    }

    private func viewModel(from model: BriefNewsModel, parsedHtml: String) -> NewsFeedCellViewModel {
        let dateString = dateFormatter.string(from: model.publicationDate as Date)
        return NewsFeedCellViewModel(dateString: dateString,
                                     text: parsedHtml,
                                     identifier: model.identifier)
    }

    /// по отдельности из строк очень долго получать html из-за особенностей рендеринга, поэтому рендерим все строки вместе
    private func parsedHtmlStrings(fromNews news: [BriefNewsModel]) -> [String] {
        var allTexts = ""
        for oneNews in news {
            allTexts += oneNews.text + Constants.breakSymbol
        }

        let allNewsParsed = allTexts.toHtmlAttributedString()?.string ?? ""
        let titlesArray = allNewsParsed.components(separatedBy: Constants.breakSymbol)

        return titlesArray
    }
}
