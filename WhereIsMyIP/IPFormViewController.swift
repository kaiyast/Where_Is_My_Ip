//
//  IPFormViewController.swift
//  WhereIsMyIP
//
//  Created by gai lowvapong on 4/28/17.
//  Copyright © 2017 gai lowvapong. All rights reserved.
//

import UIKit
import GoogleMaps

class IPFormViewController: UIViewController {

    var ip:String = "Nodata"
    var country_name:String = "Nodata"
    var region_name:String = "Nodata"
    var city:String = "Nodata"
    var zip_code:String = "Nodata"
    var time_zone:String = "Nodata"
    var latitude:Double = 0.0
    var longitude:Double = 0.0
    var mapView = GMSMapView.map(withFrame: CGRect.zero, camera: GMSCameraPosition.camera(withLatitude: 0, longitude: 0, zoom: 6.0))
    
    @IBOutlet weak var ip_show: UILabel!
    
    @IBOutlet weak var country_name_show: UILabel!
    @IBOutlet weak var region_name_show: UILabel!
    @IBOutlet weak var city_show: UILabel!
    @IBOutlet weak var zip_code_show: UILabel!
    @IBOutlet weak var time_zone_show: UILabel!
    
    @IBOutlet weak var lat_show: UILabel!
    @IBOutlet weak var long_show: UILabel!
    
    @IBOutlet weak var Googlemap_view: GMSMapView!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        let camera = GMSCameraPosition.camera(withLatitude: self.latitude, longitude: self.longitude, zoom: 6.0)
        Googlemap_view = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
      
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var error_show: UILabel!

    @IBOutlet weak var iptextfield: UITextField!
    @IBAction func FindLocation(_ sender: Any) {
        let input_ip = iptextfield.text!
        let url = URL(string: "http://freegeoip.net/json/"+input_ip)
        
        let task = URLSession.shared.dataTask(with: url!) { (data, res, err) in
            if err != nil {
                
                print(err!)
                
            }else
            {
                if let urlContent = data {
                    do {

                        
                          let jsonRes = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                        
                       // Get all Value
           
                         self.ip = (jsonRes["ip"] as! String)
                         self.country_name = (jsonRes["country_name"] as! String)
                         self.region_name = (jsonRes["region_name"] as! String)
                         self.city = (jsonRes["city"] as! String)
                         self.zip_code = (jsonRes["zip_code"] as! String)
                         self.time_zone = (jsonRes["time_zone"] as! String)
                         self.latitude = (jsonRes["latitude"] as! Double)
                         self.longitude = (jsonRes["longitude"]as! Double)
                        
                        print(jsonRes)
                        print(self.ip)
                        print(self.country_name)
                        print(self.region_name)
                        print(self.city)
                        print(self.zip_code)
                        print(self.time_zone)
                        print(self.latitude)
                        print(self.longitude)
                        
                        self.ip_show.text = self.ip
                        self.country_name_show.text = self.country_name
                        self.region_name_show.text = self.region_name
                        self.time_zone_show.text = self.time_zone
                        self.zip_code_show.text = self.zip_code
                        self.lat_show.text = String(self.latitude)
                        self.long_show.text = String(self.longitude)


                    }catch
                        
                    {
                        print("JSON Process Fail")
                        
                        self.error_show.text = "Wrong IP Format"
                        
                        self.ip_show.text = "Nodata"
                        self.country_name_show.text = "Nodata"
                        self.region_name_show.text = "Nodata"
                        self.time_zone_show.text = "Nodata"
                        self.zip_code_show.text = "Nodata"
                        self.lat_show.text = "0.0"
                        self.long_show.text = "0.0"

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
