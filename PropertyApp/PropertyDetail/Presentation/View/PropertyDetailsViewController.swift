//
//  PropertyDetailViewController.swift
//  PropertyApp
//
//  Created by Pankaj Sachdeva on 31/08/19.
//  Copyright © 2019 Pankaj Sachdeva. All rights reserved.
//

import UIKit
import RxSwift
import AlamofireImage

class PropertyDetailsViewController: UIViewController {
    @IBOutlet weak var propertyNameLabel: UILabel!
    @IBOutlet weak var propertyImageView: UIImageView!
    @IBOutlet weak var propertyAddress: UILabel!
    @IBOutlet weak var propertyDescriptionLabel: UILabel!
    @IBOutlet weak var propertyDirectionLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var viewModel: PropertyDetailsViewModelProtocol?
    var propertyId: String?
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel = PropertyDetailsViewModel()
        
        setupData()
        setupActivityIndicator()
    }
    
    func setupData() {
        viewModel?.getPropertyDetails(property: propertyId ?? "").subscribe(onSuccess: { [weak self] (propertyDetails) in
            self?.propertyNameLabel.text = propertyDetails.name
            self?.propertyAddress.text = propertyDetails.address
            self?.propertyDescriptionLabel.text = propertyDetails.description
            self?.propertyDirectionLabel.text = propertyDetails.directions
            self?.propertyImageView.image = UIImage(named: "placeholder")
            if let image = propertyDetails.image, let url = URL(string: image) {
                self?.propertyImageView.af_setImage(withURL: url)
            }
            }, onError: { (error) in
                
        }).disposed(by: self.disposeBag)
    }
    
    func setupActivityIndicator() {
        viewModel?.showLoading.subscribe(onNext: { [weak self] (showLoader) in
            if showLoader {
                self?.activityIndicator.startAnimating()
            } else {
                self?.activityIndicator.stopAnimating()
            }
            self?.activityIndicator.isHidden = !showLoader
            }, onError: { [weak self] (error) in
                self?.activityIndicator.stopAnimating()
        }).disposed(by: self.disposeBag)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
