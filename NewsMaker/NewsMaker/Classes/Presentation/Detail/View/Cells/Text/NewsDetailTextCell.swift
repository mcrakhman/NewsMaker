//
//  DetailCell.swift
//  NewsMaker
//
//  Created by m.rakhmanov on 26.05.17.
//  Copyright © 2017 HeadHunterLLC. All rights reserved.
//

import UIKit

class NewsDetailTextCell: UITableViewCell {

    @IBOutlet weak var textView: UITextView!

    @IBOutlet weak var textViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var textViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var textViewLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var textViewTrailingConstraint: NSLayoutConstraint!

    override func awakeFromNib() {
        super.awakeFromNib()
        textView.textContainer.lineFragmentPadding = 0
        textView.textContainerInset = .zero
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    }
}

extension NewsDetailTextCell: ConfigurableCell {
    func configure(with viewModel: CellViewModel) {
        guard let viewModel = viewModel as? NewsDetailTextCellViewModel else { return }
        
        textView.attributedText = viewModel.text
    }
}

extension NewsDetailTextCell: CalculatableHeightCell {
    func calculateHeight(forWidth width: CGFloat, viewModel: CellViewModel) -> CGFloat {
        guard let viewModel = viewModel as? NewsDetailTextCellViewModel else { return 0 }

        textView.attributedText = viewModel.text
        let adjustedWidth = width - textViewLeadingConstraint.constant - textViewTrailingConstraint.constant
        let initialSize = CGSize(width: adjustedWidth,
                                 height: CGFloat.greatestFiniteMagnitude)
        let size = textView.sizeThatFits(initialSize)
        
        return ceil(size.height) + textViewTopConstraint.constant + textViewBottomConstraint.constant
    }
}
