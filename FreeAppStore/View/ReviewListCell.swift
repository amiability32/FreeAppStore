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
    @IBOutlet var versionLabel: UILabel!
    @IBOutlet var starRatingView: CosmosView!
    
    func load(review: Review) {
        titleLabel.text = review.title
        versionLabel.text = review.version
        starRatingView.rating = review.rating
    }

}
