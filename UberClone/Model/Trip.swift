//
//  Trip.swift
//  UberClone
//
//  Created by WiCKed on 04.11.2021.
//

import CoreLocation
import CoreText

enum TripState: Int {
    case requested
    case accepted
    case driverArrived
    case inProgress
    case arrivedAtDestination
    case completed
}

struct Trip {
    
    var pickupCoordinates: CLLocationCoordinate2D!
    var destinationCoordinates: CLLocationCoordinate2D!
    let passengerUid: String!
    var driverUid: String?
    var state: TripState!
    
    init(passengerUid: String, dictionary: [String: Any]) {
        self.passengerUid = passengerUid
        if let pickupCoordinates = dictionary["pickupCoordinates"] as? NSArray {
            if let lat = pickupCoordinates[0] as? CLLocationDegrees, let lon = pickupCoordinates[1] as? CLLocationDegrees {
                self.pickupCoordinates = CLLocationCoordinate2D(latitude: lat, longitude: lon)
            }
        }
        if let destinationCoordinates = dictionary["destinationCoordinates"] as? NSArray {
            if let lat = destinationCoordinates[0] as? CLLocationDegrees, let lon = destinationCoordinates[1] as? CLLocationDegrees {
                self.destinationCoordinates = CLLocationCoordinate2D(latitude: lat, longitude: lon)
            }
        }
        self.driverUid = dictionary["driverUid"] as? String ?? ""
        if let state = dictionary["state"] as? Int {
            self.state = TripState(rawValue: state)
        }
    }
}
