//
//  ListDepartmentPresenter.swift
//  Places
//
//  Created by NARA on 4/12/18.
//  Copyright © 2018 Ministerio de Transportes y Comunicaciones. All rights reserved.
//

import UIKit
protocol ListDepartmentViewPresenter {
    init(view:ListDepartmentsViewController,model:ListDeparmentsModel)
    func loadProtocols()
}
class ListDepartmentPresenter: ListDepartmentViewPresenter,ListDeparmentsModelDelegate,ListDepartmentsViewControllerDelegate,CollectionDepartmentsDelegate {

    unowned let view:ListDepartmentsViewController
    var model:ListDeparmentsModel
    required init(view: ListDepartmentsViewController, model: ListDeparmentsModel) {
        self.view = view
        self.model = model
    }
    
    func loadProtocols() {
        self.view.delegate = self
        self.view.departmentCollection.delegate = self
        self.model.delegate = self
    }
    //Vista
    func getDepartments() {
        self.model.getDepartments()
    }
    func selectDepartment(department: Department) {
        self.view.showDetail(department:department)
    }
    //Model
    func completesDepartments(departments:[Department]){
        self.view.reloadDepartments(departments:departments)
    }

}
