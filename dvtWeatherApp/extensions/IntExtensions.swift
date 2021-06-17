//
//  IntExtensions.swift
//  dvtWeatherApp
//
//  Created by Daniel Jacobs on 2021/06/13.
//

import Foundation
import SwiftUI

extension Int {
    
    func getBackgroundImage() -> String {
        
        if self == 800 {
            // Clear Skies
            return "forest_sunny"
            
        } else if (200...299).contains(self) || (300...399).contains(self) || (500...599).contains(self) {
            // Rainy
            return "forest_rainy"
            
        } else if (801...899).contains(self) {
            // Cloudy
            return "forest_cloudy"
            
        } else {
            return ""
        }
    }
    
    func getBackgroundColor() -> Color {
        
        if self == 800 {
            // Clear Skies
            return Color.sunny
            
        } else if (200...299).contains(self) || (300...399).contains(self) || (500...599).contains(self) {
            // Rainy
            return Color.rainy
            
        } else if (801...899).contains(self) {
            // Cloudy
            return Color.cloudy
            
        } else {
            return Color.gray
        }
    }
    
    func getWeatherDescription() -> String {
        
        if self == 800 {
            // Clear Skies
            return "SUNNY"
            
        } else if (200...299).contains(self) || (300...399).contains(self) || (500...599).contains(self) {
            // Rainy
            return "RAINY"
            
        } else if (801...899).contains(self) {
            // Cloudy
            return "CLOUDY"
            
        } else {
            return ""
        }
    }
    
    func getWeatherIcon() -> String {
        
        if self == 800 {
            // Clear Skies
            return "clear"
            
        } else if (200...299).contains(self) || (300...399).contains(self) || (500...599).contains(self) {
            // Rainy
            return "rain"
            
        } else if (801...899).contains(self) {
            // Cloudy
            return "partlysunny"
            
        } else {
            return ""
        }
    }
}
