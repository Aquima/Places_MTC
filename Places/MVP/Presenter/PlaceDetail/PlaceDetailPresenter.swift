//
//  PlaceDetailPresenter.swift
//  Places
//
//  Created by NARA on 4/16/18.
//  Copyright © 2018 Ministerio de Transportes y Comunicaciones. All rights reserved.
//

import UIKit
protocol PlaceDetailViewPresenter {
    init(view:PlaceDetailViewController,model:PlaceDetailModel)
    func loadProtocols()
}
class PlaceDetailPresenter: PlaceDetailViewPresenter,PlaceDetailModelDelegate,PlaceDetailViewControllerDelegate {
    unowned let view:PlaceDetailViewController
    var model:PlaceDetailModel
    required init(view: PlaceDetailViewController, model: PlaceDetailModel) {
        self.view = view
        self.model = model
    }
    
    func loadProtocols() {
        self.view.delegate = self
        self.model.delegate = self
    }
    // MARK - Model
    func completesDetailDepartments(detail: DepartmentDetail) {
        self.model.department.detail = detail
        self.view.textView.text = detail.detail
       self.view.showCoordinate(detail: detail)
    }
    // MARK - View
    func loadViewCompleted() {
        self.view.lblTitle.text = self.model.department.title
        self.view.loadImage(url: Preferences.WebUrl.urlBase + self.model.department.imgUrl)
        self.model.getDetailDepartment(department: self.model.department)
    }
    func getDetailForMap() {
        self.view.showDetailMap(detail: self.model.department.detail)
    }
   
    
}
