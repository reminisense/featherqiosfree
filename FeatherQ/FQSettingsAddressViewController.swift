//
//  FQSettingsAddressViewController.swift
//  FeatherQ
//
//  Created by Paul Andrew Gutib on 12/2/16.
//  Copyright © 2016 Reminisense. All rights reserved.
//

import UIKit

class FQSettingsAddressViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var countryList: UIPickerView!
    @IBOutlet weak var buildingOffice: UITextField!
    @IBOutlet weak var streetBlock: UITextField!
    @IBOutlet weak var townCity: UITextField!
    @IBOutlet weak var stateProvince: UITextField!
    @IBOutlet weak var zipPostalCode: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var updateBtn: UIButton!
    
    var countryEntry = ["- Select a Country -", "Philippines", "China", "Russia", "USA", "Austrailia", "Singapore", "Japan"]
    var email: String?
    var password: String?
    var logoVal: String?
    var businessName: String?
    var selectedCategory: String?
    var selectedCountry = "- Select a Country -"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.updateBtn.layer.cornerRadius = 5.0
        self.updateBtn.clipsToBounds = true
        self.buildingOffice.inputAccessoryView = UIView.init() // removes IQKeyboardManagerSwift toolbar
        self.streetBlock.inputAccessoryView = UIView.init() // removes IQKeyboardManagerSwift toolbar
        self.townCity.inputAccessoryView = UIView.init() // removes IQKeyboardManagerSwift toolbar
        self.stateProvince.inputAccessoryView = UIView.init() // removes IQKeyboardManagerSwift toolbar
        self.zipPostalCode.inputAccessoryView = UIView.init() // removes IQKeyboardManagerSwift toolbar
        self.phone.inputAccessoryView = UIView.init() // removes IQKeyboardManagerSwift toolbar
        self.logoVal = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @available(iOS 2.0, *)
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.countryEntry.count
    }
    
    @available(iOS 2.0, *)
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.countryEntry[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.selectedCountry = self.countryEntry[row]
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func businessNameTxt(_ sender: UITextField) {
        self.streetBlock.becomeFirstResponder()
    }
    
    @IBAction func streetBlockTxt(_ sender: UITextField) {
        self.townCity.becomeFirstResponder()
    }
    
    @IBAction func townCityTxt(_ sender: UITextField) {
        self.stateProvince.becomeFirstResponder()
    }
    
    @IBAction func stateProvinceTxt(_ sender: UITextField) {
        self.zipPostalCode.becomeFirstResponder()
    }
    
    @IBAction func zipPostalCode(_ sender: UITextField) {
        self.phone.becomeFirstResponder()
    }
    
    @IBAction func phoneTxt(_ sender: UITextField) {
        self.resignFirstResponder()
    }
    
    func validateAddresses() -> Bool {
        if self.streetBlock.text!.isEmpty {
            let alertBox = UIAlertController(title: "Invalid Street Address", message: "Please provide the correct street on where your business is located.", preferredStyle: .alert)
            alertBox.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alertBox, animated: true, completion: nil)
            return false
        }
        else if self.townCity.text!.isEmpty {
            let alertBox = UIAlertController(title: "Invalid Town/City", message: "Please provide the correct town or city on where your business is located.", preferredStyle: .alert)
            alertBox.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alertBox, animated: true, completion: nil)
            return false
        }
        else if self.stateProvince.text!.isEmpty {
            let alertBox = UIAlertController(title: "Invalid State/Province", message: "Please provide the correct state or province on where your business is located.", preferredStyle: .alert)
            alertBox.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alertBox, animated: true, completion: nil)
            return false
        }
        else if self.zipPostalCode.text!.isEmpty {
            let alertBox = UIAlertController(title: "Invalid Zip/Postal Code", message: "Please provide the correct zip or postal code on where your business is located.", preferredStyle: .alert)
            alertBox.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alertBox, animated: true, completion: nil)
            return false
        }
        else if self.selectedCountry == "- Select a Country -" {
            let alertBox = UIAlertController(title: "Invalid Country", message: "Please select the country of your business location.", preferredStyle: .alert)
            alertBox.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alertBox, animated: true, completion: nil)
            return false
        }
        return true
    }

}