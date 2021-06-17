//
//  dvtWeatherAppTests.swift
//  dvtWeatherAppTests
//
//  Created by Daniel Jacobs on 2021/06/11.
//

import XCTest
import SwiftUI
@testable import dvtWeatherApp

class dvtWeatherAppTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}

// MARK: Double Extensions
extension dvtWeatherAppTests {
    
    func testSuccessfulTempConversion() throws {
        let first = 27.6
        let convertedFirst = first.getTemperatureDisplay()
        XCTAssertEqual(convertedFirst, "28°")
        
        let second = 27.4
        let convertedSecond = second.getTemperatureDisplay()
        XCTAssertEqual(convertedSecond, "27°")
    }
    
    func testNilTempConversion() throws {
        let double: Double? = nil
        let converted = double?.getTemperatureDisplay()
        XCTAssertEqual(converted, nil)
    }
}

// MARK: Date Extensions
extension dvtWeatherAppTests {
    
    func testSuccessfulDayName() throws {
        
        let dString = "2021-06-16 18:00:00"
        
        let date = dString.getDate()!
        
        let dayName = date.getDayName()
        
        XCTAssertEqual(dayName, "Wednesday")
    }
}

// MARK: String Extensions
extension dvtWeatherAppTests {
    
    func testSuccessfulDateConversion() throws {
        
        let dString = "2021-06-16 18:00:00"
        
        let date = dString.getDate()
        
        var components = DateComponents()
        components.year = 2021
        components.month = 6
        components.day = 16
        components.hour = 18
        components.minute = 0
        components.second = 0
        
        let testDate = Calendar.current.date(from: components)
        
        XCTAssertNotNil(date)
        XCTAssertEqual(date, testDate)
    }
}

// MARK: Int Extensions
extension dvtWeatherAppTests {
    
    func testWeatherIcon() throws {
        
        let clearInt = 800.getWeatherIcon()
        XCTAssertEqual(clearInt, "clear")
        
        for i in 200...299 {
            XCTAssertEqual(i.getWeatherIcon(), "rain")
        }
        
        for i in 300...399 {
            XCTAssertEqual(i.getWeatherIcon(), "rain")
        }
        
        for i in 500...599 {
            XCTAssertEqual(i.getWeatherIcon(), "rain")
        }
        
        for i in 801...899 {
            XCTAssertEqual(i.getWeatherIcon(), "partlysunny")
        }
        
        let failInt1 = 900.getWeatherIcon()
        XCTAssertEqual(failInt1, "")
        
        let failInt2 = 100.getWeatherIcon()
        XCTAssertEqual(failInt2, "")
    }
    
    func testWeatherBackground() throws {
        
        let clearInt = 800.getBackgroundImage()
        XCTAssertEqual(clearInt, "forest_sunny")
        
        for i in 200...299 {
            XCTAssertEqual(i.getBackgroundImage(), "forest_rainy")
        }
        
        for i in 300...399 {
            XCTAssertEqual(i.getBackgroundImage(), "forest_rainy")
        }
        
        for i in 500...599 {
            XCTAssertEqual(i.getBackgroundImage(), "forest_rainy")
        }
        
        for i in 801...899 {
            XCTAssertEqual(i.getBackgroundImage(), "forest_cloudy")
        }
        
        let failInt1 = 900.getBackgroundImage()
        XCTAssertEqual(failInt1, "")
        
        let failInt2 = 100.getBackgroundImage()
        XCTAssertEqual(failInt2, "")
    }
    
    func testWeatherBackgroundColor() throws {
        
        let clearInt = 800.getBackgroundColor()
        XCTAssertEqual(clearInt, Color.sunny)
        
        for i in 200...299 {
            XCTAssertEqual(i.getBackgroundColor(), Color.rainy)
        }
        
        for i in 300...399 {
            XCTAssertEqual(i.getBackgroundColor(), Color.rainy)
        }
        
        for i in 500...599 {
            XCTAssertEqual(i.getBackgroundColor(), Color.rainy)
        }
        
        for i in 801...899 {
            XCTAssertEqual(i.getBackgroundColor(), Color.cloudy)
        }
        
        let failInt1 = 900.getBackgroundColor()
        XCTAssertEqual(failInt1, Color.gray)
        
        let failInt2 = 100.getBackgroundColor()
        XCTAssertEqual(failInt2, Color.gray)
    }
    
    func testWeatherDesc() throws {
        
        let clearInt = 800.getWeatherDescription()
        XCTAssertEqual(clearInt, "SUNNY")
        
        for i in 200...299 {
            XCTAssertEqual(i.getWeatherDescription(), "RAINY")
        }
        
        for i in 300...399 {
            XCTAssertEqual(i.getWeatherDescription(), "RAINY")
        }
        
        for i in 500...599 {
            XCTAssertEqual(i.getWeatherDescription(), "RAINY")
        }
        
        for i in 801...899 {
            XCTAssertEqual(i.getWeatherDescription(), "CLOUDY")
        }
        
        let failInt1 = 900.getBackgroundImage()
        XCTAssertEqual(failInt1, "")
        
        let failInt2 = 100.getBackgroundImage()
        XCTAssertEqual(failInt2, "")
    }
}
