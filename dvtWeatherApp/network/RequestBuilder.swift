//
//  RequestBuilder.swift
//  dvtWeatherApp
//
//  Created by Daniel Jacobs on 2021/06/11.
//

import Foundation

/// Protocol that represents a network request, used to customize the various properties
protocol RequestBuilder {

    var path: String { get }
    var method: NetworkMethod { get }
    var headers: [String: String]? { get }
    var body: Data? { get }
    var queryItems: [URLQueryItem]? { get }
}

/// Extension that provides a method that actually builds the network request, using the properties set in WeatherBuilder.swift
extension RequestBuilder {

    func create(for enviroment: NetworkEnvironment) -> URLRequest {

        // Creating BaseURL, which is set inNetworkEnvironment
        guard var url = URL(string: enviroment.rawValue) else {
            fatalError()
        }
        
        // Appending Path
        url.appendPathComponent(path)
        
        // Adding queryItems to URL, if there are any
        if let qItems = queryItems, qItems.count > 0 {
            
            guard var components = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
                fatalError()
            }
            components.queryItems = qItems
            
            url = components.url ?? url
        }
        
        // Creating request using URL
        var request = URLRequest(url: url)
        
        // Headers
        request.allHTTPHeaderFields = headers
        
        // Method
        request.httpMethod = method.rawValue.uppercased()
        
        // Body (For POSTS, PUTS)
        if let bodyData = body {
            
            request.httpBody = bodyData
        }
        
        return request
    }
}
