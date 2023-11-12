//
//  LocationManager.swift
//  Hey-Porori
//
//  Created by 이재원 on 2023/09/21.
//

import Foundation
import MapKit
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    static let shared = LocationManager()
    private var locationManager = CLLocationManager()
    
    @Published var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194), // Default to San Francisco.
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    
    @Published var location: CLLocation?
    
    override private init() {
        super.init()
        
        self.locationManager.delegate = self
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        self.region.center = location.coordinate
        print("load location")
        
        locationManager.stopUpdatingLocation() // 위치 업데이트 중지. 중지하지 않으면 메모리 누수와 함께 계속 위치를 불러와버리는 사태가.
    }
    
    func fetchCurrentLocation() {
        locationManager.startUpdatingLocation()
    }
}
