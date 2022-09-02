//
//  Services.swift
//  Services VK
//
//  Created by Всеволод on 15.07.2022.
//

import Foundation


struct Services: Codable {
    var services : [Service]
    
    enum CodingKeys: String, CodingKey {
        case services = "services"
    }
}
