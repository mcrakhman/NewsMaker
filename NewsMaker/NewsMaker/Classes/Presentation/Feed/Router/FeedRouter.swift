//
//  FeedRouter.swift
//  NewsMaker
//
//  Created by m.rakhmanov on 26.05.17.
//  Copyright © 2017 HeadHunterLLC. All rights reserved.
//

import UIKit

final class FeedRouter {
    fileprivate weak var transitionHandler: FeedViewInput!
    fileprivate let userStoryFactory: UserStoryFactory

    init(transitionHandler: FeedViewInput, userStoryFactory: UserStoryFactory) {
        self.transitionHandler = transitionHandler
        self.userStoryFactory = userStoryFactory
    }
}

extension FeedRouter: FeedRouterInput {

    func showDetailNews(withIdentifier identifier: String) {
        guard let currentViewController = transitionHandler as? UIViewController,
              let navigationController = currentViewController.navigationController
            else {
                return
        }

        let moduleConfiguration = DetailModuleConfiguration(identifier: identifier)
        let detailViewController = userStoryFactory.detailModule()
        if let provider = detailViewController as? ModuleConfigurableProvider,
           let configurable = provider.configurable {
            configurable.configure(with: moduleConfiguration)
        }

        navigationController.pushViewController(detailViewController, animated: true)
    }
}
