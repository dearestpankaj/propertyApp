//
//  PropertyListViewModel.swift
//  PropertyApp
//
//  Created by Pankaj Sachdeva on 31/08/19.
//  Copyright © 2019 Pankaj Sachdeva. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class PropertyListViewModel: PropertyListViewModelProtocol {
    var showLoading: BehaviorRelay<Bool>
    var propertyListApi: PropertyListAPIProtocol
    var disposeBag = DisposeBag()
    
    init() {
        propertyListApi = PropertyListAPI()
        showLoading = BehaviorRelay<Bool>(value: true)
    }
    
    /// Get list of Property as Single from API, update activity indicator in UI
    ///
    /// - Parameter cityID: cityID for property
    /// - Returns: Single array of Property
    func getPropertyList(city cityID: String) -> Single<[Property]> {
        let result = propertyListApi.getPropertyList(city: cityID).map({ propertInfo -> [Property] in
            propertInfo.map({
                return self.convertPropertyList(propertyInfo: $0)
            })
        })
        result.asObservable().map { _ in false }
            .startWith(true)
            .catchErrorJustReturn(false)
            .bind(to: showLoading)
            .disposed(by: disposeBag)
        return result
    }
    
    /// Convert PropertyInfo type model to Property for View
    ///
    /// - Parameter propertyInfo: PropertyInfo object
    /// - Returns: Property object for view
    private func convertPropertyList(propertyInfo: PropertyInfo) -> Property {
        let property = Property(propertyId: propertyInfo.propertyId, name: propertyInfo.name, type: "Property Type: " + propertyInfo.type, lowestPricePerNight: "", overallRatingPercentage: getRatingPercentage(overallRating: propertyInfo.overallRating), image: PropertyAttributes.getImageURL(images: propertyInfo.images))
        return property
    }
    
    /// get formated rating percentage
    ///
    /// - Parameter overallRating: OverallRating object
    /// - Returns: formatted rating percentage value
    private func getRatingPercentage(overallRating: OverallRating) -> String {
        return "Rating: " + String(overallRating.overall ?? 0) + "%"
    }
}
