//
//  FeedDataDisplayManagerImpl.swift
//  NewsMaker
//
//  Created by m.rakhmanov on 26.05.17.
//  Copyright © 2017 HeadHunterLLC. All rights reserved.
//

import UIKit

class FeedDataDisplayManagerImpl: NSObject {

    fileprivate let heightCalculator: TableViewHeightCalculator
    fileprivate let cellViewModelFactory: FeedCellViewModelFactory
    fileprivate var viewModels: [CellViewModel] = []
    fileprivate weak var delegate: FeedDataDisplayManagerDelegate?

    init(heightCalculator: TableViewHeightCalculator,
         cellViewModelFactory: FeedCellViewModelFactory,
         delegate: FeedDataDisplayManagerDelegate) {
        self.heightCalculator = heightCalculator
        self.cellViewModelFactory = cellViewModelFactory
        self.delegate = delegate
    }
}

extension FeedDataDisplayManagerImpl: FeedDataDisplayManager {

    func replace(news: [BriefNewsModel]) {
        heightCalculator.clearCache()
        viewModels = cellViewModelFactory.viewModels(fromNews: news)
    }

    func append(news: [BriefNewsModel]) {
        let newViewModels = cellViewModelFactory.viewModels(fromNews: news)
        viewModels += newViewModels
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return heightCalculator.height(for: indexPath.row,
                                       viewModel: viewModels[indexPath.row],
                                       tableView: tableView)
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = viewModels[indexPath.row]
        let cell = tableView.dequeueCell(viewModel.associatedCell)
        cell.configure(with: viewModel)

        return cell as! UITableViewCell
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        delegate?.willDisplayCell(at: indexPath)
    }
}
