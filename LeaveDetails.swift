//
//  LeaveDetails.swift
//  TzlilMakeUp
//
//  Created by daniel medalsi on 21/06/2018.
//  Copyright © 2018 danielMedalsi. All rights reserved.
//

import UIKit

var lbl_title: UILabel!
var lbl_name: UILabel!
var txtFirstName: UITextField!
var txtLastName: UITextField!
var txtPhone: UITextField!
var btnSendDetails = UIButton(type: .system)
var btnCancel = UIButton(type: .system)
var data: Data!
var session: URLSession!




class LeaveDetails: UIViewController {
    
    let backbutton = UIButton(type: .system)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lbl_title = UILabel(frame: CGRect(x: (view.frame.width/2)-60, y: 20, width: 150, height: 30))
        lbl_title.text = "Tzlil Makeup"
        view.addSubview(lbl_title)
        navigationItem.titleView = lbl_title
        
        lbl_name = UILabel(frame: CGRect(x: (view.frame.width/2)-50, y: 80, width: 150, height: 20))
        lbl_name.text = "Details"
        view.addSubview(lbl_name)
        
        backbutton.frame = CGRect (x: 10, y: 20, width: 50, height: 40)
        backbutton.setTitle("<Menu",for: .normal)
        backbutton.setTitleColor(backbutton.currentTitleColor, for: .normal)
        backbutton.addTarget(self, action: #selector(back(senderBack:)), for: .touchUpInside)
        view.addSubview(backbutton)
        
        txtFirstName = UITextField(frame: CGRect(x: lbl_name.frame.origin.x-30, y: lbl_name.frame.origin.y+30, width: 150, height: 25))
        txtFirstName.borderStyle = .line
        txtFirstName.font = UIFont.boldSystemFont(ofSize: 20)
        txtFirstName.placeholder = "first name"
        view.addSubview(txtFirstName)
        
        txtLastName = UITextField(frame: CGRect(x: txtFirstName.frame.origin.x, y: txtFirstName.frame.origin.y+30, width: 150, height: 25))
        txtLastName.borderStyle = .line
        txtLastName.font = UIFont.boldSystemFont(ofSize: 20)
        txtLastName.placeholder = "last name"
        view.addSubview(txtLastName)
        
        txtPhone = UITextField(frame: CGRect(x: txtLastName.frame.origin.x, y: txtLastName.frame.origin.y+30, width: 150, height: 25))
        txtPhone.borderStyle = .line
        txtPhone.font = UIFont.boldSystemFont(ofSize: 20)
        txtPhone.placeholder = "Enter phone"
        view.addSubview(txtPhone)
        
        
        
       
       
       btnSendDetails.frame = CGRect(x: txtPhone.frame.origin.x+55, y: txtPhone.frame.origin.y+40, width: 50, height: 30)
        btnSendDetails.setTitle("Send", for: .normal)
        btnSendDetails.addTarget(self, action: #selector(sendDetailsToServer(sender:)), for: .touchUpInside)
        view.addSubview(btnSendDetails)
    
        
         view.backgroundColor = UIColor.white
    }

    
    @objc func sendDetailsToServer(sender: UIButton){
        data = Data()
        
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 60.0
        session = URLSession(configuration: configuration, delegate: self as? URLSessionDelegate, delegateQueue: nil)
        
        let url = URL(string: "http://35.196.251.187/tzlilMakeupServerIOS_war/PushContact?txt_first_name=AVi&txt_last_name=meda&txt_phone=7879898978")
        let task = session.dataTask(with: url!) { (data: Data?, response: URLResponse?, error: Error?) in
            print("OK!")
            if error == nil{
                if let theData = data{
                    if theData.count > 0{
                        let s = String(data: theData, encoding: String.Encoding.utf8)
                        print(s!)
                    }
                }
            }
        }
        
       
        
    
        task.resume()
    }
    
    @objc func back(senderBack: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
}
