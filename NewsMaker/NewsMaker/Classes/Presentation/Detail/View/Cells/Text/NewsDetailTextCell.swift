//
//  DetailCell.swift
//  NewsMaker
//
//  Created by m.rakhmanov on 26.05.17.
//  Copyright © 2017 HeadHunterLLC. All rights reserved.
//

import UIKit

class NewsDetailTextCell: UITableViewCell {

    @IBOutlet weak var contentLabel: UILabel!

    @IBOutlet weak var contentLabelLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var contentLabelTrailingConstraint: NSLayoutConstraint!

    override func layoutSubviews() {
        super.layoutSubviews()
        contentLabel.preferredMaxLayoutWidth = contentView.bounds.width
            - contentLabelLeadingConstraint.constant
            - contentLabelTrailingConstraint.constant
    }
}

extension NewsDetailTextCell: ConfigurableCell {
    func configure(with viewModel: CellViewModel) {
        guard let viewModel = viewModel as? NewsDetailTextCellViewModel else { return }
        
        contentLabel.text = viewModel.text
    }
}
