//
//  NewsFetcher.swift
//  NewsMaker
//
//  Created by m.rakhmanov on 28.05.17.
//  Copyright © 2017 HeadHunterLLC. All rights reserved.
//

import Foundation

protocol NewsFetcher {
    func fetchLastNews(fromDate date: NSDate?, amount: Int) throws -> [BriefNewsModel]
}
