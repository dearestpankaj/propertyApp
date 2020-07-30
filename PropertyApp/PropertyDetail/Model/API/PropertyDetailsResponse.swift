//
//  PropertyDetailsResponse.swift
//  PropertyApp
//
//  Created by Pankaj Sachdeva on 01/09/19.
//  Copyright © 2019 Pankaj Sachdeva. All rights reserved.
//

import Foundation

struct PropertyDetailsResponse: Codable {
    let propertyId: String
    let name: String
    let description: String
    let address1: String
    let address2: String
    let directions: String
    let city: City?
    var images: [Image]?
    
    private enum CodingKeys: String, CodingKey {
        case propertyId = "id"
        case name = "name"
        case description
        case address1
        case address2
        case directions
        case city
        case images
    }
}
