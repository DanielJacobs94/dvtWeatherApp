//
//  CityModel.swift
//  dvtWeatherApp
//
//  Created by Daniel Jacobs on 2021/06/12.
//

import Foundation

class CityModel: Codable {
    
    var id: CLongLong?
    var name: String?
    var coordinates: CoordinateModel?
    var country: String?
    var population: CLongLong?
    var timezone: Int?
    var sunrise: CLongLong?
    var sunset: CLongLong?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case coordinates = "coordinates"
        case country = "country"
        case population = "population"
        case timezone = "timezone"
        case sunrise = "sunrise"
        case sunset = "sunset"
    }
}
