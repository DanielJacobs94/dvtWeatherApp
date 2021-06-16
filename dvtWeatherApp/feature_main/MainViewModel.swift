//
//  MainViewModel.swift
//  dvtWeatherApp
//
//  Created by Daniel Jacobs on 2021/06/13.
//
import Foundation
import Combine
import CoreLocation

class MainViewModel : NSObject, ObservableObject, WeatherService {
    
    var network: NetworkProtocol = NetworkProvider.shared.network
    var defaults: WeatherAppDefaults?
    
    var cancellables = Set<AnyCancellable>()
    
    @Published var isLoading: Bool = true
    @Published var weatherHeader: WeatherHeaderViewModel?
    @Published var weatherBar: WeatherBarViewModel?
    @Published var forecasts: [ForecastListModel] = [ForecastListModel]()
    @Published var userLatitude: Double = 0
    @Published var userLongitude: Double = 0
    
    @Published var isShowingLocationConfirm: Bool = false
    
    private let locationManager = CLLocationManager()
    private var locationStatus: CLAuthorizationStatus?
    private var lastKnownLocation: CLLocationCoordinate2D?
    
    init(defaults: WeatherAppDefaults?) {
        self.defaults = defaults
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyReduced
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }
    
    convenience override init() {
        self.init(defaults: nil)
    }
    
    deinit {
        cancellables.removeAll()
    }
    
    func startLocation() {
        
        self.isLoading = true
        self.isShowingLocationConfirm = false
        
        DispatchQueue.main.async {
            
            if self.locationStatus == .authorizedWhenInUse || self.locationStatus == .authorizedAlways {
                
                if let location = self.lastKnownLocation {
                    
                    self.fetchFiveDay(lat: location.latitude, lng: location.longitude)
                    self.fetchCurrent(lat: location.latitude, lng: location.longitude)
                    
                } else {
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        self.startLocation()
                    }
                }
            } else {
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self.startLocation()
                }
            }
        }
    }
    
    private func fetchFiveDay(lat: Double, lng: Double) {
        
        let cancellable = self.getFiveDayForecast(lat: lat, lng: lng)
            .sink { (result) in
                switch result {
                case .failure(let error):
                    print("Handle error: \(error)")
                    
                case .finished:
                    break
                }
            } receiveValue: { (responseModel) in
                
                var list = [ForecastListModel]()
                
                for item in responseModel.filtered {
                    
                    if let value = item.value.randomElement() {
                        list.append(value)
                    }
                }
                
                DispatchQueue.main.async {
                    self.forecasts = list
                    self.isLoading = false
                }
            }

        cancellables.insert(cancellable)
    }
    
    private func fetchCurrent(lat: Double, lng: Double) {
        
        let cancellable = self.getCurrentWeather(lat: lat, lng: lng)
            .sink { (result) in
                switch result {
                case .failure(let error):
                    print("Handle error: \(error)")
                    
                case .finished:
                    break
                }
            } receiveValue: { (responseModel) in
                
                DispatchQueue.main.async {
                    self.weatherHeader = responseModel
                    
                    if let tempModel = responseModel.main {
                        self.weatherBar = tempModel
                    }
                    self.isLoading = false
                }
            }

        cancellables.insert(cancellable)
    }
}

extension MainViewModel: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }

        self.lastKnownLocation = location.coordinate
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        self.locationStatus = status
        
        if self.locationStatus != .authorizedWhenInUse && self.locationStatus != .authorizedAlways {
            
            // TODO Ask the user for permission again
            self.isLoading = false
            self.isShowingLocationConfirm = true
        }
    }
}
