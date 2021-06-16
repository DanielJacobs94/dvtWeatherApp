//
//  NetworkEnvironment.swift
//  dvtWeatherApp
//
//  Created by Daniel Jacobs on 2021/06/11.
//

import Foundation

/// String associated enum used as the Base URL for network requests
enum NetworkEnvironment: String {
    case dev = "-"
    case beta = "--"
    case live = "https://api.openweathermap.org/data/2.5/"
}
