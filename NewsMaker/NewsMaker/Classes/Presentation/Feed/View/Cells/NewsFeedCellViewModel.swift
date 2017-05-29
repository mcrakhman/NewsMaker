//
//  FeedCellViewModel.swift
//  NewsMaker
//
//  Created by m.rakhmanov on 26.05.17.
//  Copyright © 2017 HeadHunterLLC. All rights reserved.
//

struct NewsFeedCellViewModel: CellViewModel {
    let associatedCell: ConfigurableCell.Type = NewsFeedCell.self
    let dateString: String
    let text: String
    let identifier: String

    init(dateString: String, text: String, identifier: String) {
        self.dateString = dateString
        self.text = text
        self.identifier = identifier
    }
}
