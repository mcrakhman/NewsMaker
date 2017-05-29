//
//  FeedDataDisplayManager.swift
//  NewsMaker
//
//  Created by m.rakhmanov on 26.05.17.
//  Copyright © 2017 HeadHunterLLC. All rights reserved.
//

import UIKit

protocol FeedDataDisplayManager: UITableViewDelegate, UITableViewDataSource {
    func append(news: [BriefNewsModel])
    func replace(news: [BriefNewsModel])
}
