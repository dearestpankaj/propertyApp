//
//  PropertyDetailAPIProtocol.swift
//  PropertyApp
//
//  Created by Pankaj Sachdeva on 01/09/19.
//  Copyright © 2019 Pankaj Sachdeva. All rights reserved.
//

import Foundation
import RxSwift

/// Access property details api
protocol PropertyDetailsAPIProtocol {
    
    /// Get property details
    ///
    /// - Parameter propertyId: propertyId
    /// - Returns: Single of PropertyDetailsResponse
    func getPropertyDetails(property propertyId: String)  -> Single<PropertyDetailsResponse>
}
