//
//  CloudModel.swift
//  dvtWeatherApp
//
//  Created by Daniel Jacobs on 2021/06/12.
//

import Foundation

class CloudModel: Codable {
    
    var all: Int?
    
    enum CodingKeys: String, CodingKey {
        case all = "all"
    }
}
