//
//  FeedInteractorInput.swift
//  NewsMaker
//
//  Created by m.rakhmanov on 26.05.17.
//  Copyright © 2017 HeadHunterLLC. All rights reserved.
//

import Foundation

protocol FeedInteractorInput {
    func findNews(fromDate date: NSDate?, amount: Int)
    func obtainNewsLocally(fromDate date: NSDate?, amount: Int)
}
