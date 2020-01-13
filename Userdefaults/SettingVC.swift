//
//  SettingVC.swift
//  Userdefaults
//
//  Created by Tsering Lama on 1/13/20.
//  Copyright © 2020 Tsering Lama. All rights reserved.
//

import UIKit

class SettingVC: UITableViewController {
    
    @IBOutlet weak var measurementText: UILabel!
    @IBOutlet weak var unitText: UILabel!
    @IBOutlet weak var currentPic: UIImageView!
    
    var currentUnit = UnitMeasurement.miles {
        didSet {
            unitText.text = currentUnit.rawValue
            userPreference.shared.updateUnitMeasurement(unit: currentUnit)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        updatePic()
    }
    
    var currentImage = UnitMeasurement.miles {
        didSet {
            currentPic.image = UIImage(named: currentImage.rawValue)
            userPreference.shared.updatePic(pic: currentImage)
        }
    }
    
    private func updatePic() {
        if let unitPic = userPreference.shared.getImage() {
            currentImage = unitPic
        }
    }
    
    private func updateUI() {
        // retrieve any values in Userdefaults
        if let unitMeasure = userPreference.shared.getMeasurement() {
            currentUnit = unitMeasure
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // toggle between miles and km
        switch indexPath.row {
        case 0:
            toggleUnit()
        case 1:
            tooglePic()
        default:
            break
        }
    }
    
    private func toggleUnit() {
        currentUnit = (currentUnit == UnitMeasurement.miles) ? UnitMeasurement.km : UnitMeasurement.miles
    }
    
    private func tooglePic() {
        currentImage = (currentImage == UnitMeasurement.miles) ? UnitMeasurement.km : UnitMeasurement.miles
    }
}
