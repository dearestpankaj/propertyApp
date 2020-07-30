//
//  PropertyAttributes.swift
//  PropertyApp
//
//  Created by Pankaj Sachdeva on 01/09/19.
//  Copyright © 2019 Pankaj Sachdeva. All rights reserved.
//

import Foundation

class PropertyAttributes {
    
    class func getImageURL(images: [Image]?) -> String? {
        if let propertyImages = images, let image = propertyImages.first {
            return image.prefix + image.suffix
        }
        return nil
    }
    
    class func getCompleteAddress(address1: String?, address2: String?, city: City?) -> String {
        var address = "Address: "
        address = address + (address1 ?? "") + "" + (address2 ?? "")
        if let cityDetail = city {
            address = address + cityDetail.name + " " + cityDetail.country
        }
        return address
    }
}
