//
//  ViewController.swift
//  MegaApp
//
//  Created by Bibizhan on 04.07.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate , UIPickerViewDelegate, UIPickerViewDataSource {

    let cities = ["Алматы","Астана", "Атырау", "Актобе"]
     static var vcSingleton: ViewController?
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var city: UITextField!
    @IBOutlet weak var balance: UITextField!
    
    @IBAction func importImage(_ sender: UIButton) {
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = .photoLibrary
        image.allowsEditing = true
        self.present(image, animated: true)
       // print(username.text ?? 00)
        
    }
    
//   “ private init() {
//    }
//    ”

    //
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    //
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    static func shared() -> ViewController {
        if vcSingleton == nil {
            vcSingleton = ViewController()
        }
        return vcSingleton!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let pickerView = UIPickerView()
        city.inputView = pickerView
        pickerView.delegate = self
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneTap))
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelTapped))
        toolbar.setItems([cancelButton,space,doneButton], animated: true)
        city.inputAccessoryView = toolbar
        
        textFieldStyle()
       
    }
    
    @objc func doneTap(){
        self.view.endEditing(true)
    }
    
    @objc func cancelTapped(){
        self.view.endEditing(true)
        city.text = ""
    }
    
//    func getName() -> String? {
//        return username.text
//    }
//
//    func getCity() -> String? {
//        return city.text
//    }
//
//    func getBalance() -> String? {
//        return balance.text
//    }
//
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageView.image = image
        }  else {
            print("error")
        }
        self.dismiss(animated: true, completion: nil)
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cities.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return cities[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        city.text = cities[row]
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
    }
    
    func textFieldStyle() {
        username.useUnderline()
        city.useUnderline()
        balance.useUnderline()
    }

}

