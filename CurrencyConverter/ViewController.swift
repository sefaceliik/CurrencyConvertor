//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Sefa Çelik on 8.05.2020.
//  Copyright © 2020 Sefa Celik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // UI Elements
    // Labels
    @IBOutlet weak var topicLabel: UILabel!
    @IBOutlet weak var canadianLabel: UILabel!
    @IBOutlet weak var swissLabel: UILabel!
    @IBOutlet weak var britishLabel: UILabel!
    @IBOutlet weak var japanLabel: UILabel!
    @IBOutlet weak var americanLabel: UILabel!
    @IBOutlet weak var turkishLabel: UILabel!
    
    // Button
    @IBAction func updateButton(_ sender: Any) {
        
        // 1) Request and Session
        // 2) Response and Data
        // 3) Parsing and JSON Serialization
        
        // 1
        let url = URL(string: "http://data.fixer.io/api/latest?access_key=0fcd56a89d0e606d7276a2a283743f2d")
        let session = URLSession.shared
        
        // Closure
        let task = session.dataTask(with: url!) { (data, response, error) in
            
            if error != nil {
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                alert.addAction(okButton)
                self.present(alert, animated: true, completion: nil)
                
            }   else{
                // 2
                if data != nil {
                    do {
                        let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, Any>
                        // Async
                        DispatchQueue.main.async {
                            if let rates = jsonResponse["rates"] as? [String : Any] {
                                if let cad = rates["CAD"] as? Double {
                                    self.canadianLabel.text = "CAD: \(cad)"
                                }
                                if let chf = rates["CHF"] as? Double {
                                    self.swissLabel.text = "CHF: \(chf)"
                                }
                                if let gbp = rates["GBP"] as? Double {
                                    self.britishLabel.text = "GBP: \(gbp)"
                                }
                                if let jpy = rates["JPY"] as? Double {
                                    self.japanLabel.text = "JPY: \(jpy)"
                                }
                                if let usd = rates["USD"] as? Double {
                                    self.americanLabel.text = "USD: \(usd)"
                                }
                                if let tr = rates["TRY"] as? Double {
                                    self.turkishLabel.text = "TRY: \(tr)"
                                }

                            }
                        }
                    } catch {
                        print("error")
                    }
                }
            }
        }
        
        task.resume()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
}


















