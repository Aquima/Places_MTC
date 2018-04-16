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
class CollectionDepartments: UIView,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,UICollectionViewDelegate{
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
    
        return CGSize(width: 149, height: 205)
    }
    func drawBody(){
          let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
            layout.scrollDirection = .vertical
            layout.sectionInset = UIEdgeInsets(top: 6.5, left: 6, bottom: 0, right: 6)
        
         let frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
        collectionview = UICollectionView(frame: frame, collectionViewLayout: layout)
        collectionview.register(DepartmentCell.self, forCellWithReuseIdentifier: cellId)
        collectionview.backgroundColor = UIColor.black
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
class DepartmentCell:UICollectionViewCell{
    var imgPLace:UIImageView = {
        let img = UIImageView()
        img.frame = CGRect(x: 0, y: 0, width: 149, height: 205)
        return img
    }()
    var shadowView:UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 149, height: 205)
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        return view
    }()
    var lblTitle:UILabel = {
        let lblLable = UILabel()
        lblLable.frame = CGRect(x: 25, y: 92, width: 117, height: 31)
        lblLable.font = UIFont.init(name: Styles.fonts.regular, size: 14)
        lblLable.numberOfLines = 2
        lblLable.lineBreakMode = .byWordWrapping
        lblLable.textColor = .white
        return lblLable
    }()
    var lblLema:UILabel = {
        let lblLable = UILabel()
        lblLable.frame = CGRect(x: 25, y: 157, width: 117, height: 12)
        lblLable.font = UIFont.init(name: Styles.fonts.regular, size: 10)
        lblLable.textColor = .white
        return lblLable
    }()
    var lblDate:UILabel = {
        let lblLable = UILabel()
        lblLable.frame = CGRect(x: 45, y: 171, width: 68, height: 24)
        lblLable.font = UIFont.init(name: Styles.fonts.regular, size: 9)
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
        self.addSubview(imgPLace)
        self.addSubview(shadowView)
        self.addSubview(lblTitle)
        self.addSubview(lblLema)
        self.addSubview(lblDate)
    }
}
