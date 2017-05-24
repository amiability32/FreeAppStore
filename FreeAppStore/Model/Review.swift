//
//  Review.swift
//  FreeAppStore
//
//  Created by sally on 2017. 5. 24..
//  Copyright © 2017년 sally. All rights reserved.
//

import SwiftyJSON

fileprivate struct JsonNames {
    static let AUTHOR = "author"
    static let NAME = "name"
    static let RATING = "im:rating"
    static let TITLE = "title"
    static let CONTENT = "content"
    static let LABEL = "label"
}

class Review {

    let name: String
    let rating: Double
    let title: String
    let content: String
    
    init(_ json: JSON) {
        name = json[JsonNames.AUTHOR][JsonNames.NAME][JsonNames.LABEL].stringValue
        rating = json[JsonNames.RATING][JsonNames.LABEL].doubleValue
        title = json[JsonNames.TITLE][JsonNames.LABEL].stringValue
        content = json[JsonNames.CONTENT][JsonNames.LABEL].stringValue
    }
}
