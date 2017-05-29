//
//  UserStoryFactoryImpl.swift
//  NewsMaker
//
//  Created by m.rakhmanov on 26.05.17.
//  Copyright © 2017 HeadHunterLLC. All rights reserved.
//

import UIKit

class UserStoryFactoryImpl: BaseFactory, UserStoryFactory {

    func feedModule() -> UIViewController {
        let newsFeedService = factoryProvider.serviceFactory().newsFeedService()
        let heightCalculator = factoryProvider.helperFactory().tableViewHeightCalculator()
        let dateFormatter = factoryProvider.helperFactory().dateFormatter()

        let view: FeedViewController = UIStoryboard.createControllerFromStoryboard(withName: "Main")
        let cellViewModelFactory = FeedCellViewModelFactoryImpl(dateFormatter: dateFormatter)
        let dataDisplayManager = FeedDataDisplayManagerImpl(heightCalculator: heightCalculator,
                                                            cellViewModelFactory: cellViewModelFactory,
                                                            delegate: view)
        
        let router = FeedRouter(transitionHandler: view)
        let interactor = FeedInteractor(newsFeedService: newsFeedService)
        let presenter = FeedPresenter(router: router, view: view)

        interactor.output = presenter
        presenter.interactor = interactor

        view.output = presenter
        view.dataDisplayManager = dataDisplayManager

        return view
    }

    func detailModule() -> UIViewController {
        return UIViewController()
    }
}
