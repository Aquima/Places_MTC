//
//  PlaceDetailViewController.swift
//  Places
//
//  Created by NARA on 4/16/18.
//  Copyright © 2018 Ministerio de Transportes y Comunicaciones. All rights reserved.
//

import UIKit
import SDWebImage
import MapKit
import CoreLocation

protocol PlaceDetailViewControllerDelegate {
    func loadViewCompleted()
    func getDetailForMap()
}
class PlaceDetailViewController: BaseViewController,CLLocationManagerDelegate,MKMapViewDelegate {
    var delegate:PlaceDetailViewControllerDelegate?
    var lblTitle:UILabel = UILabel()
    var img:UIImageView = UIImageView()
    let viewMap = MKMapView()
    let locationManager = CLLocationManager()
    var textView = UITextView()
    var shapeAnnotation:ShapeMap!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        // Do any additional setup after loading the view.
        
        let btnBack = UIButton()
        btnBack.frame = CGRect(x: 10*valuePro, y: 20*valuePro, width: 44*valuePro, height: 44*valuePro)
        self.view.addSubview(btnBack)
        btnBack.setImage(#imageLiteral(resourceName: "iconBack"), for: .normal)
    
        btnBack.addTarget(self, action: #selector(self.goToBack(sender:)), for: .touchUpInside)
        
        lblTitle.frame = CGRect(x: 60*valuePro, y: 20*valuePro, width: 200*valuePro, height: 44*valuePro)
        lblTitle.textColor = .black
        self.view.addSubview(lblTitle)

        img.frame = CGRect(x: 20*valuePro, y: 70*valuePro, width: 100*valuePro, height: 100*valuePro)
        img.layer.cornerRadius = img.frame.size.width/2
        img.backgroundColor = .blue
        img.layer.masksToBounds = true
        self.view.addSubview(img)
        
        
        textView.isEditable = false
        textView.isScrollEnabled = true
        //UIColor.black.withAlphaComponent(0.5)
        textView.backgroundColor = UIColor.clear
    
        textView.textColor = UIColor.gray
        textView.frame = CGRect(x: (self.view.frame.width - 300*valuePro)/2, y: 180*valuePro, width:300*valuePro, height: 250*valuePro)
        textView.font = UIFont(name: Styles.fonts.regular, size: 13*valuePro)
        self.view.addSubview(textView)
     
        //440
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        viewMap.frame =  CGRect(x: (self.view.frame.width - 300*valuePro)/2, y: 440*valuePro, width:300*valuePro, height: self.view.frame.size.height - 450*valuePro)
      //  viewMap.backgroundColor = .green
        self.view.addSubview(viewMap)
   
        viewMap.showsCompass = true
        viewMap.showsScale = true
        viewMap.showsUserLocation = true
        
        let btnShowDetail = UIButton()
        btnShowDetail.frame = CGRect(x:self.viewMap.frame.size.width - 75*valuePro, y: 5*valuePro, width: 70*valuePro, height: 20*valuePro)
        btnShowDetail.setTitle("Ver Mas", for: .normal)
        btnShowDetail.layer.cornerRadius = 3*valuePro
        btnShowDetail.layer.masksToBounds = true
        btnShowDetail.backgroundColor = UIColor.red
        btnShowDetail.setTitleColor(.white, for: .normal)
        btnShowDetail.addTarget(self, action: #selector(goToDetail(sender:)), for: .touchUpInside)
        viewMap.addSubview(btnShowDetail)
        viewMap.delegate = self
        self.delegate?.loadViewCompleted()
      
    }
    @IBAction func goToDetail(sender:UIButton){
        self.delegate?.getDetailForMap()
    }
    func showDetailMap(detail:DepartmentDetail){
        let view:DetailMapViewController = DetailMapViewController()
        view.detail = detail
        self.navigationController?.pushViewController(view, animated: true)
    }
    func loadImage(url:String){
        img.sd_setImage(with: URL(string: url), completed: nil)
    }
    @IBAction func goToBack(sender:UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK - Delegate
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        print("\(locations[0].coordinate)")
//        let location = locations[0]
//        let center = location.coordinate
//        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
//        let region = MKCoordinateRegion(center: center, span: span)
//        viewMap.setRegion(region, animated: true)
    }
    func showCoordinate(detail:DepartmentDetail){
        let coordinate = CLLocationCoordinate2D(latitude: detail.coordinate.lat, longitude: detail.coordinate.lng)
        viewMap.setCenter(coordinate, animated: true)
        shapeAnnotation = ShapeMap(coordinate: coordinate, title: "Puno", subtitle: "Lema")
        //  shapeAnnotation.set
        viewMap.addAnnotation(shapeAnnotation)
    }
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView?{
        let pin:PinCustom = PinCustom(annotation: self.shapeAnnotation, reuseIdentifier: "Pincustom")
        
        return pin
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
