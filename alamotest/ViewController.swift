//
//  ViewController.swift
//  alamotest
//
//  Created by David_Ch_L on 12/11/16.
//  Copyright © 2016 David_Ch_L. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var fishImg: UIImageView!
    @IBOutlet weak var fishLabel: UILabel!
    @IBOutlet weak var fetchButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadFish()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func onTapFetch(_ sender: Any) {
        loadFish()
    }
    
    func loadFish() {
        let req = try! APIClient.Router.fish.asURLRequest()
        Alamofire.request(req).responseJSON { response in
            guard let JSON = response.result.value as? [String:String] else { return }
            debugPrint(JSON)
            self.fishLabel.text = JSON["name"]
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: JSON["image_url"]!.asURL())
                DispatchQueue.main.async {
                    self.fishImg.image = UIImage(data: data!)
                }
            }
        }
    }


}

