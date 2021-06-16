//
//  TemperatureModel.swift
//  dvtWeatherApp
//
//  Created by Daniel Jacobs on 2021/06/12.
//

import Foundation

class TemperatureModel: Codable {
    
    var temp: Double?
    var feels_like: Double?
    var temp_min: Double?
    var temp_max: Double?
    var pressure: Int?
    var humidity: Int?
    var seaLevel: Int?
    var groundLevel: Int?
    var temp_kf: Double?
    
    enum CodingKeys: String, CodingKey {
        case temp = "temp"
        case feels_like = "feels_like"
        case temp_min = "temp_min"
        case temp_max = "temp_max"
        case pressure = "pressure"
        case humidity = "humidity"
        case seaLevel = "seaLevel"
        case groundLevel = "groundLevel"
        case temp_kf = "temp_kf"
    }
}

extension TemperatureModel : WeatherBarViewModel {
    
    var minTemp: String {
        
        guard let temp = temp_min else {
            return "-"
        }
        
        return temp.getTemperatureDisplay()
    }
    
    var maxTemp: String {
        
        guard let temp = temp_max else {
            return "-"
        }
        
        return temp.getTemperatureDisplay()
    }
    
    var currentTemp: String {
        
        guard let temp = temp else {
            return "-"
        }
        
        return temp.getTemperatureDisplay()
    }
}
