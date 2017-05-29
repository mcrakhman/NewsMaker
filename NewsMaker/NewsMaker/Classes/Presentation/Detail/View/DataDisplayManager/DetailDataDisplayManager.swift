//
//  DetailDataDisplayManager.swift
//  NewsMaker
//
//  Created by m.rakhmanov on 26.05.17.
//  Copyright © 2017 HeadHunterLLC. All rights reserved.
//

import UIKit

protocol DetailDataDisplayManager: UITableViewDelegate, UITableViewDataSource {
    func show(news: DetailNewsModel)
}
