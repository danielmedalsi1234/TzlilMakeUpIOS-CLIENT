//
//  Items.swift
//  TzlilMakeUp
//
//  Created by daniel medalsi on 29/06/2018.
//  Copyright © 2018 danielMedalsi. All rights reserved.
//

import UIKit

class Items: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let myArray: NSArray = ["Eyeliner","gloss","powder"]
    private var myTableView: UITableView!
    let backbutton = UIButton(type: .system)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backbutton.frame = CGRect (x: 10, y: 20, width: 50, height: 40)
        backbutton.setTitle("<Menu",for: .normal)
        backbutton.setTitleColor(backbutton.currentTitleColor, for: .normal)
        backbutton.addTarget(self, action: #selector(back(senderBack:)), for: .touchUpInside)
        view.addSubview(backbutton)
 
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        
        myTableView = UITableView(frame: CGRect(x: 0, y: backbutton.frame.maxY+10, width: displayWidth, height: displayHeight - barHeight))
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyItems")
        myTableView.dataSource = self
        myTableView.delegate = self
        self.view.addSubview(myTableView)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Num: \(indexPath.row)")
        print("Value: \(myArray[indexPath.row])")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyItems", for: indexPath as IndexPath)
        cell.textLabel!.text = "\(myArray[indexPath.row])"
        return cell
    }
    
    @objc func back(senderBack: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
