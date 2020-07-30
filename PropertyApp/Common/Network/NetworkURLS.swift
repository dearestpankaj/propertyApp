//
//  NetworkURLS.swift
//  PropertyApp
//
//  Created by Pankaj Sachdeva on 31/08/19.
//  Copyright © 2019 Pankaj Sachdeva. All rights reserved.
//

import Foundation

let baseURL = "https://private-anon-4534cedb3f-practical3.apiary-mock.com/"

class NetworkURLS : NSObject {
    class func propertiesBy(city cityId: String)->String {
        let publicPhotoURL = baseURL + "cities/"+cityId+"/properties/"
        return publicPhotoURL
    }
    
    class func propertiesBy(id propertyId: String)->String {
        let publicPhotoURL = baseURL + "properties/"+propertyId
        return publicPhotoURL
    }
}
