//
//  PropertyDetailViewModelProtocol.swift
//  PropertyApp
//
//  Created by Pankaj Sachdeva on 01/09/19.
//  Copyright © 2019 Pankaj Sachdeva. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol PropertyDetailsViewModelProtocol: BaseViewModelProtocol {
    func getPropertyDetails(property propertyID: String) -> Single<PropertyDetails>
}
