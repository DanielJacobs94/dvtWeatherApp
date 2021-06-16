//
//  DateExtensions.swift
//  dvtWeatherApp
//
//  Created by Daniel Jacobs on 2021/06/13.
//

import Foundation

extension Date {
    
    func getDayName() -> String {
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat  = "EEEE"
        
        return dateFormatter.string(from: self)
    }
}
