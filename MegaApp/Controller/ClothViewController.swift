//
//  ClothViewController.swift
//  MegaApp
//
//  Created by Bibizhan on 05.07.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher

class ClothViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    let url = "https://megaapi.herokuapp.com/api/cloth"
    var companies = [Company]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorStyle = .none
        getData{ (company) in
            self.companies = company
            self.tableView.reloadData()
        }
    }

    func getData(completion: @escaping ([Company]) -> ()){
        Alamofire.request(url).responseJSON { response in
            var company = [Company]()
            switch response.result {
            case .success(let rawJson):
                let json = JSON(rawJson)
                for cloth in json["data"].arrayValue {
                    let clothDictionary = cloth.dictionaryObject
                    if let clothDictionary = clothDictionary {
                        if let cloth = Company.init(jsonDict: clothDictionary) {
                            company.append(cloth)
                           print(cloth)
                        }
                    }
                }
                completion(company)
                break
            case .failure(let erroxer):
                print(erroxer)
                break
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return companies.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ClothCell") as! ClothTableViewCell
        cell.logoImage.kf.setImage(with: URL.init(string: companies[indexPath.row].logoUrl!))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ClothDetailedViewController") as! ClothDetailedViewController
        if let cell = tableView.cellForRow(at: indexPath) as? ClothTableViewCell {
            if cell.isSelected {
                cell.isSelected = false
            } else {
                cell.isSelected = true
            }
        }
        vc.delegate = companies[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
    
