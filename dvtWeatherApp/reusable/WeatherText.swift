//
//  TemperatureText.swift
//  dvtWeatherApp
//
//  Created by Daniel Jacobs on 2021/06/12.
//

import Foundation
import SwiftUI

struct WeatherText: View {
    
    var text: String
    var size: TextSize
    var alignment: Alignment = .leading
    var bold: Bool = false
    
    init(text: String, size: TextSize, alignment: Alignment = .leading, bold: Bool = false) {
        self.text = text
        self.size = size
        self.alignment = alignment
        self.bold = bold
    }
    
    var body: some View {
        if bold {
            Text(text)
                .font(.system(size: size.rawValue))
                .bold()
                .foregroundColor(.white)
                .frame(minWidth: 0, alignment: alignment)
        } else {
            Text(text)
                .font(.system(size: size.rawValue))
                .foregroundColor(.white)
                .frame(minWidth: 0, alignment: alignment)
        }
    }
    
    enum TextSize: CGFloat {
        case header = 56.0
        case subHeader = 32.0
        case title = 24.0
        case subTitle = 20.0
        case regular = 16
        case small = 14.0
    }
}

struct WeatherText_Previews: PreviewProvider {
    
    static var maxWidth = CGFloat(300)
    static var previews: some View {
        VStack(spacing: 20)  {
            WeatherText(text: "Header", size: .header, alignment: .center, bold: true)
            WeatherText(text: "Sub Header", size: .subHeader, alignment: .center)
            WeatherText(text: "Title", size: .title, alignment: .trailing)
            WeatherText(text: "Sub Title", size: .subTitle, alignment: .trailing)
            WeatherText(text: "Regular", size: .regular)
            WeatherText(text: "Small", size: .small)
        }.background(Color.blue)
    }
}
