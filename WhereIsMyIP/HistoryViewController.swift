//
//  HistoryViewController.swift
//  WhereIsMyIP
//
//  Created by gai lowvapong on 5/7/17.
//  Copyright © 2017 gai lowvapong. All rights reserved.
//

import UIKit
import CoreData

class HistoryViewController: UIViewController,UITableViewDataSource, UITableViewDelegate{

    @IBOutlet weak var HistoryTable: UITableView!
    var HistoryList  = UserDefaults.standard.object(forKey: "Historys") as! [String]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return HistoryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = HistoryList[indexPath.row]
        
        return cell
        
    }
    
 
}


