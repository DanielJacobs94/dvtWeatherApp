//
//  StringExtensions.swift
//  dvtWeatherApp
//
//  Created by Daniel Jacobs on 2021/06/11.
//

import Foundation
import UIKit

extension String { 
    
    /// OpenWeatherMap API Key to be used for API calls
    static let WeatherApiKey = "1886fd30a63cc3f5cb1c482cc264fb27"
    
    /// Color for clear skies
    static let clearColor = "#47AB2F"
    /// Color for rainy weather
    static let rainyColor = "#57575D"
    /// Color for cloudy weather
    static let cloudyColor = "#54717A"
    /// White color
    static let whiteColor = "#FFF"
    
    func getDate(format: String = "yyyy-MM-dd HH:mm:ss") -> Date? {
        
        let formatter = DateFormatter()
    
        formatter.timeZone = NSTimeZone.local
        formatter.dateFormat = format
        
        if let date = formatter.date(from: self) {
            
            return date
        } else {
            return nil
        }
    }
}
