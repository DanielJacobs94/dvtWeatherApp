//
//  DoubleExtensions.swift
//  dvtWeatherApp
//
//  Created by Daniel Jacobs on 2021/06/13.
//

import Foundation

extension Double {
    
    func getTemperatureDisplay() -> String {
        
        return "\(Int(self.rounded()))°"
    }
}
