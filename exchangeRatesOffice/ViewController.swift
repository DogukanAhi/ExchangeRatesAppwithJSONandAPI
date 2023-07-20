//
//  ViewController.swift
//  exchangeRatesOffice
//
//  Created by Doğukan Ahi on 20.07.2023.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var datelabel: UILabel!
    @IBOutlet weak var usdlabel: UILabel!
    
    
    @IBOutlet weak var trylabel: UILabel!
    
    @IBOutlet weak var gpblabel: UILabel!
    
    @IBOutlet weak var cadlabel: UILabel!
    
    @IBOutlet weak var jpylabel: UILabel!
   
    
    @IBOutlet weak var zarlabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }

    
    
    
    
    @IBAction func refreshButton(_ sender: Any) {
        
        
        let url = URL(string: "http://data.fixer.io/api/latest?access_key=7e7509ba43f2103242e75825697bb931")
        
        let session = URLSession.shared
        
        
        
        let task = session.dataTask(with: url!) { (data, response, error) in
            if  error != nil{
                let alert = UIAlertController(title: "Error", message: "Error Occured", preferredStyle: UIAlertController.Style.alert)

                let okButton = UIAlertAction(title: "Ok", style: .default)
                alert.addAction(okButton)
                self.present(alert, animated: true)
            }
            else {
           
                if data != nil {
                   
                        do {
                            let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, Any>
                            
                            
                            DispatchQueue.main.async {
                                if let rates = jsonResponse["rates"] as? [String : Any] {
                                    
                                    if let usd = rates["USD"] as? Double {
                                        
                                        self.usdlabel.text = "USD: \(usd)"
                                    }
                                     
                                    if let cad = rates["CAD"] as? Double {
                                        
                                        self.cadlabel.text = "CAD: \(cad)"
                                    }
                                    
                                    if let tl = rates["TRY"] as? Double {
                                        
                                        self.trylabel.text = "TRY: \(tl)"
                                    }
                                    
                                    if let jpy = rates["JPY"] as? Double {
                                        
                                        self.jpylabel.text = "JPY: \(jpy)"
                                    }
                                    
                                    if let gbp = rates["GBP"] as? Double {
                                        
                                        self.gpblabel.text = "GBP: \(gbp)"
                                    }
                                    if let zar = rates["ZAR"] as? Double {
                                        
                                        self.zarlabel.text = "ZAR: \(zar)"
                                    }
                                    
                                    
                                    
                                }
                                let newdate = jsonResponse["date"]
                                self.datelabel.text = "Last Updated: \(String(describing: newdate ?? nil))"
                                
                                
                            }
                        
                    }catch{
                        
                        print("JSON Error!")
                    }
                }
              
               
            }
          
        }
        task.resume() 
         

        
    }
        
}
    
    
    
    
    



