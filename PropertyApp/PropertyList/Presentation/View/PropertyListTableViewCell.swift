//
//  PropertyListTableViewCell.swift
//  PropertyApp
//
//  Created by Pankaj Sachdeva on 01/09/19.
//  Copyright © 2019 Pankaj Sachdeva. All rights reserved.
//

import UIKit
import AlamofireImage

class PropertyListTableViewCell: UITableViewCell {
    @IBOutlet weak var propertyNameLabel: UILabel!
    @IBOutlet weak var propertyImage: UIImageView!
    @IBOutlet weak var propertyTypeLabel: UILabel!
    @IBOutlet weak var overallRatingLabel: UILabel!
    static var identifier = "PropertyListTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.accessoryType = .disclosureIndicator
    }
    
    func setupCell(property: Property) {
        propertyNameLabel.text = property.name
        propertyTypeLabel.text = property.type
        overallRatingLabel.text = property.overallRatingPercentage
        propertyImage.image = UIImage(named: "placeholder")
        if let image = property.image, let url = URL(string: image) {
            propertyImage.af_setImage(withURL: url)
        }
    }
}
