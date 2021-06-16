//
//  NetworkManager.swift
//  dvtWeatherApp
//
//  Created by Daniel Jacobs on 2021/06/11.
//

import Foundation
import Combine

/// Protocol used to execute requests built up using WeatherBuilder.swift that returns a generic type, as long as that type conforms to Decodable protocol
protocol NetworkProtocol {

    var decoder: JSONDecoder { get set }
    var environment: NetworkEnvironment { get set }
    
    func request<T: Decodable>(with builder: RequestBuilder) -> AnyPublisher<T, APIError>
}
