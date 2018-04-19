//
//  CollectionDepartments.swift
//  Places
//
//  Created by NARA on 4/12/18.
//  Copyright © 2018 Ministerio de Transportes y Comunicaciones. All rights reserved.
// Azure / Recognition OCR API - KEY

import UIKit
import SDWebImage
// 149 width 207 higth
protocol CollectionDepartmentsDelegate {
    func selectDepartment(department:Department)
}
class CollectionDepartments: BaseView,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,UICollectionViewDelegate{
    var delegate:CollectionDepartmentsDelegate?
    let cellId = "Cell"
    var collectionview: UICollectionView!
    var data:[Department] = [Department]()
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionview.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath as IndexPath) as! DepartmentCell
        cell.reloadWithDepartment(department: data[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
        return CGSize(width: 149*valuePro, height: 205*valuePro)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //con esto puedo ir al detalle
        self.delegate?.selectDepartment(department: data[indexPath.row])
    }
    func drawBody(){
          let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
            layout.scrollDirection = .vertical
            layout.sectionInset = UIEdgeInsets(top: 6.5*valuePro, left: 6*valuePro, bottom: 0, right: 6*valuePro)
        
         let frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
        collectionview = UICollectionView(frame: frame, collectionViewLayout: layout)
        collectionview.register(DepartmentCell.self, forCellWithReuseIdentifier: cellId)
        collectionview.backgroundColor = UIColor.white
        // collectionview.isPagingEnabled = true
        self.addSubview(collectionview)
    }
    func reloadView(data:[Department]){
        self.data = data
        collectionview.reloadData()
        collectionview.dataSource = self
        collectionview.delegate = self
    }
}
class DepartmentCell:BaseCollectionViewCell{
 
    var imgPLace:UIImageView = {
        let img = UIImageView()
        
        return img
    }()
    var shadowView:UIView = {
        let view = UIView()
        
 
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        return view
    }()
    var lblTitle:UILabel = {
        let lblLable = UILabel()
       
    
        lblLable.numberOfLines = 2
        lblLable.lineBreakMode = .byWordWrapping
        lblLable.textColor = .white
        return lblLable
    }()
    var lblLema:UILabel = {
        let lblLable = UILabel()
        

        lblLable.textColor = .white
        return lblLable
    }()
    var lblDate:UILabel = {
        let lblLable = UILabel()
        lblLable.numberOfLines = 2
        lblLable.lineBreakMode = .byWordWrapping
        lblLable.textColor = .white
        return lblLable
    }()
    func reloadWithDepartment(department:Department){
        self.lblTitle.text = department.title
        self.lblLema.text = department.lema
        self.lblDate.text = "25/10/2018 \n Octubre"// \n permite salto de linea
        self.imgPLace.sd_setImage(with: URL(string:Preferences.WebUrl.urlBase + department.imgUrl), completed: nil)
        
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func addViews(){
        imgPLace.frame = CGRect(x: 0, y: 0, width: 149*valuePro, height: 205*valuePro)
        shadowView.frame = CGRect(x: 0, y: 0, width: 149*valuePro, height: 205*valuePro)
        lblTitle.frame = CGRect(x: 25*valuePro, y: 92*valuePro, width: 117*valuePro, height: 31*valuePro)
        lblTitle.font = UIFont.init(name: Styles.fonts.regular, size: 14*valuePro)
        lblLema.frame = CGRect(x: 25*valuePro, y: 157*valuePro, width: 117*valuePro, height: 12*valuePro)
        lblLema.font = UIFont.init(name: Styles.fonts.regular, size: 10*valuePro)
        lblDate.frame = CGRect(x: 45*valuePro, y: 171*valuePro, width: 68*valuePro, height: 24*valuePro)
        lblDate.font = UIFont.init(name: Styles.fonts.regular, size: 9*valuePro)
        self.addSubview(imgPLace)
        self.addSubview(shadowView)
        self.addSubview(lblTitle)
        self.addSubview(lblLema)
        self.addSubview(lblDate)
        
    }
}
