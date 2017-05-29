//
//  FeedInteractorOutput.swift
//  NewsMaker
//
//  Created by m.rakhmanov on 26.05.17.
//  Copyright © 2017 HeadHunterLLC. All rights reserved.
//

protocol FeedInteractorOutput: class {
    func didReceive(news: [BriefNewsModel])
    func didFail(withError error: Error)
}
