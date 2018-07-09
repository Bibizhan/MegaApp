//
//  FoodViewController.swift
//  MegaApp
//
//  Created by Bibizhan on 04.07.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher

class FoodViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
    let url = "https://megaapi.herokuapp.com/api/food"
    var companies = [Brand]()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData{ (company) in
            self.companies = company
            self.tableView.reloadData()
        }
    }
    
    func getData(completion: @escaping ([Brand]) -> ()) {
        Alamofire.request(url).responseJSON { response in
            var company = [Brand]()
            switch response.result {
                case .success(let rawJson):
                    let json = JSON(rawJson)
                    for food in json["data"].arrayValue {
                        let foodDictionary = food.dictionaryObject
                        if let foodDictionary = foodDictionary {
                            if let food = Brand.init(jsonDict: foodDictionary) {
                                company.append(food)
                            }
                        }
                    }
                    completion(company)
                break
            case .failure(let errorg):
                print(errorg)
                break
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return companies.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        cell.logoImage.kf.setImage(with: URL.init(string: companies[indexPath.row].logoUrl!))
        cell.companyName.text = companies[indexPath.row].name
        cell.companyDescription.text = companies[indexPath.row].description
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "FoodDetailedViewController") as! FoodDetailedViewController
        vc.delegate = companies[indexPath.row]
        if let cell = tableView.cellForRow(at: indexPath) as? TableViewCell {
        if cell.isSelected {
            cell.isSelected = false
        } else {
            cell.isSelected = true
        }
        }
        if let indexPath  = tableView.indexPathForSelectedRow {
        vc.headerUrl = companies[indexPath.row].shopHeader!
        }
     self.navigationController?.pushViewController(vc, animated: true)
       
    }
}


