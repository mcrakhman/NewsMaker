//
//  FeedCellViewModelFactory.swift
//  NewsMaker
//
//  Created by m.rakhmanov on 26.05.17.
//  Copyright © 2017 HeadHunterLLC. All rights reserved.
//

import Foundation

protocol FeedCellViewModelFactory {
    func viewModels(fromNews news: [BriefNewsModel]) -> [CellViewModel]
}
