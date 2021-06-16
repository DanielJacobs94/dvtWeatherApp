//
//  WeatherUserDefaults.swift
//  dvtWeatherApp
//
//  Created by Daniel Jacobs on 2021/06/11.
//

import Foundation

class WeatherAppDefaults : ObservableObject {
    
    /// Sets a given value for a given key in standard User Defaults
    func setValue(key: String, value: Any?) {
        UserDefaults.standard.setValue(value, forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    /// Retrieves an optional value for a given key from standard User Defaults
    func getValue(key: String) -> Any? {
        return UserDefaults.standard.value(forKey: key)
    }
    
    /// Removes the value for a given key from standard User Defaults
    func purgeValue(key: String) {
        UserDefaults.standard.removeObject(forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    /// Removes all values from standard User Defaults
    func purgeAllValue() {
        let domain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: domain)
        UserDefaults.standard.synchronize()
    }
    
    /// Sets the given values for thegiven keys in standard User Defaults
    func setValue(keyValues: [String : Any?]) {
        keyValues.forEach { (pair) in
            
            let (key, value) = pair
            
            UserDefaults.standard.setValue(value, forKey: key)
        }
        UserDefaults.standard.synchronize()
    }
}
