//
//  FeedPresenter.swift
//  NewsMaker
//
//  Created by m.rakhmanov on 26.05.17.
//  Copyright © 2017 HeadHunterLLC. All rights reserved.
//

import Foundation

final class FeedPresenter {
    fileprivate struct Constants {
        static let amountPerPage = 20
        static let noNewsFoundMessage = "Новости не найдены, нажмите ок, чтобы перезагрузить"
    }

    fileprivate let router: FeedRouterInput
    fileprivate weak var view: FeedViewInput!
    var interactor: FeedInteractorInput!

    fileprivate var currentDate: Date?
    fileprivate var currentPage = 0

    init(router: FeedRouterInput, view: FeedViewInput) {
        self.router = router
        self.view = view
    }
}

extension FeedPresenter: FeedViewOutput {

    func viewIsReady() {
        view.showLoading()
        refreshNews()
    }

    func willDisplayModel(at index: Int) {
        if (index + 1) / Constants.amountPerPage > currentPage {
            interactor.findNews(fromDate: currentDate as NSDate?, amount: Constants.amountPerPage)
        }
    }

    func didPullRefresh() {
        refreshNews()
    }

    func didTapActionButton() {
        view.showLoading()
        refreshNews()
    }

    func didSelectNews(withIdentifier identifier: String) {
        router.showDetailNews(withIdentifier: identifier)
    }

    fileprivate func refreshNews() {
        currentDate = nil
        interactor.findNews(fromDate: nil, amount: Constants.amountPerPage)
    }
}

extension FeedPresenter: FeedInteractorOutput {
    func didReceive(news: [BriefNewsModel]) {
        view.stopRefreshing()

        guard news.count > 0
            else {
                if currentPage == 0 {
                    view.showMessage(Constants.noNewsFoundMessage)
                } else {
                    view.hideBottomSpinner()
                }

                return
        }

        if currentDate == nil {
            view.replace(news: news)
            currentPage = 0
        } else {
            view.append(news: news)
            currentPage += 1
        }
        currentDate = news.last?.publicationDate as Date?
    }

    func didFail(withError error: Error) {
        interactor.obtainNewsLocally(fromDate: nil, amount: Constants.amountPerPage)
    }
}
