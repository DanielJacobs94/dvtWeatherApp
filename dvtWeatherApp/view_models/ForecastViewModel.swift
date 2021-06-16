//
//  ForecastViewModel.swift
//  dvtWeatherApp
//
//  Created by Daniel Jacobs on 2021/06/13.
//

import Foundation

protocol ForecastViewModel {
    
    var day: String { get }
    var icon: String { get }
    var temperature: String { get }
}
