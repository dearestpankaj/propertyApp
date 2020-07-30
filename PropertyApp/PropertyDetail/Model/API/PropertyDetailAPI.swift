//
//  PropertyDetailAPI.swift
//  PropertyApp
//
//  Created by Pankaj Sachdeva on 01/09/19.
//  Copyright © 2019 Pankaj Sachdeva. All rights reserved.
//

import Foundation
import RxSwift


/// Get property detail from API
class PropertyDetailsAPI: PropertyDetailsAPIProtocol {
    
    /// get property details using Network operations and send PropertyDetailsResponse / error
    ///
    /// - Parameter propertyId: propertyId
    /// - Returns: PropertyDetailsResponse or error as Single
    func getPropertyDetails(property propertyId: String) -> Single<PropertyDetailsResponse> {
        
        return Single<PropertyDetailsResponse>.create { (single) in
            NetworkOperations.fetchResponse(url: NetworkURLS.propertiesBy(id: propertyId)) { (result: Swift.Result<PropertyDetailsResponse, NetworkError>) in
                
                switch result {
                case .success(let propertyDetail):
                    single(.success(propertyDetail))
                case .failure(let error):
                    single(.error(error))
                }
            }
            return Disposables.create()
        }
    }
    
}
