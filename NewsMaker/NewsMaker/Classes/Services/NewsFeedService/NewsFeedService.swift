//
//  NewsFeedService.swift
//  NewsMaker
//
//  Created by m.rakhmanov on 27.05.17.
//  Copyright © 2017 HeadHunterLLC. All rights reserved.
//

typealias NewsFeedServiceCompletion = (() throws -> [BriefNewsModel]) -> ()

protocol NewsFeedService {
    func updateNews(withConfiguration configuration: NewsFeedServiceConfiguration,
                    completion: @escaping NewsFeedServiceCompletion)
    func obtainNews(withConfiguration configuration: NewsFeedServiceConfiguration) throws -> [BriefNewsModel]
}
