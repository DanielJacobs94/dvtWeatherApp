//
//  WeatherHeader.swift
//  dvtWeatherApp
//
//  Created by Daniel Jacobs on 2021/06/13.
//
import Foundation
import SwiftUI
import Kingfisher

struct WeatherHeader: View {
    
    var viewModel: WeatherHeaderViewModel?
    
    init(viewModel: WeatherHeaderViewModel?) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        
        GeometryReader { geo in
            
            VStack {
                
                ZStack(alignment: .center) {
                    
                    Image(viewModel?.backgroundImage ?? "")
                        .resizable()
                        .aspectRatio(9/8, contentMode: .fill)
                        .frame(width: geo.size.width, alignment: .topLeading)
                        .clipped()
                    
                    VStack(spacing: 10) {
                        WeatherText(text: viewModel?.currentTemp ?? "", size: .header, alignment: .center)
                        WeatherText(text: viewModel?.currentDescription ?? "", size: .title, alignment: .center)
                    }
                }
            }
        }
        // Cheating the aspect ratio here to remove the seemingly transparent
        // bottom 2 pixels of the image
        .aspectRatio(90/79, contentMode: .fill).clipped()
    }
}

struct WeatherHeader_Previews: PreviewProvider {
    
    static var previews: some View {
        WeatherHeader(viewModel: nil).ignoresSafeArea(edges: .top)
    }
}
