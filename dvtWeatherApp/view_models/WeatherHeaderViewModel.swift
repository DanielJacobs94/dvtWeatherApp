//
//  WeatherHeaderViewModel.swift
//  dvtWeatherApp
//
//  Created by Daniel Jacobs on 2021/06/13.
//

import Foundation
import SwiftUI

protocol WeatherHeaderViewModel {
    
    var backgroundImage: String { get }
    var backgroundColor: Color { get }
    var currentTemp: String { get }
    var currentDescription: String { get }
}
