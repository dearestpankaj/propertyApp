//
//  PropertyListAPI.swift
//  PropertyApp
//
//  Created by Pankaj Sachdeva on 31/08/19.
//  Copyright © 2019 Pankaj Sachdeva. All rights reserved.
//

import Foundation
import RxSwift

/// Get property list from api using NetworkOperations
class PropertyListAPI: PropertyListAPIProtocol {
    
    /// get property list using Network operations and send list / error
    ///
    /// - Parameter cityId: city Id for properties
    /// - Returns: array or property or error as Single
    func getPropertyList(city cityId: String)  -> Single<[PropertyInfo]> {
        
        return Single<[PropertyInfo]>.create { (single) in
            NetworkOperations.fetchResponse(url:  NetworkURLS.propertiesBy(city: cityId)) { (result: Swift.Result<PropertyResponse, NetworkError>) in
                
                switch result {
                case .success(let photoResponse):
                    if photoResponse.properties.count > 0 {
                        single(.success(photoResponse.properties))
                    } else {
                        single(.error(NetworkError.noDataFound))
                    }
                case .failure(let error):
                    single(.error(error))
                }
            }
            return Disposables.create()
        }
    }
}
