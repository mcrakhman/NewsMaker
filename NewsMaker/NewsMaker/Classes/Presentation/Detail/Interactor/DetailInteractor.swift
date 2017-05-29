//
//  DetailInteractor.swift
//  NewsMaker
//
//  Created by m.rakhmanov on 26.05.17.
//  Copyright © 2017 HeadHunterLLC. All rights reserved.
//

import Foundation

enum InteractorError: Error {
    case emptyDataReturned
}

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
                if let news = news {
                    strongSelf.output.didReceive(news: news)
                } else {
                    strongSelf.output.didFail(withError: InteractorError.emptyDataReturned)
                }
            } catch {
                strongSelf.output.didFail(withError: error)
            }
        }
        let configuration = NewsDetailServiceConfiguration(identifier: identifier)
        newsDetailService.updateNews(withConfiguration: configuration, completion: completion)
    }

    func obtainNewsLocally(withId identifier: String) {
        let configuration = NewsDetailServiceConfiguration(identifier: identifier)
        do {
            let news = try newsDetailService.obtainNews(withConfiguration: configuration)
            if let news = news {
                output.didReceive(news: news)
            } else {
                output.didFail(withError: InteractorError.emptyDataReturned)
            }
        } catch {
            output.didFail(withError: error)
        }
    }
}
