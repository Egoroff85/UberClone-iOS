//
//  User.swift
//  UberClone
//
//  Created by WiCKed on 01.11.2021.
//

import CoreLocation

enum AccountType: Int {
    case passenger
    case driver
}

struct User {
    let fullname: String
    let email: String
    var accountType: AccountType!
    var location: CLLocation?
    let uid: String
    var homeLocation: String?
    var workLocation: String?
    var firstInitial: String { return String(fullname.prefix(1)) }
    
    init(uid: String, dictionary: [String: Any]) {
        self.uid = uid
        self.fullname = dictionary["fullname"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""

        if let homeLocation = dictionary["homeLocation"] as? String {
            self.homeLocation = homeLocation
        }
        
        if let workLocation = dictionary["workLocation"] as? String {
            self.workLocation = workLocation
        }
        
        if let index = dictionary["accountType"] as? Int {
            self.accountType = AccountType(rawValue: index)!
        }
    }
}
