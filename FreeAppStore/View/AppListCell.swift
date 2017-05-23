//
//  AppListCell.swift
//  FinanceAppStore
//
//  Created by sally on 2017. 4. 14..
//  Copyright © 2017년 sally. All rights reserved.
//

import UIKit

class AppListCell: UITableViewCell {
    
    @IBOutlet var rankLabel: UILabel!
    @IBOutlet var iconImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    
    func load(id: Int, _ appInfo: AppInfo) {
        iconImageView.setRounded()
        
        rankLabel.text = "\(id)"
        iconImageView.af_setImage(withURL: URL.init(string: appInfo.iconUrl)!)
        nameLabel.text = appInfo.name
    }
}
