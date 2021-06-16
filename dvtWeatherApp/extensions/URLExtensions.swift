//
//  URLExtensions.swift
//  dvtWeatherApp
//
//  Created by Daniel Jacobs on 2021/06/13.
//

import Foundation

extension URL {
    init(_ string: StaticString) {
        self.init(string: "\(string)")!
    }
}
