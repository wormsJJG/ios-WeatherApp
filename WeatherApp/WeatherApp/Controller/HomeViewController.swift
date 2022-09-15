//
//  HomeViewController.swift
//  WeatherApp
//
//  Created by 정재근 on 2022/09/15.
//

import UIKit
import CoreLocation

class HomeViewController: UIViewController {
    
    @IBOutlet weak private var findCurrentLocationButton: UIButton!
    @IBOutlet weak private var searchTextField: UITextField!
    @IBOutlet weak private var searchButton: UIButton!
    @IBOutlet weak private var weatherImage: UIImageView!
    @IBOutlet weak private var temperatureLabel: UILabel!
    @IBOutlet weak private var cityLabel: UILabel!
    
    var weatherManger = WeatherManager()
    let locationManger = CLLocationManager()
    
    private func initSetting() {
        locationManger.delegate = self
        weatherManger.delegate = self
        searchTextField.delegate = self
        
        locationManger.requestLocation()
        locationManger.requestWhenInUseAuthorization()
    }
    
    @IBAction func didFindCurrentLocation(_ sender: Any) {
        locationManger.requestLocation()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initSetting()
    }
}

extension HomeViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            locationManger.stopUpdatingLocation()
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            weatherManger.fetchWeather(latitude: lat, longitude: lon)
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}

extension HomeViewController: WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
        DispatchQueue.main.async {
            self.temperatureLabel.text = weather.temperatureString
            self.weatherImage.image = UIImage(systemName: weather.conditionName)
            self.cityLabel.text = weather.cityName
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}

extension HomeViewController: UITextFieldDelegate {
    
    @IBAction func searchPressed(_ sender: UIButton) {
        searchTextField.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "도시를 입력해주세요;;"
            return false
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let city = searchTextField.text {
            weatherManger.fetchWeather(cityName: city)
        }
        searchTextField.text = ""
    }
}
