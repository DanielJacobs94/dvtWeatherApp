//
//  WeatherBarViewModel.swift
//  dvtWeatherApp
//
//  Created by Daniel Jacobs on 2021/06/13.
//

import Foundation

protocol WeatherBarViewModel {
    
    var minTemp: String { get }
    var maxTemp: String { get }
    var currentTemp: String { get }
}
