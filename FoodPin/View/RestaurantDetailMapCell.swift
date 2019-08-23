//
//  RestaurantDetailMapCell.swift
//  FoodPin
//
//  Created by ac1ra on 14/08/2019.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import UIKit
import MapKit

class RestaurantDetailMapCell: UITableViewCell {

    @IBOutlet weak var mapViewSmall: MKMapView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configMap(location:String){
        
        //Get location
        let geoCoder = CLGeocoder()
        
        print(location)
        geoCoder.geocodeAddressString(location, completionHandler: { placemarks, error in
            if let error = error{
                print(error.localizedDescription)
                return
            }
            if let placemarks = placemarks{
                let placemark = placemarks[0]
                //Add annotation
                let annotation = MKPointAnnotation()
                
                if let location = placemark.location{
                    //Display annotation
                    annotation.coordinate = location.coordinate
                    self.mapViewSmall.addAnnotation(annotation)
                    
                    //Set the zoom level
                    let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 250, longitudinalMeters: 250)
                    self.mapViewSmall.setRegion(region, animated: false)
                }
            }
        })
    }
}
