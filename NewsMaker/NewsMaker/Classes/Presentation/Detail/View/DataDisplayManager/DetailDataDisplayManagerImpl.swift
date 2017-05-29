//
//  DetailDataDisplayManagerImpl.swift
//  NewsMaker
//
//  Created by m.rakhmanov on 26.05.17.
//  Copyright © 2017 HeadHunterLLC. All rights reserved.
//

import UIKit

class DetailDataDisplayManagerImpl: NSObject {

    fileprivate let heightCalculator: TableViewHeightCalculator
    fileprivate let cellViewModelFactory: DetailCellViewModelFactory
    fileprivate var viewModels: [CellViewModel] = []

    init(heightCalculator: TableViewHeightCalculator,
         cellViewModelFactory: DetailCellViewModelFactory) {
        self.heightCalculator = heightCalculator
        self.cellViewModelFactory = cellViewModelFactory
    }
}

extension DetailDataDisplayManagerImpl: DetailDataDisplayManager {

    func show(news: DetailNewsModel) {
        heightCalculator.clearCache()
        viewModels = cellViewModelFactory.viewModels(fromNews: news)
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
}
