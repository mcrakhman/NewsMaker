//
//  FeedRouter.swift
//  NewsMaker
//
//  Created by m.rakhmanov on 26.05.17.
//  Copyright © 2017 HeadHunterLLC. All rights reserved.
//

final class FeedRouter {
    fileprivate weak var transitionHandler: FeedViewInput!

    init(transitionHandler: FeedViewInput) {
        self.transitionHandler = transitionHandler
    }
}

extension FeedRouter: FeedRouterInput {

    func showDetailNews() {

    }
}
