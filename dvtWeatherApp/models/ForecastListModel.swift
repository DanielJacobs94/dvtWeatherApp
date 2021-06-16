//
//  ForecastListModel.swift
//  dvtWeatherApp
//
//  Created by Daniel Jacobs on 2021/06/12.
//

import Foundation

class ForecastListModel: Identifiable, Codable {
    
    var id = UUID()
    var dt: CLongLong?
    var dt_text: String?
    var main: TemperatureModel?
    var weather: [WeatherModel] = [WeatherModel]()
    var clouds: CloudModel?
    var wind: WindModel?
    var visibility: CLongLong?
    var pop: Double?
    var sys: SysModel?
    
    var filterDate: Date {
        return dt_text?.getDate() ?? Date()
    }
    
    enum CodingKeys: String, CodingKey {
        case dt = "dt"
        case dt_text = "dt_txt"
        case main = "main"
        case weather = "weather"
        case clouds = "clouds"
        case wind = "wind"
        case visibility = "visibility"
        case pop = "pop"
        case sys = "sys"
    }
}

extension ForecastListModel : ForecastViewModel {
    
    var day: String {
        return filterDate.getDayName()
    }
    
    var icon: String {
        guard let item = weather.first, let weatherID = item.id else {
            return ""
        }
        
        return weatherID.getWeatherIcon()
    }
    
    var temperature: String {
        return main?.temp?.getTemperatureDisplay() ?? "-"
    }
}
