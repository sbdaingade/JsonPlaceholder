//
//  ViewModel.swift
//  JSONPlaceholder
//
//  Created by Sachin Daingade on 06/11/19.
//  Copyright © 2019 Sachin Daingade. All rights reserved.
//

import Foundation
class ViewModel:Codable{
    
    let albumID, id: Int
    let title: String
    let url, thumbnailURL: String
    var newModel : Model?
    
    init(result: Model) {
        self.albumID = result.albumID
        self.id = result.id
        self.title = result.title
        self.thumbnailURL = result.thumbnailURL
        self.url = result.url
        
    }
    
}
