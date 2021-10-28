//
//  HomeController.swift
//  UberClone
//
//  Created by WiCKed on 29.10.2021.
//

import UIKit
import Firebase
import MapKit

class HomeController: UIViewController {
    
    // MARK: - Properties
    
    private let mapView = MKMapView()
    
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        checkIfUserIsLoggedIn()
    }
    
    // MARK: - API
    
    func checkIfUserIsLoggedIn() {
        if Auth.auth().currentUser?.uid == nil {
            print("DEBUG: User not logged in")
            DispatchQueue.main.async {
                let controller = UINavigationController(rootViewController: LoginController())
                self.present(controller, animated: true, completion: nil)
            }
        } else {
            print("DEBUG: User id is: \(Auth.auth().currentUser!.uid)")
            configureUI()
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
        } catch let error {
            print("DEBUG: error, \(error)")
        }
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        view.addSubview(mapView)
        mapView.frame = view.frame
    }

}
