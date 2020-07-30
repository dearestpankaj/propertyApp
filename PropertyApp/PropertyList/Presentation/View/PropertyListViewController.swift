//
//  ViewController.swift
//  PropertyApp
//
//  Created by Pankaj Sachdeva on 31/08/19.
//  Copyright © 2019 Pankaj Sachdeva. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class PropertyListViewController: UIViewController {
    @IBOutlet weak var propertyTableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var viewModel: PropertyListViewModelProtocol?
    
    let seguePropertyDetail = "propertyDetail"
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = PropertyListViewModel()
        
        setupPropertyTableView()
        setupActivityIndicator()
    }
    
    /// Setup tableview binding and navigation
    private func setupPropertyTableView() {
        viewModel?.getPropertyList(city: "1530").subscribeOn(MainScheduler.instance).catchError({[weak self] (error) -> Single<[Property]> in
            self?.alert(title: "Error", message: "Unable to get properties, please try after some time")
            return Single.just([])
        }).asObservable()
            .bind(to: self.propertyTableView.rx.items(cellIdentifier: PropertyListTableViewCell.identifier, cellType: PropertyListTableViewCell.self)){ row, property, cell in
            cell.setupCell(property: property)
            }.disposed(by: self.disposeBag)
        
        self.propertyTableView.rx.modelSelected(Property.self).subscribe(onNext: { [weak self]  (property) in
            if let segue = self?.seguePropertyDetail {
                self?.performSegue(withIdentifier: segue, sender: property.propertyId)
            }
        }).disposed(by: self.disposeBag)
    }
    
    
    /// Display loader while api call
    private func setupActivityIndicator() {
        viewModel?.showLoading.subscribe(onNext: { [weak self] (showLoader) in
            self?.propertyTableView.isHidden = showLoader
            if showLoader {
                self?.activityIndicator.startAnimating()
            } else {
                self?.activityIndicator.stopAnimating()
            }
            }, onError: { [weak self] (error) in
                self?.propertyTableView.isHidden = true
                self?.activityIndicator.stopAnimating()
        }).disposed(by: self.disposeBag)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == seguePropertyDetail) {
            if let vc = segue.destination as? PropertyDetailsViewController, let propertyId = sender as? String {
                vc.propertyId = propertyId
            }
        }
    }
}

