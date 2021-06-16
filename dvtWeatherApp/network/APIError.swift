//
//  APIError.swift
//  dvtWeatherApp
//
//  Created by Daniel Jacobs on 2021/06/11.
//

import Foundation

/// Enum class used to denote a kind of error that can be returned from a non-200 status code request
enum APIError: Error {
    case decodingError
    case httpError(Int)
    case unknown
}
