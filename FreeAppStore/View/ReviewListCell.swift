//
//  ReviewListCell.swift
//  FreeAppStore
//
//  Created by sally on 2017. 5. 24..
//  Copyright © 2017년 sally. All rights reserved.
//

import UIKit
import Cosmos

class ReviewListCell: UITableViewCell {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var starRatingView: CosmosView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var contentLabel: UILabel!
    
    func load(review: Review) {
        titleLabel.text = review.title
        starRatingView.rating = review.rating
        nameLabel.text = review.name
        contentLabel.text = review.content
    }

}
