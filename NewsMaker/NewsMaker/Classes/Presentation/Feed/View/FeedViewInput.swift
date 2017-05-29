//
//  FeedViewInput.swift
//  NewsMaker
//
//  Created by m.rakhmanov on 26.05.17.
//  Copyright © 2017 HeadHunterLLC. All rights reserved.
//

protocol FeedViewInput: class {
    func append(news: [BriefNewsModel])
    func replace(news: [BriefNewsModel])
    func showLoading()
    func stopRefreshing()
    func showBottomSpinner()
    func hideBottomSpinner()
    func showMessage(_ description: String)
}
