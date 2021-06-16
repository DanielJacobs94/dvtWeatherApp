//
//  NetworkManager.swift
//  dvtWeatherApp
//
//  Created by Daniel Jacobs on 2021/06/11.
//

import Foundation
import Combine

/// Manager that conforms to NetworkProtocol.
/// This is where you would set your network environment, and the actual execution of a request, decoding the response, and returning the result is handled.
struct NetworkManager: NetworkProtocol {
    
    var environment: NetworkEnvironment = .live

    var decoder: JSONDecoder = JSONDecoder()
    
    func request<T: Decodable>(with builder: RequestBuilder) -> AnyPublisher<T, APIError> {

        let request = builder.create(for: environment)

        return URLSession.shared
            .dataTaskPublisher(for: request)
            .receive(on: DispatchQueue.main)
            .mapError { _ in APIError.unknown }
            .flatMap { data, response -> AnyPublisher<T, APIError> in
                
                if let response = response as? HTTPURLResponse {
                    
                    if (200...299).contains(response.statusCode) {
                    
                        let str = String(decoding: data, as: UTF8.self)
                        #if DEBUG
                        print(str)
                        print(response)
                        #endif
                        
                        // Decoding the response to the type specified, will fail if decoding fails.
                        return Just(data)
                            .decode(type: T.self, decoder: decoder)
                            .mapError { error in
                                
                                #if DEBUG
                                print(error)
                                #endif
                                return APIError.decodingError
                            }
                            .eraseToAnyPublisher()
                        
                    } else {
                        
                        // Returning an Error code if a non-success status code is returned.
                        return Fail(error: APIError.httpError(response.statusCode))
                            .eraseToAnyPublisher()
                    }
                }
                
                return Fail(error: APIError.unknown)
                        .eraseToAnyPublisher()
            }
            .eraseToAnyPublisher()
    }
}
