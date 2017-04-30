//
//  IPFormViewController.swift
//  WhereIsMyIP
//
//  Created by gai lowvapong on 4/28/17.
//  Copyright © 2017 gai lowvapong. All rights reserved.
//

import UIKit

class IPFormViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBOutlet weak var iptextfield: UITextField!
    @IBAction func FindLocation(_ sender: Any) {
        let input_ip = iptextfield.text!
        let url = URL(string: "http://geo.groupkt.com/ip/"+input_ip+"/json")
        
        let task = URLSession.shared.dataTask(with: url!) { (data, res, err) in
            if err != nil {
                
                print(err!)
                
            }else
            {
                if let urlContent = data {
                    do {
                        let jsonRes = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers as AnyObject as! JSONSerialization.ReadingOptions)
                        
                        
                        print(jsonRes)
                    }catch
                        
                    {
                        print("JSON Process Fail")
                    }
                }
                
                
            }
        }
        task.resume()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
