//
//  PopView.swift
//  MDatePickerView
//
//  Created by Matt on 2020/1/14.
//  Copyright © 2020 Matt. All rights reserved.
//

import UIKit

class CalendarContainer : UIViewController {
    
    let testView : UIView = {
        let v = UIView()
        v.backgroundColor = .white
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        
        view.addSubview(testView)
        
        NSLayoutConstraint.activate([
            testView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            testView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0),
            testView.heightAnchor.constraint(equalToConstant: 300),
            testView.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first?.view {
            if touch == self.view {
                dismiss(animated: true, completion: nil)
            }
        }
    }
}
