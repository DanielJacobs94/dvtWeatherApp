//
//  NetworkMethod.swift
//  dvtWeatherApp
//
//  Created by Daniel Jacobs on 2021/06/11.
//

import Foundation

/// Used to determine the HTTP Method of a request
enum NetworkMethod: String {
    case get
    case post
    case put
    case patch
    case delete
}
