//
//  ServiceFactory.swift
//  NewsMaker
//
//  Created by m.rakhmanov on 26.05.17.
//  Copyright © 2017 HeadHunterLLC. All rights reserved.
//

protocol ServiceFactory {
    func newsFeedService() -> NewsFeedService
    func newsDetailService() -> NewsDetailService
}
