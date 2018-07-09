//
//  AboutClothViewController.swift
//  MegaApp
//
//  Created by Bibizhan on 06.07.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit

class AboutClothViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var nameCompany: UILabel!
    @IBOutlet weak var nameCloth: UILabel!
    @IBOutlet weak var descriptionCompany: UITextView!
    @IBOutlet weak var size: UITextField!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var amountOfImages = 10
    
    var products: Product?
    var companies: Company?
    
    let clothSize = ["S","M", "L", "XL"]
    let shoesSize = ["37","38", "39", "40"]
    
    let cloth = ClothCollectionViewCell()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let pickerView = UIPickerView()
        size.inputView = pickerView
        pickerView.delegate = self
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
       // getData()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneTap))
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelTapped))
        toolbar.setItems([cancelButton,space,doneButton], animated: true)
        size.inputAccessoryView = toolbar
        
       if let companies = companies {
        descriptionCompany.text = companies.description
        nameCompany.text = companies.name
        nameCloth.text = products?.name
        }
    }
    
    func getData() {
        nameCloth.text = cloth.getClothName()
    }

    @objc func doneTap(){
        self.view.endEditing(true)
    }
    
    @objc func cancelTapped(){
        self.view.endEditing(true)
        size.text = ""
    }
    

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return clothSize.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return clothSize[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        size.text = clothSize[row]
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
    }

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "aboutCloth" {
//            if let destination = segue.destination as? ClothDetailedCollectionViewCell{
//               // destination.description = descriptionCompany.text!
//               // descriptionCompany.text = destination.description
//
//            }
//        }
//    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return amountOfImages
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ClothDetailed", for: indexPath) as! ClothDetailedCollectionViewCell
        if let imageUrl = products?.logoUrl{
            cell.clothImage.kf.setImage(with: URL.init(string: imageUrl))
        }
       // cell.clothImage.kf.setImage(with: URL.init(string: products[indexPath.row].logoUrl!))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
    
    


