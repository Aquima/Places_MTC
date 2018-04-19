//
//  BaseViewController.swift
//  Places
//
//  Created by NARA on 4/18/18.
//  Copyright © 2018 Ministerio de Transportes y Comunicaciones. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    var screenSize: CGRect! = nil
    let valuePro:CGFloat  = CGFloat(truncating: NSNumber.getPropotionalValueDevice())
    override func viewDidLoad() {
        super.viewDidLoad()
        self.screenSize = view.frame
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
