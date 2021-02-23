//
//  Travels.swift
//  Chris Travels
//
//  Created by Renato Mateus on 03/02/21.
//

import Foundation
import MapKit

struct Travel: Hashable, Codable, Identifiable{
    var id:Int
    var title:String
    var image:String
    var daysQuantity:String
    var price:String
    var coordinate: Coordinate
    
    var location: CLLocationCoordinate2D{
        CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude)
    }
}

struct Coordinate: Hashable, Codable{
    var latitude: Double
    var longitude: Double
}
