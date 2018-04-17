//
//  PlaceDetailViewController.swift
//  Places
//
//  Created by NARA on 4/16/18.
//  Copyright © 2018 Ministerio de Transportes y Comunicaciones. All rights reserved.
//

import UIKit
protocol PlaceDetailViewControllerDelegate {
    func loadViewCompleted()
}
class PlaceDetailViewController: UIViewController {
    var delegate:PlaceDetailViewControllerDelegate?
    var lblTitle:UILabel = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .orange
        // Do any additional setup after loading the view.
        
        let btnBack = UIButton()
        btnBack.frame = CGRect(x: 10, y: 20, width: 44, height: 44)
        self.view.addSubview(btnBack)
        btnBack.setImage(#imageLiteral(resourceName: "iconBack"), for: .normal)
    
        btnBack.addTarget(self, action: #selector(self.goToBack(sender:)), for: .touchUpInside)
        
        lblTitle.frame = CGRect(x: 60, y: 20, width: 200, height: 44)
        lblTitle.textColor = .white
        self.view.addSubview(lblTitle)
        self.delegate?.loadViewCompleted()
    }
    @IBAction func goToBack(sender:UIButton){
        self.navigationController?.popViewController(animated: true)
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
