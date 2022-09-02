//
//  Body.swift
//  Services VK
//
//  Created by Всеволод on 15.07.2022.
//

import Foundation

struct Body: Codable {
    var body : Services
    
    enum CodingKeys: String, CodingKey {
        case body = "body"
    }
}
