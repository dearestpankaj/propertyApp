//
//  BaseViewModel.swift
//  PropertyApp
//
//  Created by Pankaj Sachdeva on 01/09/19.
//  Copyright © 2019 Pankaj Sachdeva. All rights reserved.
//

import Foundation
import RxCocoa

protocol BaseViewModelProtocol {
    var showLoading: BehaviorRelay<Bool>{ get }
}
