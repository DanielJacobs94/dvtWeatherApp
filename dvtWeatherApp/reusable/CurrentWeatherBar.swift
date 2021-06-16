//
//  CurrentWeatherBar.swift
//  dvtWeatherApp
//
//  Created by Daniel Jacobs on 2021/06/13.
//

import Foundation
import SwiftUI

struct CurrentWeatherBar: View {
    
    var viewModel: WeatherBarViewModel?
    
    init(viewModel: WeatherBarViewModel?) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        
        HStack {
            VStack {
                WeatherText(text: viewModel?.minTemp ?? "-", size: .regular, alignment: .leading, bold: true)
                WeatherText(text: "min", size: .regular, alignment: .leading)
            }
            Spacer()
            VStack {
                WeatherText(text: viewModel?.currentTemp ?? "-", size: .regular, alignment: .center, bold: true)
                WeatherText(text: "Current", size: .regular, alignment: .center)
            }
            Spacer()
            VStack {
                WeatherText(text: viewModel?.maxTemp ?? "-", size: .regular, alignment: .trailing, bold: true)
                WeatherText(text: "max", size: .regular, alignment: .trailing)
            }
        }.padding([.leading, .trailing])
    }
}

struct CurrentWeatherBar_Previews: PreviewProvider {
    
    static var previews: some View {
        CurrentWeatherBar(viewModel: nil).background(Color.green)
    }
}
