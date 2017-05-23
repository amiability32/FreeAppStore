//
//  AppDetailVO.swift
//  FinanceAppStore
//
//  Created by sally on 2017. 4. 13..
//  Copyright © 2017년 sally. All rights reserved.
//

import SwiftyJSON

fileprivate struct JsonNames {
    static let ID = "trackId"
    static let NAME = "trackName"
    static let ARTIST_NAME = "artistName"
    static let ICON_URL = "artworkUrl100"
    static let SCREENSHOT_URLS = "screenshotUrls"
    static let DESCRIPTION = "description"
    static let STAR_RATING = "averageUserRatingForCurrentVersion"
    static let RATING_COUNT = "userRatingCountForCurrentVersion"
    static let SELLER_NAME = "sellerName"
    static let UPDATE_DATE = "currentVersionReleaseDate"
    static let VERSION = "version"
    static let RATING = "trackContentRating"
    static let MINIMUM_OS_VERSION = "minimumOsVersion"
}

class AppDetail {
    let id: Int
    let name: String
    let artistName: String
    let iconUrl: String
    let screenShotUrl: [String]
    let description: String
    let starRating: Double
    let ratingCount: Int
    let sellerName: String
    let updateDate: String
    let version: String
    let rating: String
    let minimumOSVersion: Double
    
    init(_ json: JSON) {
        id = json[JsonNames.ID].intValue
        name = json[JsonNames.NAME].stringValue
        artistName = json[JsonNames.ARTIST_NAME].stringValue
        iconUrl = json[JsonNames.ICON_URL].stringValue
        screenShotUrl = json[JsonNames.SCREENSHOT_URLS].arrayObject as! [String]
        description = json[JsonNames.DESCRIPTION].stringValue
        starRating = json[JsonNames.STAR_RATING].doubleValue
        ratingCount = json[JsonNames.RATING_COUNT].intValue
        sellerName = json[JsonNames.SELLER_NAME].stringValue
        updateDate = json[JsonNames.UPDATE_DATE].stringValue
        version = json[JsonNames.VERSION].stringValue
        rating = json[JsonNames.RATING].stringValue
        minimumOSVersion = json[JsonNames.MINIMUM_OS_VERSION].doubleValue
    }
    
}
