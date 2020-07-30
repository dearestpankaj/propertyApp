//
//  PropertyListViewModelProtocol.swift
//  PropertyApp
//
//  Created by Pankaj Sachdeva on 31/08/19.
//  Copyright © 2019 Pankaj Sachdeva. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

/// ViewModel to feed property list data to PropertyList View
protocol PropertyListViewModelProtocol {
    
    /// Observable for displaying loading
    var showLoading: BehaviorRelay<Bool>{ get}
    
    /// Get array of properties
    ///
    /// - Parameter cityID: cityId for fetching data
    /// - Returns: Single of array of properties
    func getPropertyList(city cityID: String) -> Single<[Property]>
}
