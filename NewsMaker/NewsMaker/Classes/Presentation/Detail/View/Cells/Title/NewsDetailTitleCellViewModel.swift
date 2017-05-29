//
//  DetailCellViewModel.swift
//  NewsMaker
//
//  Created by m.rakhmanov on 26.05.17.
//  Copyright © 2017 HeadHunterLLC. All rights reserved.
//

struct NewsDetailTitleCellViewModel: CellViewModel {
    let associatedCell: ConfigurableCell.Type = NewsDetailTitleCell.self
    let dateString: String
    let text: String

    init(dateString: String, text: String) {
        self.dateString = dateString
        self.text = text
    }
}
