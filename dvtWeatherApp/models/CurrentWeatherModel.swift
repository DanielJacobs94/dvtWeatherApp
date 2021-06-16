//
//  CurrentWeatherModel.swift
//  dvtWeatherApp
//
//  Created by Daniel Jacobs on 2021/06/12.
//

import Foundation
import SwiftUI

class CurrentWeatherModel: Codable {
    
    var coordinate: CoordinateModel?
    var weathers: [WeatherModel] = [WeatherModel]()
    var base: String?
    var main: TemperatureModel?
    var visibility: CLongLong?
    var windModel: WindModel?
    var clouds: CloudModel?
    var dt: CLongLong?
    var sysModel: SysModel?
    var timezone: CLongLong?
    var id: CLongLong?
    var name: String?
    var cod: Int?
    
    enum CodingKeys: String, CodingKey {
        case coordinate = "coordinate"
        case weathers = "weather"
        case base = "base"
        case main = "main"
        case visibility = "visibility"
        case windModel = "windModel"
        case clouds = "clouds"
        case dt = "dt"
        case sysModel = "sysModel"
        case timezone = "timezone"
        case id = "id"
        case name = "name"
        case cod = "cod"
    }
}

extension CurrentWeatherModel : WeatherHeaderViewModel {
    
    var backgroundImage: String {
        
        guard weathers.count > 0 else {
            return ""
        }
        
        guard let weatherItem = weathers.first, let weatherID = weatherItem.id else {
            return ""
        }
        
        return weatherID.getBackgroundImage()
    }
    
    var backgroundColor: Color {
        
        guard weathers.count > 0 else {
            return Color.gray
        }
        
        guard let weatherItem = weathers.first, let weatherID = weatherItem.id else {
            return Color.gray
        }
        
        return weatherID.getBackgroundColor()
    }
    
    var currentTemp: String {
        
        guard let tempModel = main else {
            return String.whiteColor
        }
        
        return tempModel.temp?.getTemperatureDisplay() ?? "-"
    }
    
    var currentDescription: String {
        
        guard weathers.count > 0 else {
            return ""
        }
        
        guard let weatherItem = weathers.first, let weatherID = weatherItem.id else {
            return ""
        }
        
        return weatherID.getWeatherDescription()
    }
}
