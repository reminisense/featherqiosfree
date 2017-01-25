//
//  FQOnboardingLayerViewController.swift
//  FeatherQ
//
//  Created by Paul Andrew Gutib on 1/25/17.
//  Copyright © 2017 Reminisense. All rights reserved.
//

import UIKit

class FQOnboardingLayerViewController: UIViewController {

    @IBOutlet weak var sectionTitle: UILabel!
    @IBOutlet weak var sectionContent: UILabel!
    @IBOutlet weak var searchMask: UIView!
    @IBOutlet weak var locationMask: UIView!
    @IBOutlet weak var businessMask: UIView!
    
    var onboardingSections = [
        [
            "title": "Nearby",
            "content": "FeatherQ will give a list of businesses depending on your location. Tap on the globe above to allow the app to access your location through your device’s GPS."
        ],
        [
            "title": "Search",
            "content": "Enter a business' name, address, or its unique 4-character code to preview its current line progress."
        ],
        [
            "title": "Business Listing",
            "content": "Tapping on the rows above enables you to see the numbers currently being processed by the business including the last number called."
        ],
        [
            "title": "Categories",
            "content": "Tap categories below if you want to show only businesses belonging to specific industry."
        ]
    ]
    var sectionCounter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.sectionTitle.text = onboardingSections[0]["title"]
        self.sectionContent.text = onboardingSections[0]["content"]
        self.locationMask.isHidden = true
        self.searchMask.isHidden = false
        self.businessMask.isHidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func tapContinue(_ sender: UIButton) {
        self.sectionCounter += 1
        if self.sectionCounter == 1 {
            self.locationMask.isHidden = false
            self.searchMask.isHidden = true
            self.businessMask.isHidden = false
        }
        else if self.sectionCounter == 2 {
            self.locationMask.isHidden = false
            self.searchMask.isHidden = false
            self.businessMask.isHidden = true
        }
        else if self.sectionCounter == 3 {
            self.locationMask.isHidden = false
            self.searchMask.isHidden = false
            self.businessMask.isHidden = false
        }
        if self.sectionCounter < 4 {
            self.sectionTitle.text = onboardingSections[self.sectionCounter]["title"]
            self.sectionContent.text = onboardingSections[self.sectionCounter]["content"]
        }
        else {
            let preferences = UserDefaults.standard
            preferences.set(true, forKey: "fqiosappfreeonboard")
            preferences.synchronize()
//            let appdelegate = UIApplication.shared.delegate as! AppDelegate
//            appdelegate.window?.rootViewController = UIStoryboard(name: "Main",bundle: nil).instantiateViewController(withIdentifier: "startMainApp")
            self.dismiss(animated: false, completion: nil)
            UIApplication.shared.keyWindow?.viewWithTag(1111)?.removeFromSuperview()
            UIApplication.shared.keyWindow?.viewWithTag(2222)?.removeFromSuperview()
        }
    }
    
}