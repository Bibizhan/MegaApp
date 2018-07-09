//
//  ProfileViewController.swift
//  MegaApp
//
//  Created by Bibizhan on 07.07.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    var vc: ViewController?
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var balance: UILabel!

    @IBAction func quitPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func orderHistory(_ sender: UIButton) {
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let namek = vc?.username
        username.text = namek?.text
    }
    func showResult() {
//        username.text = vc?.getName()
//        city.text = vc?.getCity()
//        balance.text = vc?.getBalance()
        username.text = ViewController.shared().username?.text 
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // showResult()
    }
}
