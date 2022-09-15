//
//  WeatherManagerDelegate.swift
//  WeatherApp
//
//  Created by 정재근 on 2022/09/15.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}
