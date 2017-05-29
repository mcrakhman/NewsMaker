//
//  DetailCellViewModel.swift
//  NewsMaker
//
//  Created by m.rakhmanov on 26.05.17.
//  Copyright © 2017 HeadHunterLLC. All rights reserved.
//

import Foundation

struct NewsDetailTextCellViewModel: CellViewModel {
    let associatedCell: ConfigurableCell.Type = NewsDetailTextCell.self
    let text: NSAttributedString

    init(text: NSAttributedString) {
        self.text = text
    }
}
