//
//  dvtWeatherAppApp.swift
//  dvtWeatherApp
//
//  Created by Daniel Jacobs on 2021/06/11.
//

import SwiftUI

@main
struct dvtWeatherAppApp: App {
    
    var defaults: WeatherAppDefaults
    var mainViewModel: MainViewModel
    
    init() {
        defaults = WeatherAppDefaults()
        mainViewModel = MainViewModel(defaults: defaults)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(defaults).environmentObject(mainViewModel)
        }
    }
}
