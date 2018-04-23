//
//  DetailMapViewController.swift
//  Places
//
//  Created by NARA on 4/20/18.
//  Copyright © 2018 Ministerio de Transportes y Comunicaciones. All rights reserved.
//

import UIKit
import MapKit

class DetailMapViewController: BaseViewController,MKMapViewDelegate {
    let viewMap = MKMapView()
    var detail:DepartmentDetail!
    var shapeAnnotation:ShapeMap!
    override func viewDidLoad() {
        super.viewDidLoad()
        viewMap.frame =  CGRect(x: 0, y: 0, width:self.view.frame.size.width, height: self.view.frame.size.height)
        //  viewMap.backgroundColor = .green
        self.view.addSubview(viewMap)
        let coordinate = CLLocationCoordinate2D(latitude: detail.coordinate.lat, longitude: detail.coordinate.lng)
        viewMap.setCenter(coordinate, animated: true)
        viewMap.showsCompass = true
        viewMap.showsScale = true
        viewMap.delegate = self
        viewMap.showsUserLocation = true
        // Do any additional setup after loading the view.
        shapeAnnotation = ShapeMap(coordinate: coordinate, title: "Puno", subtitle: "Lema")
      //  shapeAnnotation.set
        viewMap.addAnnotation(shapeAnnotation)
        self.drawShape(shape:detail.shape)
        
        let btnGoBack = UIButton()
        btnGoBack.frame = CGRect(x: 15*valuePro, y: 15*valuePro, width: 40*valuePro, height: 40*valuePro)
        btnGoBack.setImage(#imageLiteral(resourceName: "iconBack"), for: .normal)
        btnGoBack.addTarget(self, action: #selector(goBack(sender:)), for: .touchUpInside)
        self.view.addSubview(btnGoBack)
    }
    @IBAction func goBack(sender:UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    func drawShape(shape:[Coordinate]){
        var locations = [CLLocationCoordinate2D]()
        for coordinate in shape {
           let newCoordinate = CLLocationCoordinate2D(latitude: coordinate.lat, longitude: coordinate.lng)
            locations.append(newCoordinate)
        }
        let polygon = MKPolygon(coordinates: locations, count: locations.count)
        viewMap.add(polygon)
    }
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView?{
        let pin:PinCustom = PinCustom(annotation: self.shapeAnnotation, reuseIdentifier: "Pincustom")
        
        return pin
    }
    //para agregar cualquier
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if overlay is MKPolygon {
            let renderer = MKPolygonRenderer(polygon: overlay as! MKPolygon)
            renderer.fillColor = UIColor.black.withAlphaComponent(0.5)
            renderer.strokeColor = UIColor.orange
            renderer.lineWidth = 2
            return renderer
        }
        return MKOverlayRenderer()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
