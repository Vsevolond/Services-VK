//
//  Services.swift
//  Services VK
//
//  Created by Всеволод on 15.07.2022.
//

import Foundation


struct Service: Codable {
    let name : String
    let description : String
    let link : String
    let icon_url : String
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case description = "description"
        case link = "link"
        case icon_url = "icon_url"
    }
}
