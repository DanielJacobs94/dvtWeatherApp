//
//  SysModel.swift
//  dvtWeatherApp
//
//  Created by Daniel Jacobs on 2021/06/12.
//

import Foundation

class SysModel: Codable {
    
    var type: Int?
    var id: CLongLong?
    var country: String?
    var sunrise: CLongLong?
    var sunset: CLongLong?
    
    enum CodingKeys: String, CodingKey {
        case type = "type"
        case id = "id"
        case country = "country"
        case sunrise = "sunrise"
        case sunset = "sunset"
    }
}
