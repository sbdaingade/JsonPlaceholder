//
//  Model.swift
//  JSONPlaceholder
//
//  Created by Sachin Daingade on 06/11/19.
//  Copyright © 2019 Sachin Daingade. All rights reserved.
//

import Foundation
class Model: Codable {
    let albumID, id: Int
    let title: String
    let url, thumbnailURL: String
    
    enum CodingKeys: String, CodingKey {
        case albumID = "albumId"
        case id, title, url
        case thumbnailURL = "thumbnailUrl"
    }
    
    init(albumID: Int, id: Int, title: String, url: String, thumbnailURL: String) {
        self.albumID = albumID
        self.id = id
        self.title = title
        self.url = url
        self.thumbnailURL = thumbnailURL
    }
}
