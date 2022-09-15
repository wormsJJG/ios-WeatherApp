//
//  WeatherData.swift
//  WeatherApp
//
//  Created by 정재근 on 2022/09/15.
//

import Foundation

struct WeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
}

struct Weather: Codable {
    let id: Int
}
