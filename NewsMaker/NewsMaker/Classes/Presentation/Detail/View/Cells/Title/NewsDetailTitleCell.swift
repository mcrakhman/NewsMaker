//
//  DetailCell.swift
//  NewsMaker
//
//  Created by m.rakhmanov on 26.05.17.
//  Copyright © 2017 HeadHunterLLC. All rights reserved.
//

import UIKit

class NewsDetailTitleCell: UITableViewCell {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!

    @IBOutlet weak var infoViewLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var infoViewTrailingConstraint: NSLayoutConstraint!

    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel.preferredMaxLayoutWidth = contentView.bounds.width
            - infoViewLeadingConstraint.constant
            - infoViewTrailingConstraint.constant
    }
}

extension NewsDetailTitleCell: ConfigurableCell {
    func configure(with viewModel: CellViewModel) {
        guard let viewModel = viewModel as? NewsDetailTitleCellViewModel else { return }
        
        timeLabel.text = viewModel.dateString
        titleLabel.text = viewModel.text
    }
}
