//
//  ViewController.swift
//  TzlilMakeUp
//
//  Created by daniel medalsi on 21/06/2018.
//  Copyright © 2018 danielMedalsi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var controller: UIViewController!
    var lblTitle: UILabel!
    var btnItem: UIButton!
    var LeaveDetailsClass: LeaveDetails?
    var AlbumClass: Album_c?
    var ItemsClass: Items?
    var imageViewLeaveDetails: UIImageView!
    var imageViewItem: UIImageView!
    var btnGallery: UIButton!
    var imageView: UIImageView!
    let backbutton = UIButton(type: .system)
    var btnLeaveDetails: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblTitle = UILabel(frame: CGRect(x: (view.frame.width/2)-50, y: 20, width: 150, height: 20))
        lblTitle.text = "Tzlil Makeup"
        view.addSubview(lblTitle)
        navigationItem.titleView = lblTitle
        
        
        let backgroundGallery = UIImage(named: "pic1")
        btnGallery = UIButton(type: .custom)
        btnGallery.frame = CGRect(x: 50, y: 150, width: 100, height: 100)
        btnGallery.setTitle("Gallery", for: .normal)
        btnGallery.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        btnGallery.addTarget(self, action: #selector(EnterGallery(senderGallery:)), for: .touchUpInside)
        btnGallery.setBackgroundImage(backgroundGallery, for: .normal)
        view.addSubview(btnGallery)
        
        let backgroundItem = UIImage(named: "backgroundItem")
        btnItem = UIButton(type: .custom)
        btnItem.frame = CGRect(x: btnGallery.frame.origin.y+40, y: btnGallery.frame.origin.y, width: 100, height: 100)
        btnItem.setTitle("Items", for: .normal)
        btnItem.setTitleColor(btnItem.currentTitleColor, for: .normal)
        btnItem.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        btnItem.addTarget(self, action: #selector(EnterItem(senderItem:)), for: .touchUpInside)
        btnItem.setBackgroundImage(backgroundItem, for: .normal)
        view.addSubview(btnItem)
        
        let backgroundLeaveDetails = UIImage(named: "backgroundDetails")
        btnLeaveDetails = UIButton(type: .custom)
        btnLeaveDetails.frame = CGRect(x: 0, y: view.frame.height-200, width: 170, height: 180)
        btnLeaveDetails.setTitle("Leave details", for: .normal)
        btnLeaveDetails.setTitleColor(btnItem.currentTitleColor, for: .normal)
        btnLeaveDetails.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13.5)
        btnLeaveDetails.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 85, right: 15)
        btnLeaveDetails.setTitleColor(UIColor.black, for: .normal)
        
        btnLeaveDetails.addTarget(self, action: #selector(EnterLeaveDetails(senderLeaveDetails:)), for: .touchUpInside)
        btnLeaveDetails.setBackgroundImage(backgroundLeaveDetails, for: .normal)
        view.addSubview(btnLeaveDetails)
        
        
    }
    
    @objc func EnterLeaveDetails(senderLeaveDetails: UIButton){
        if LeaveDetailsClass == nil {
            LeaveDetailsClass = LeaveDetails()
        }
        present(LeaveDetailsClass!, animated: true, completion: nil)
        
    }
    
    @objc func EnterGallery(senderGallery: UIButton){
        if AlbumClass == nil {
            AlbumClass = Album_c()
        }
        present(AlbumClass!, animated: true, completion: nil)
        
    }
    
    
    
    @objc func EnterItem(senderItem: UIButton){
        if ItemsClass == nil {
            ItemsClass = Items()
        }
        present(ItemsClass!, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @objc func back(senderBack: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
   
    
    
    
}

