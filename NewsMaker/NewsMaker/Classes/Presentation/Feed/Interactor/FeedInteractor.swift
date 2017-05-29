//
//  FeedInteractor.swift
//  NewsMaker
//
//  Created by m.rakhmanov on 26.05.17.
//  Copyright © 2017 HeadHunterLLC. All rights reserved.
//

import Foundation

final class FeedInteractor {
    weak var output: FeedInteractorOutput!
    fileprivate let newsFeedService: NewsFeedService

    init(newsFeedService: NewsFeedService) {
        self.newsFeedService = newsFeedService
    }
}

extension FeedInteractor: FeedInteractorInput {

    func findNews(fromDate date: NSDate?, amount: Int) {
        let configuration = NewsFeedServiceConfiguration(amountPerPage: amount, lastDate: date)
        let completion: NewsFeedServiceCompletion = { [weak self] response in
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
        newsFeedService.updateNews(withConfiguration: configuration, completion: completion)
    }

    func obtainNewsLocally(fromDate date: NSDate?, amount: Int) {
        let configuration = NewsFeedServiceConfiguration(amountPerPage: amount, lastDate: date)

        do {
            let news = try newsFeedService.obtainNews(withConfiguration: configuration)
            if news.count > 0 {
                output.didReceive(news: news)
            } else {
                output.didFail(withError: InteractorError.emptyDataReturned)
            }
        } catch {
            output.didFail(withError: error)
        }
    }
}
