//
//  ViewController.swift
//  Pogoda
//
//  Created by Гость on 20.05.2022.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    let locationManager = CLLocationManager()
    var weather
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        startLocationManager()
        
    }

    func startLocationManager() {
        locationManager.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
            locationManager.pausesLocationUpdatesAutomatically = false
            locationManager.startUpdatingLocation()
        }
    }
    
    func updateWeatherInfo(latitube: Double, longtitube: Double) {
        let session = UISceneSession.shared
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude.description)lon=\(longtitube.description)&units=metric&lang=ru&APPID=b1f1358d63970d33d31d886a092a6755")
        let task = session.dataTask(with: url) { data, response, error} in
        guard error == nil else {
            print("DataTask error: \(error!.localizedDescription)")
            return
    }
        do{
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let lastLocation = locations.last{
            print(lastLocation.coordinate.latitude, lastLocation.coordinate.latitude)
        }
    }
}
