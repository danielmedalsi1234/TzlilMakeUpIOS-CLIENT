//
//  LeaveDetalis.swift
//  TzlilMakeUp
//
//  Created by danielmedalsi1234 on 09/08/2018.
//  Copyright © 2018 danielMedalsi. All rights reserved.
//

import UIKit

class Leave_detalis: UIViewController{
    
    var lbl_name: UILabel!
    var full_name: UITextField!
    var lbl_phone: UILabel!
    var phone: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        lbl_name = UILabel(frame: CGRect( x: (view.frame.width)/2, y: 50, width: 80, height: 20))
        lbl_name.text = "Full name"
        lbl_name.textAlignment = .center
        view.addSubview(lbl_name)
        
    }
    
}


