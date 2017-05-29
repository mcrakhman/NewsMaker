//
//  DetailPresenter.swift
//  NewsMaker
//
//  Created by m.rakhmanov on 26.05.17.
//  Copyright © 2017 HeadHunterLLC. All rights reserved.
//

import Foundation

final class DetailPresenter {
    fileprivate struct Constants {
        static let noNewsFoundMessage = "Новость не найдена, нажмите ок, чтобы перезагрузить"
    }

    fileprivate let router: DetailRouterInput
    fileprivate weak var view: DetailViewInput!
    var interactor: DetailInteractorInput!

    fileprivate var identifier: String = ""

    init(router: DetailRouterInput, view: DetailViewInput) {
        self.router = router
        self.view = view
    }
}

extension DetailPresenter: DetailViewOutput {

    func viewIsReady() {
        refreshNews()
    }

    func didTapActionButton() {
        refreshNews()
    }

    fileprivate func refreshNews() {
        view.showLoading()
        interactor.findNews(withId: identifier)
    }
}

extension DetailPresenter: DetailInteractorOutput {
    func didReceive(news: DetailNewsModel) {
        view.show(news: news)
    }

    func didFail(withError error: Error) {
        if let error = error as? InteractorError, error == .emptyDataReturned {
            view.showMessage(Constants.noNewsFoundMessage)
        } else {
            interactor.obtainNewsLocally(withId: identifier)
        }
    }
}

extension DetailPresenter: ModuleConfigurable {
    func configure(with configuration: ModuleConfiguration) {
        guard let configuration = configuration as? DetailModuleConfiguration else { return }
        identifier = configuration.identifier
    }
}
