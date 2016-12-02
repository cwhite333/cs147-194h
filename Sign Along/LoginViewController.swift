//
//  LoginViewController.swift
//  Sign Along
//
//  Created by Minna Xiao on 11/21/16.
//  Copyright © 2016 Stanford. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var interpreterButton: UIButton!

    @IBOutlet weak var userButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interpreterButton.layer.cornerRadius = 5
        interpreterButton.layer.borderColor = UIColor.whiteColor().CGColor
        userButton.layer.cornerRadius = 5
        userButton.layer.borderColor = UIColor.whiteColor().CGColor
        
    }

}
