//
//  JsonDecode.swift
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
}

struct Services: Codable {
    var res : [Service]
}

var services = [Service]()

func parse(json: Data) {
    let decoder = JSONDecoder()

    if let jsonServices = try? decoder.decode(Services.self, from: json) {
        services = jsonServices.res
        tableView.reloadData()
    }
}

func viewDidLoad() {
    
    let urlString = "https://publicstorage.hb.bizmrg.com/sirius/result.json"

    if let url = URL(string: urlString) {
        if (try? Data(contentsOf: url)) != nil {
            // we're OK to parse!
        }
    }
}


//struct JSONContainer: Decodable {
//    let body : [Service]
//}
//
//extension JSONContainer {
//    enum CodingKeys: String, CodingKey {
//        case body
//        enum ServicesKeys: String, CodingKey {
//            case serviceKey = "services"
//        }
//    }
//
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//
//        let servicesContainer = try container.nestedContainer(keyedBy: CodingKeys.ServicesKeys.self, forKey: .body)
//
//        body = try servicesContainer.decode([Service].self, forKey: .serviceKey)
//    }
//}

let json = """
{
    "body": {
      "services": [
        {
          "name": "Р’РљРѕРЅС‚Р°РєС‚Рµ",
          "description": "РЎР°РјР°СЏ РїРѕРїСѓР»СЏСЂРЅР°СЏ СЃРѕС†СЃРµС‚СЊ Рё РїРµСЂРІРѕРµ СЃСѓРїРµСЂРїСЂРёР»РѕР¶РµРЅРёРµ РІ Р РѕСЃСЃРёРё",
          "link": "https://vk.com/",
          "icon_url": "https://publicstorage.hb.bizmrg.com/sirius/vk.png"
        },
        {
          "name": "My.Games",
          "description": "РРіСЂС‹ РґР»СЏ РџРљ, РєРѕРЅСЃРѕР»РµР№ Рё СЃРјР°СЂС‚С„РѕРЅРѕРІ, РІ РєРѕС‚РѕСЂС‹Рµ РёРіСЂР°СЋС‚ СЃРѕС‚РЅРё РјРёР»Р»РёРѕРЅРѕРІ РіРµР№РјРµСЂРѕРІ",
          "link": "https://my.games/",
          "icon_url": "https://publicstorage.hb.bizmrg.com/sirius/mygames.png"
        },
        {
          "name": "РЎС„РµСЂСѓРј",
          "description": "РћРЅР»Р°Р№РЅ-РїР»Р°С‚С„РѕСЂРјР° РґР»СЏ РѕР±СѓС‡РµРЅРёСЏ Рё РѕР±СЂР°Р·РѕРІР°С‚РµР»СЊРЅС‹С… РєРѕРјРјСѓРЅРёРєР°С†РёР№",
          "link": "https://sferum.ru/?p=start",
          "icon_url": "https://publicstorage.hb.bizmrg.com/sirius/sferum.png"
        },
        {
          "name": "Р®Р»Р°",
          "description": "РЎРµСЂРІРёСЃ РѕР±СЉСЏРІР»РµРЅРёР№ РЅР° РѕСЃРЅРѕРІРµ РіРµРѕР»РѕРєР°С†РёРё Рё РёРЅС‚РµСЂРµСЃРѕРІ",
          "link": "https://youla.ru/",
          "icon_url": "https://publicstorage.hb.bizmrg.com/sirius/youla.png"
        },
        {
          "name": "РЎР°РјРѕРєР°С‚",
          "description": "РћРЅР»Р°Р№РЅ-СЂРµС‚РµР№Р»РµСЂ СЃ РґРѕСЃС‚Р°РІРєРѕР№ С‚РѕРІР°СЂРѕРІ Р·Р° 15 РјРёРЅСѓС‚",
          "link": "https://samokat.ru/",
          "icon_url": "https://publicstorage.hb.bizmrg.com/sirius/samokat.png"
        },
        {
          "name": "РЎРёС‚РёРґСЂР°Р№РІ",
          "description": "РљР°СЂС€РµСЂРёРЅРі-СЃРµСЂРІРёСЃ РІ РєСЂСѓРїРЅРµР№С€РёС… СЂРѕСЃСЃРёР№СЃРєРёС… РіРѕСЂРѕРґР°С…",
          "link": "https://citydrive.ru/",
          "icon_url": "https://publicstorage.hb.bizmrg.com/sirius/citydrive.png"
        },
        {
          "name": "РћР±Р»Р°РєРѕ",
          "description": "РЎРµСЂРІРёСЃ РґР»СЏ С…СЂР°РЅРµРЅРёСЏ С„Р°Р№Р»РѕРІ Рё СЃРѕРІРјРµСЃС‚РЅРѕР№ СЂР°Р±РѕС‚С‹ СЃ РЅРёРјРё",
          "link": "https://cloud.mail.ru/home/",
          "icon_url": "https://publicstorage.hb.bizmrg.com/sirius/cloud.png"
        },
        {
          "name": "Р’СЃРµ Р°РїС‚РµРєРё",
          "description": "РћРЅР»Р°Р№РЅ-СЃРµСЂРІРёСЃ РґР»СЏ РїРѕРёСЃРєР° Рё С‰Р·Р°РєР°Р·Р° Р»РµРєР°СЂСЃС‚РІ РїРѕ Р»СѓС‡С€РµР№ С†РµРЅРµ",
          "link": "https://vseapteki.ru/",
          "icon_url": "https://publicstorage.hb.bizmrg.com/sirius/apteki.png"
        },
        {
          "name": "РљР°Р»РµРЅРґР°СЂСЊ",
          "description": "РџР»Р°РЅРёСЂРѕРІР°РЅРёРµ РґРЅСЏ Рё СЌС„С„РµРєС‚РёРІРЅРѕРµ СѓРїСЂР°РІР»РµРЅРёРµ РІСЂРµРјРµРЅРµРј",
          "link": "https://calendar.mail.ru/",
          "icon_url": "https://publicstorage.hb.bizmrg.com/sirius/calendar.png"
        }
      ]
    },
    "status": 200
  }
"""

let data = json.data(using: .utf8)!
let res : [Service] = try! JSONDecoder().decode([Service].self, from: data)
print(res)
