//
//  DetailViewInput.swift
//  NewsMaker
//
//  Created by m.rakhmanov on 26.05.17.
//  Copyright © 2017 HeadHunterLLC. All rights reserved.
//

protocol DetailViewInput: class {
    func show(news: DetailNewsModel)
    func showLoading()
    func showMessage(_ description: String)
}
