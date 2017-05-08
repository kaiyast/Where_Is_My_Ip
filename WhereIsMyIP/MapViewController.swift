//
//  MapViewController.swift
//  WhereIsMyIP
//
//  Created by gai lowvapong on 5/5/17.
//  Copyright © 2017 gai lowvapong. All rights reserved.
//


import GoogleMaps

class MapViewController {

       let camera = GMSCameraPosition.camera(withLatitude: 1.285, longitude: 103.848, zoom: 12)
    let mapView = GMSMapView.map(withFrame: .zero, camera: camera)
    view = mapView


}
