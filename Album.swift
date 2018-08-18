//
//  Album.swift
//  TzlilMakeUp
//
//  Created by danielmedalsi1234 on 17/08/2018.
//  Copyright © 2018 danielMedalsi. All rights reserved.
//

import UIKit

class Album_c: UIViewController {
    
    var lbl_title: UILabel!
    var lbl_name: UILabel!
    let backbutton = UIButton(type: .system)
    let nextImage = UIButton(type: .system)
    var imageView: UIImageView!
    var image_i: UIImage!
     let images: [UIImage] = [UIImage(named: "pic1")!,UIImage(named: "pic2")!,UIImage(named: "pic3")!,UIImage(named: "pic4")!,UIImage(named: "pic5")!,UIImage(named: "pic6")!]
    var index: Int = 1
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        lbl_title = UILabel(frame: CGRect(x: (view.frame.width/2)-60, y: 20, width: 150, height: 30))
        lbl_title.text = "Tzlil Makeup"
        view.addSubview(lbl_title)
        navigationItem.titleView = lbl_title
        
        lbl_name = UILabel(frame: CGRect(x: (view.frame.width/2)-50, y: 80, width: 150, height: 20))
        lbl_name.text = "Album"
        view.addSubview(lbl_name)
        
        image_i = images[0]
        //self.imageView = UIImageView(image: image)
        self.imageView = UIImageView(frame: self.view.frame)
        self.imageView.image = image_i
        imageView.contentMode = .scaleAspectFit
        imageView.center = self.view.center
        self.view.addSubview(imageView)
        
        nextImage.frame = CGRect (x: (view.frame.width)-50, y: view.frame.height-90, width: 50, height: 30)
        nextImage.setTitle("Next>",for: .normal)
        nextImage.setTitleColor(backbutton.currentTitleColor, for: .normal)
        nextImage.addTarget(self, action: #selector(nextImage(senderNext:)), for: .touchUpInside)
        view.addSubview(nextImage)
        
        backbutton.frame = CGRect (x: 5, y: 15, width: 50, height: 30)
        backbutton.setTitle("Cancel",for: .normal)
        backbutton.setTitleColor(backbutton.currentTitleColor, for: .normal)
        backbutton.addTarget(self, action: #selector(back(senderBack:)), for: .touchUpInside)
        view.addSubview(backbutton)
        
        
        
    }
    
    @objc func nextImage(senderNext: UIButton){
        if index < images.count{
            self.imageView.image = images[index]
            index = index + 1
            print(index)
        }else{
            index = 0
             self.imageView.image = images[index]
            Toast(message: "Start again")
        }
    }
    
    @objc func back(senderBack: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func Toast(message : String) {
        
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 150, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.font = UIFont(name: "Montserrat-Light", size: 12.0)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
    
}
