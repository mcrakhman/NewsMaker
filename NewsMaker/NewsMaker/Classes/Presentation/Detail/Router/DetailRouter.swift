//
//  DetailRouter.swift
//  NewsMaker
//
//  Created by m.rakhmanov on 26.05.17.
//  Copyright © 2017 HeadHunterLLC. All rights reserved.
//

final class DetailRouter {
    fileprivate weak var transitionHandler: DetailViewInput!

    init(transitionHandler: DetailViewInput) {
        self.transitionHandler = transitionHandler
    }
}

extension DetailRouter: DetailRouterInput {}
