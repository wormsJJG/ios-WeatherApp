//
//  HomeViewController.swift
//  WeatherApp
//
//  Created by 정재근 on 2022/09/15.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak private var findCurrentLocationButton: UIButton!
    @IBOutlet weak private var searchTextField: UITextField!
    @IBOutlet weak private var searchButton: UIButton!
    @IBOutlet weak private var watherImage: UIImageView!
    @IBOutlet weak private var temperatureLabel: UILabel!
    @IBOutlet weak private var cityLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
