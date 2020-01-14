//
//  ViewController.swift
//  MDatePickerViewDemo
//
//  Created by Matt on 2020/1/13.
//  Copyright © 2020 Matt. All rights reserved.
//

import UIKit
import MDatePickerView

class ViewController: UIViewController {
    
    lazy var MDate : MDatePickerView = {
            let mdate = MDatePickerView()
            mdate.delegate = self
            mdate.Color = UIColor(red: 0/255, green: 178/255, blue: 113/255, alpha: 1)
            mdate.translatesAutoresizingMaskIntoConstraints = false
            mdate.from = 1920
            mdate.to = 2050
            return mdate
        }()
        
        let Today : UIButton = {
            let but = UIButton(type:.system)
            but.setTitle("ToDay", for: .normal)
            but.addTarget(self, action: #selector(today), for: .touchUpInside)
            but.translatesAutoresizingMaskIntoConstraints = false
            return but
        }()
        
        let Label : UILabel = {
            let label = UILabel()
            label.textColor = .white
            label.font = UIFont.boldSystemFont(ofSize: 32)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()

        @objc func today() {
            MDate.selectDate = Date()
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .black
            view.addSubview(MDate)
            MDate.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
            MDate.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
            MDate.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7).isActive = true
            MDate.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4).isActive = true
            
            view.addSubview(Today)
            Today.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
            Today.topAnchor.constraint(equalTo: MDate.bottomAnchor, constant: 20).isActive = true
            
            view.addSubview(Label)
            Label.topAnchor.constraint(equalTo: Today.bottomAnchor, constant: 30).isActive = true
            Label.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        }
        

    }

    extension ViewController : MDatePickerViewDelegate {
        func mdatePickerView(selectDate: Date) {

            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy - MM - dd"
            let date = formatter.string(from: selectDate)
            Label.text = date
        }
    }
