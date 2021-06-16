//
//  WeatherBuilder.swift
//  dvtWeatherApp
//
//  Created by Daniel Jacobs on 2021/06/12.
//

import Foundation

/// Enum class used to denote the web requests that the app can execute, with specified parameters
enum WeatherBuilder {
    case getCurrentWeather(lat: Double, lng: Double)
    case getFiveDayForecast(lat: Double, lng: Double)
}

/// Having WeatherBuilder conform to RequestBuilder allows us to take the parameters for every request and customize the request that eventually gets executed by
/// a class the confroms to NetworkProtocol
extension WeatherBuilder: RequestBuilder {
    
    var path: String {
        
        switch self {
        case .getCurrentWeather:
            return "weather"
        case .getFiveDayForecast:
            return "forecast"
        }
    }
    
    var method: NetworkMethod {
        
        switch self {
        case .getCurrentWeather, .getFiveDayForecast:
            return NetworkMethod.get
        }
    }
    
    var headers: [String : String]? {
        return ["Connection" : "keep-alive"]
    }
    
    var body: Data? {
        return nil
    }
    
    var queryItems: [URLQueryItem]? {
        
        switch self {
        case let .getCurrentWeather(lat, lng):
            return [URLQueryItem(name: "appid", value: String.WeatherApiKey),
                    URLQueryItem(name: "units", value: "metric"),
                    URLQueryItem(name: "lat", value: String(lat)),
                    URLQueryItem(name: "lon", value: String(lng))]
            
        case let .getFiveDayForecast(lat, lng):
            return [URLQueryItem(name: "appid", value: String.WeatherApiKey),
                    URLQueryItem(name: "units", value: "metric"),
                    URLQueryItem(name: "lat", value: String(lat)),
                    URLQueryItem(name: "lon", value: String(lng))]
        }
    }
}
