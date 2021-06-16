//
//  ForecastModel.swift
//  dvtWeatherApp
//
//  Created by Daniel Jacobs on 2021/06/12.
//

import Foundation

class ForecastModel: Codable {
    
    var cod: String?
    var message: Int?
    var cnt: Int?
    var list: [ForecastListModel] = [ForecastListModel]()
    var city: CityModel?
    
    var filtered: [Dictionary<Date, [ForecastListModel]>.Element] {
        
        // Getting current calendar
        let calendar = Calendar.current
        
        let sortedList = list.sorted { (first, second) -> Bool in
            return first.filterDate.compare(second.filterDate) == .orderedAscending
        }
        
        // Grouping the items according to date, but only to the day level
        var dict = Dictionary(grouping: sortedList) { (listModel) -> Date in
            
            // Limiting date components to day, month and year
            let components = calendar.dateComponents([.day, .year, .month], from: listModel.filterDate)

            // This will let the dictionary compare only the "day" dates, ignoring time
            return calendar.date(from: components)!
        }
                  
        // filtering out any entries with a date key that isnt today
        dict = dict.filter({ (element) -> Bool in
            return !Calendar.current.isDateInToday(element.key)
        })
        
        // returning the dictionary, in array form, sorted by date ascending
        return dict.sorted { (first, second) -> Bool in
            return first.key < second.key
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case cod = "cod"
        case message = "message"
        case cnt = "cnt"
        case list = "list"
        case city = "city"
    }
}
