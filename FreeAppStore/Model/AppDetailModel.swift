//
//  AppDetailModel.swift
//  FinanceAppStore
//
//  Created by sally on 2017. 4. 13..
//  Copyright © 2017년 sally. All rights reserved.
//

import Alamofire
import SwiftyJSON

fileprivate struct JsonNames {
    static let RESULTS = "results"
    static let ENTRY = "entry"
}

class AppDetailModel {
    private let APP_DETAIL_URL = "https://itunes.apple.com/lookup"
    private let parameters: [String : Any]
    private let appId: String
    public private(set) var appDetail: AppDetail?
    
    init(appId: String) {
        self.appId = appId
        self.parameters = ["id":appId, "country":"kr"]
    }
    
    func load() {
        Alamofire.request(APP_DETAIL_URL, method: .get, parameters: parameters).responseJSON { response in
            guard let responseValue = response.result.value else { return }
            
            let json = JSON(responseValue)
            let result = json[JsonNames.RESULTS].arrayValue[0]
            
            self.appDetail = AppDetail(result)
            
            NotificationCenter.default.post(name: Notification.Name(rawValue: Notifications.AppDetailDidChange), object: self)
        }
    }
}
