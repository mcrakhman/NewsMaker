//
//  NewsDetailService.swift
//  NewsMaker
//
//  Created by m.rakhmanov on 29.05.17.
//  Copyright © 2017 HeadHunterLLC. All rights reserved.
//

typealias NewsDetailServiceCompletion = (() throws -> DetailNewsModel) -> ()

protocol NewsDetailService {
    func updateNews(withId identifier: String, completion: @escaping NewsDetailServiceCompletion)
    func obtainNews(withId identifier: String) throws -> DetailNewsModel?
}
