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
            UserPreference.shared.updateDefaults(with: currentUnit.rawValue, for: userKey.unitMeasurement)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    var currentImage = UnitMeasurement.miles {
        didSet {
            currentPic.image = UIImage(named: currentImage.rawValue)
            UserPreference.shared.updateDefaults(with: currentImage.rawValue, for: userKey.picImage)
        }
    }
    
    
    
    private func updateUI() {
        // retrieve any values in Userdefaults
        let unitStr: String = UserPreference.shared.getDefaultValue(for: userKey.unitMeasurement) ?? ""
        let unitMeasurement = UnitMeasurement(rawValue: unitStr) ?? UnitMeasurement.miles
        currentUnit = unitMeasurement
        
        let picStr: String = UserPreference.shared.getDefaultValue(for: userKey.picImage) ?? ""
        let defaultImage = UnitMeasurement(rawValue: picStr) ?? UnitMeasurement.miles
        currentImage = defaultImage
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
