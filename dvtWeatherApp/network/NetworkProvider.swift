//
//  NetworkProvider.swift
//  dvtWeatherApp
//
//  Created by Daniel Jacobs on 2021/06/11.
//

import Foundation

/// Singleton class to expose an instance of itself so viewModels can access the NetworkProtocol
class NetworkProvider: ObservableObject {
    
    static let shared: NetworkProvider = NetworkProvider()
    
    private init() {}
    
    @Published var network: NetworkProtocol = NetworkManager()
}
