//
//  DetailNewsCleaner.swift
//  NewsMaker
//
//  Created by m.rakhmanov on 29.05.17.
//  Copyright © 2017 HeadHunterLLC. All rights reserved.
//

protocol DetailNewsCleaner {
    func deleteNews(withIdentifier identifier: String) throws
    func deleteAllDetailNews() throws
}
