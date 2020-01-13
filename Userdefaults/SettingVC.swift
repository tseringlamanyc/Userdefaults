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
    
    var currentUnit = UnitMeasurement.miles {
        didSet {
            unitText.text = currentUnit.rawValue
            userPreference.shared.updateUnitMeasurement(unit: currentUnit)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userPreference.shared.getMeasurement()
    }
    
    private func updateUI() {
        // retrieve any values in Userdefaults 
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // toggle between miles and km
        switch indexPath.row {
        case 0:
            toggleUnit()
        default:
            break
        }
    }
    
    private func toggleUnit() {
        currentUnit = (currentUnit == UnitMeasurement.miles) ? UnitMeasurement.km : UnitMeasurement.miles
    }
    
}
