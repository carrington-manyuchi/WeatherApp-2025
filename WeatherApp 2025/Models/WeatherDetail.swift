//
//  WeatherDetail.swift
//  WeatherApp 2025
//
//  Created by Manyuchi, Carrington C on 2025/04/12.
//

import Foundation

struct WeatherDetail: Codable {
    let main: String
    let description: String
    var icon: String
    
    init(main: String, description: String, icon: String) {
        self.main = main
        self.description = description
        self.icon = icon
    }
}
