//
//  Property.swift
//  PropertyApp
//
//  Created by Pankaj Sachdeva on 31/08/19.
//  Copyright © 2019 Pankaj Sachdeva. All rights reserved.
//

import Foundation
struct PropertyResponse: Codable {
    let properties: [PropertyInfo]
}
struct PropertyInfo: Codable {
    var name: String
    var propertyId: String
    var city: City
    var latitude: String
    var longitude: String
    var type: String
    var images: [Image]
    var overallRating: OverallRating
    
    private enum CodingKeys: String, CodingKey {
        case name = "name"
        case propertyId = "id"
        case city
        case images
        case overallRating
        case latitude
        case longitude
        case type
    }
}
struct City: Codable {
    var idCity: String
    var name: String
    var country: String
    var idCountry: String

    private enum CodingKeys: String, CodingKey {
        case idCity = "id"
        case name
        case country
        case idCountry
    }
}
struct Image: Codable {
    var suffix: String
    var prefix: String
}
struct OverallRating: Codable {
    var overall: Int?
    var numberOfRatings: Int
}
