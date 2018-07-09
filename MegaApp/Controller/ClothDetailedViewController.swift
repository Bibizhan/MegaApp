//
//  ClothDetailedViewController.swift
//  MegaApp
//
//  Created by Bibizhan on 06.07.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher

class ClothDetailedViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var isEmptyLabel: UILabel!
    var products = [Product]()
    var delegate: Company?
    var filterClothes = [Product]()
    var url = "https://megaapi.herokuapp.com/api/cloth/id/"
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBAction func segmentedControl(_ sender: UISegmentedControl) {
        filterClothes = products.filter { cloth in
        switch sender.selectedSegmentIndex {
        case 0:
            return cloth.type == ProductCategory.shoes.rawValue ||  cloth.type == ProductCategory.garment.rawValue
        case 1:
            return cloth.type == ProductCategory.garment.rawValue
        default:
            return cloth.type == ProductCategory.shoes.rawValue
        }
    }
        collectionView.reloadData()
    }

    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getData{ (product) in
            self.products = product
            self.filterClothes = self.products
            self.collectionView.reloadData()
            
        }
    }

    func getData(completion: @escaping ([Product]) -> ()) {
        Alamofire.request(url + "\(delegate?.id ?? 0)").responseJSON { response in
            var products = [Product]()
            switch response.result {
            case .success(let rawJson):
                let json = JSON(rawJson)
                for product in json["data"].arrayValue {
                    let clothDic = product.dictionaryObject
                    if let clothDic = clothDic{
                        if let product = Product(jsonDict: clothDic) {
                            products.append(product)
                            self.collectionView.reloadData()
                        }
                    }
                }
                completion(products)
                break
            case .failure(let errorer):
                print(errorer)
                break
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if filterClothes.count == 0{
            isEmptyLabel.isHidden = false
        } else {
            isEmptyLabel.isHidden = true
        }
        return filterClothes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! ClothCollectionViewCell
        
        cell.clothImage.kf.setImage(with: URL.init(string: filterClothes[indexPath.row].logoUrl!))
        cell.clothName.text = filterClothes[indexPath.row].name
        cell.clothPrice.text = "\(( filterClothes[indexPath.row].price)!) тг."
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellSize = CGSize(width: (collectionView.bounds.width - (3 * 10))/2, height: 200)
        return cellSize
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AboutClothViewController") as! AboutClothViewController
//        self.navigationController?.pushViewController(vc, animated: true)
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let sectionInset = UIEdgeInsetsMake(10, 10, 10, 10)
        return sectionInset
    }
}
