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
class PlaceDetailViewController: BaseViewController,CLLocationManagerDelegate {
    var delegate:PlaceDetailViewControllerDelegate?
    var lblTitle:UILabel = UILabel()
    var img:UIImageView = UIImageView()
    let viewMap = MKMapView()
    let locationManager = CLLocationManager()
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
        
        let textView = UITextView()
        textView.isEditable = false
        textView.isScrollEnabled = true
        //UIColor.black.withAlphaComponent(0.5)
        textView.backgroundColor = UIColor.clear
        textView.text = "Al contrario del pensamiento popular, el texto de Lorem Ipsum no es simplemente texto aleatorio. Tiene sus raices en una pieza cl´sica de la literatura del Latin, que data del año 45 antes de Cristo, haciendo que este adquiera mas de 2000 años de antiguedad. Richard McClintock, un profesor de Latin de la Universidad de Hampden-Sydney en Virginia, encontró una de las palabras más oscuras de la lengua del latín, consecteur, en un pasaje de Lorem Ipsum, y al seguir leyendo distintos textos del latín, descubrió la fuente indudable. Lorem Ipsum viene de las secciones 1.10.32 y 1.10.33 de de Finnibus Bonorum et Malorum (Los Extremos del Bien y El Mal) por Cicero, escrito en el año 45 antes de Cristo. Este libro es un tratado de teoría de éticas, muy popular durante el Renacimiento. La primera linea del Lorem Ipsum, Lorem ipsum dolor sit amet.., viene de una linea en la sección 1.10.32"
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
        let coordinate = CLLocationCoordinate2D(latitude: -12.4545, longitude: -74.2312)
        viewMap.setCenter(coordinate, animated: true)
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
        print("\(locations[0].coordinate)")
        let location = locations[0]
        let center = location.coordinate
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: center, span: span)
        viewMap.setRegion(region, animated: true)
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
