//
//  WeatherService.swift
//  dvtWeatherApp
//
//  Created by Daniel Jacobs on 2021/06/12.
//

import Foundation
import Combine

/// This is the link between the network layer implementation and the viewModels that want to execute requests.
/// We define the methods here, along with their parameters and return types
protocol WeatherService {
    
    var network: NetworkProtocol { get }
    
    func getCurrentWeather(lat: Double, lng: Double) -> AnyPublisher<CurrentWeatherModel, APIError>
    
    func getFiveDayForecast(lat: Double, lng: Double) -> AnyPublisher<ForecastModel, APIError>
}

/// The NetworkProtocol's request method is called here for every request defined, with the corresponding type in WeatherBuilder that builds up the request.
extension WeatherService {
    
    func getCurrentWeather(lat: Double, lng: Double) -> AnyPublisher<CurrentWeatherModel, APIError> {
        return network.request(with: WeatherBuilder.getCurrentWeather(lat: lat, lng: lng))
            .eraseToAnyPublisher()
    }
    
    func getFiveDayForecast(lat: Double, lng: Double) -> AnyPublisher<ForecastModel, APIError> {
        return network.request(with: WeatherBuilder.getFiveDayForecast(lat: lat, lng: lng))
            .eraseToAnyPublisher()
    }
}
