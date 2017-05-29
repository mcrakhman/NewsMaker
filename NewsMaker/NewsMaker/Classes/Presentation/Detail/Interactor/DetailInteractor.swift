//
//  DetailInteractor.swift
//  NewsMaker
//
//  Created by m.rakhmanov on 26.05.17.
//  Copyright © 2017 HeadHunterLLC. All rights reserved.
//

import Foundation

final class DetailInteractor {
    weak var output: DetailInteractorOutput!
    fileprivate let newsDetailService: NewsDetailService

    init(newsDetailService: NewsDetailService) {
        self.newsDetailService = newsDetailService
    }
}

extension DetailInteractor: DetailInteractorInput {

    func findNews(withId identifier: String) {
        let completion: NewsDetailServiceCompletion = { [weak self] response in
            guard let strongSelf = self else {
                return
            }
            do {
                let news = try response()
                strongSelf.output.didReceive(news: news)
            } catch {
                strongSelf.output.didFail(withError: error)
            }
        }
        newsDetailService.updateNews(withId: identifier, completion: completion)
    }

    func obtainNewsLocally(withId identifier: String) {
        do {
            let news = try newsDetailService.obtainNews(withId: identifier)
            //output.didReceive(news: news)
        } catch {
            output.didFail(withError: error)
        }
    }
}
