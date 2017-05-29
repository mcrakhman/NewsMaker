//
//  CoreFactory.swift
//  NewsMaker
//
//  Created by m.rakhmanov on 26.05.17.
//  Copyright © 2017 HeadHunterLLC. All rights reserved.
//

protocol CoreFactory {
    func newsFetcher() -> NewsFetcher
    func detailNewsFetcher() -> DetailNewsFetcher
    func newsCleaner() -> NewsCleaner
    func briefNewsMapper() -> BriefNewsMapper
    func detailNewsMapper() -> DetailNewsMapper
    func networkClient() -> NetworkClient
    func urlFactory() -> URLFactory
    func requestFactory() -> RequestFactory
    func jsonDeserializer() -> Deserializer
}
