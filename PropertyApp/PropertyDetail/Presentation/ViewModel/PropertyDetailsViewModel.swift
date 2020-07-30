//
//  PropertyDetailViewModel.swift
//  PropertyApp
//
//  Created by Pankaj Sachdeva on 01/09/19.
//  Copyright © 2019 Pankaj Sachdeva. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class PropertyDetailsViewModel: PropertyDetailsViewModelProtocol {
    var showLoading: BehaviorRelay<Bool>
    var propertyDetailsApi: PropertyDetailsAPIProtocol
    var disposeBag = DisposeBag()
    
    init() {
        propertyDetailsApi = PropertyDetailsAPI()
        showLoading = BehaviorRelay<Bool>(value: true)
    }
    
    func getPropertyDetails(property propertyID: String) -> Single<PropertyDetails> {
        let result = propertyDetailsApi.getPropertyDetails(property: propertyID).map({ propertyInfo -> PropertyDetails in
            return self.convertPropertyDetails(propertyInfo: propertyInfo)
        })
        result.asObservable()
            .map({ _ in false })
            .startWith(true)
            .catchErrorJustReturn(false)
            .bind(to: showLoading)
            .disposed(by: disposeBag)
        return result
    }
    
    private func convertPropertyDetails(propertyInfo: PropertyDetailsResponse) -> PropertyDetails {
        let propertyDetail = PropertyDetails(name: propertyInfo.name, address: PropertyAttributes.getCompleteAddress(address1: propertyInfo.address1, address2: propertyInfo.address2, city: propertyInfo.city), description: propertyInfo.description, directions: "Directions: "+propertyInfo.directions, image: PropertyAttributes.getImageURL(images: propertyInfo.images))
        return propertyDetail
    }
}
