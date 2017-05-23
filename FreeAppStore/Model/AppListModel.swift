//
//  AppListModel.swift
//  FreeAppStore
//
//  Created by sally on 2017. 5. 22..
//  Copyright © 2017년 sally. All rights reserved.
//

import Alamofire
import SwiftyJSON

fileprivate struct JsonNames {
    static let FEED = "feed"
    static let ENTRY = "entry"
}

class AppListModel {
    private let APP_LIST_URL = "https://itunes.apple.com/kr/rss/topfreeapplications/limit=50/json"
    
    public private(set) var appList = [AppInfo]()
    
    func load() {
        Alamofire.request(APP_LIST_URL, method: .get, parameters: nil).responseJSON { response in
            guard let responseValue = response.result.value else { return }
            
            let json = JSON(responseValue)
            let feed = json[JsonNames.FEED]
            let entryArray = feed[JsonNames.ENTRY].arrayValue
            
            for entry in entryArray {
                let appInfo = AppInfo(entry)
                self.appList.append(appInfo)
            }
            
            NotificationCenter.default.post(name: Notification.Name(rawValue: Notifications.AppListDidChange), object: self)
        }
    }
}
