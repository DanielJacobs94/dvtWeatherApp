//
//  WindModel.swift
//  dvtWeatherApp
//
//  Created by Daniel Jacobs on 2021/06/12.
//

import Foundation

class WindModel: Codable {
    
    var speed: Double?
    var degrees: Int?
    var gust: Double?
    
    enum CodingKeys: String, CodingKey {
        case speed = "speed"
        case degrees = "deg"
        case gust = "gust"
    }
}
