//
//  ReviewModel.swift
//  FreeAppStore
//
//  Created by sally on 2017. 5. 24..
//  Copyright © 2017년 sally. All rights reserved.
//

import Alamofire
import SwiftyJSON

fileprivate struct JsonNames {
    static let FEED = "feed"
    static let ENTRY = "entry"
}

class ReviewListModel {
    private var REVIEW_URL = "https://itunes.apple.com/rss/customerreviews/id=APP_ID/json"
    public private(set) var reviewList = [Review]()
    
    init(appId: String) {
        REVIEW_URL = REVIEW_URL.replacingOccurrences(of: "APP_ID", with: appId)
    }
    
    func load() {
        Alamofire.request(REVIEW_URL, method: .get).responseJSON { response in
            guard let responseValue = response.result.value else { return }
            
            let json = JSON(responseValue)
            let entryArray = json[JsonNames.FEED][JsonNames.ENTRY].arrayValue
            
            if (entryArray.count > 1) {
                for i in 1..<entryArray.count {
                    let review = Review(entryArray[i])
                    self.reviewList.append(review)
                }
            }
            
            NotificationCenter.default.post(name: Notification.Name(rawValue: Notifications.ReviewListDidChange), object: self)
        }
    }
}
