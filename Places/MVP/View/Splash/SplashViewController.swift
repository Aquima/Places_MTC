//
//  SplashViewController.swift
//  Places
//
//  Created by NARA on 4/9/18.
//  Copyright © 2018 Ministerio de Transportes y Comunicaciones. All rights reserved.
//

import UIKit
protocol SplashViewControllerDelegate {
    func goToLogIn()
}
class SplashViewController: UIViewController {
    var delegate:SplashViewControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let img:UIImageView = UIImageView()
        img.image = #imageLiteral(resourceName: "logo")
        img.frame = CGRect(x: (self.view.frame.size.width - 100)/2, y:  (self.view.frame.size.height - 100)/2, width: 100, height: 100)
        self.view.addSubview(img)
        self.delegate?.goToLogIn()
        // Do any additional setup after loading the view.
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
