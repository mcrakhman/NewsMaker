//
//  NewsDetailService.swift
//  NewsMaker
//
//  Created by m.rakhmanov on 29.05.17.
//  Copyright © 2017 HeadHunterLLC. All rights reserved.
//

typealias NewsDetailServiceCompletion = (() throws -> DetailNewsModel?) -> ()

protocol NewsDetailService {
    func updateNews(withConfiguration configuration: NewsDetailServiceConfiguration,
                    completion: @escaping NewsDetailServiceCompletion)
    func obtainNews(withConfiguration configuration: NewsDetailServiceConfiguration) throws -> DetailNewsModel?
}
