//
//  FeedViewOutput.swift
//  NewsMaker
//
//  Created by m.rakhmanov on 26.05.17.
//  Copyright © 2017 HeadHunterLLC. All rights reserved.
//

protocol FeedViewOutput {
    func viewIsReady()
    func willDisplayModel(at index: Int)
    func didTapActionButton()
    func didPullRefresh()
    func didSelectNews(withIdentifier identifier: String)
}
