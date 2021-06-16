//
//  DayRow.swift
//  dvtWeatherApp
//
//  Created by Daniel Jacobs on 2021/06/12.
//

import SwiftUI

struct DayRow: View {
    
    var forecastViewModel: ForecastViewModel
    
    init(forecastViewModel: ForecastViewModel){
        self.forecastViewModel = forecastViewModel
    }
    
    var body: some View {
        
        HStack() {
            WeatherText(text: forecastViewModel.day, size: .regular, alignment: .leading).frame(maxWidth: .infinity, alignment: .leading)
            
            Image(forecastViewModel.icon)
                .resizable()
                .frame(width: 25, height: 25)
                .aspectRatio(contentMode: .fit).frame( alignment: .center)
            
            WeatherText(text: forecastViewModel.temperature, size: .regular, alignment: .center, bold: true).frame(maxWidth: .infinity, alignment: .trailing)
        }.padding(10)
        
    }
}

struct DayRow_Previews: PreviewProvider {
    
    static let item: ForecastViewModel = ForecastListModel()
    
    static var previews: some View {
        VStack {
            DayRow(forecastViewModel: item).background(Color.sunny)
            DayRow(forecastViewModel: item).background(Color.sunny)
        }
    }
}
