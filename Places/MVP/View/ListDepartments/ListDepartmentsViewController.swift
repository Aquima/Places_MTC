//
//  ListDepartmentsViewController.swift
//  Places
//
//  Created by NARA on 4/12/18.
//  Copyright © 2018 Ministerio de Transportes y Comunicaciones. All rights reserved.
//

import UIKit
protocol ListDepartmentsViewControllerDelegate {
    func getDepartments()
}
class ListDepartmentsViewController: UIViewController {
    var delegate:ListDepartmentsViewControllerDelegate?
    var departmentCollection:CollectionDepartments = CollectionDepartments()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        departmentCollection.frame =   CGRect(x: 0, y:0, width: self.view.frame.size.width , height:self.view.frame.size.height)
        departmentCollection.drawBody()
        self.view.addSubview(departmentCollection)
        
        self.delegate?.getDepartments()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func reloadDepartments(departments:[Department]){
        //aqui yo deberia recargar mi vista de deaparamentos
        for department in departments {
            print(department.title)
        }
        self.departmentCollection.reloadView(data: departments)
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
