//
//  DetailInteractorOutput.swift
//  NewsMaker
//
//  Created by m.rakhmanov on 26.05.17.
//  Copyright © 2017 HeadHunterLLC. All rights reserved.
//

protocol DetailInteractorOutput: class {
    func didReceive(news: DetailNewsModel)
    func didFail(withError error: Error)
}
