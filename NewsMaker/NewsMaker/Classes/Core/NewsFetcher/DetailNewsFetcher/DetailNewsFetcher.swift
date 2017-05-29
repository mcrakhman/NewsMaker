//
//  DetailNewsFetcher.swift
//  NewsMaker
//
//  Created by m.rakhmanov on 29.05.17.
//  Copyright © 2017 HeadHunterLLC. All rights reserved.
//

protocol DetailNewsFetcher {
    func fetchDetailNews(withIdentifier identifier: String) throws -> DetailNewsModel?
}
