//
//  MainView.swift
//  dvtWeatherApp
//
//  Created by Daniel Jacobs on 2021/06/11.
//
import SwiftUI

struct MainView: View {
    
    @ObservedObject var viewModel: MainViewModel
    
    var body: some View {
        
        GeometryReader { geo in
            
            VStack(alignment: .center) {
                
                if (viewModel.isLoading) {
                    Spacer()
                    ProgressView().progressViewStyle(CircularProgressViewStyle())
                        .frame(alignment: .center)
                    Spacer()
                    
                } else if (viewModel.isShowingLocationConfirm) {
                    
                    VStack(spacing: 20) {
                        Text(":(").font(.system(size: 64))
                        Text("WeatherApp needs your location to show you the weather information for your area.")
                        
                        Button(action: {
                            UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
                        }, label: {
                            Text("Open Settings")
                        })
                    }.padding()
                    
                } else {
                    
                    WeatherHeader(viewModel: viewModel.weatherHeader)
                    
                    CurrentWeatherBar(viewModel: viewModel.weatherBar)
                    
                    ScrollView {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.forecasts, id: \.id) { item in
                                DayRow(forecastViewModel: item)
                            }
                        }
                    }
                }
            }
            .frame(width: geo.size.width, alignment: .center)
        }.ignoresSafeArea(edges: [.top, .bottom])
        .background(viewModel.isLoading ? Color(.white) : viewModel.weatherHeader?.backgroundColor ?? Color(.white))
        .onAppear() {
            viewModel.startLocation()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    
    static var vm = MainViewModel(defaults: WeatherAppDefaults())
    
    static var previews: some View {
        MainView(viewModel: vm)
    }
}
