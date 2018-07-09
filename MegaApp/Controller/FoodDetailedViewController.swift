//
//  FoodDetailedViewController.swift
//  MegaApp
//
//  Created by Bibizhan on 05.07.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher

class FoodDetailedViewController: UIViewController,  UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var headerImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    var products = [Product]()
    var companies = [Brand]()
    var url = "https://megaapi.herokuapp.com/api/food/id/"
    var delegate: Brand?
    var headerUrl: String?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorStyle = .none
        headerImage.kf.setImage(with: URL.init(string: headerUrl!))
        getData{ (product) in
            self.products = product
            self.tableView.reloadData()
        }
    }
    

    func getData(completion: @escaping ([Product]) -> ()) {
        Alamofire.request(url + "\(delegate?.id ?? 0)").responseJSON { response in
            var products = [Product]()
            switch response.result {
            case .success(let rawJson):
                let json = JSON(rawJson)
                for product in json["data"].arrayValue {
                    let foodDic = product.dictionaryObject
                    if let foodDic = foodDic{
                        if let product = Product(jsonDict: foodDic) {
                            products.append(product)
                            self.tableView.reloadData()
                        }
                    }
                }
                completion(products)
                break
            case .failure(let errora):
                print(errora)
                break
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "foodCell") as! FoodTableViewCell
        cell.foodImage.kf.setImage(with: URL.init(string: products[indexPath.row].logoUrl!))
        cell.foodName.text = products[indexPath.row].name
        cell.foodPrice.text = "\(( products[indexPath.row].price)!) тг."
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? FoodTableViewCell {
            if cell.isSelected {
                cell.isSelected = false
            } else {
                cell.isSelected = true
            }
        }
    }
}

