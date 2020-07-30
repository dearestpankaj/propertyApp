//
//  PropertyListAPIProtocol.swift
//  PropertyApp
//
//  Created by Pankaj Sachdeva on 31/08/19.
//  Copyright © 2019 Pankaj Sachdeva. All rights reserved.
//

import Foundation
import RxSwift

/// Access property list api
protocol PropertyListAPIProtocol {
    
    /// get property list from api
    ///
    /// - Parameter cityId: cityId
    /// - Returns: Single of PropertyInfo array
    func getPropertyList(city cityId: String)  -> Single<[PropertyInfo]>
}
