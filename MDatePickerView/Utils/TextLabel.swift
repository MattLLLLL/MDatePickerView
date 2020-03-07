//
//  TextLabel.swift
//  MDatePickerView
//
//  Created by Bowei Liu on 2020/1/18.
//  Copyright © 2020 Matt. All rights reserved.
//

import UIKit

class TextLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(Text: String) {
        self.init(frame: .zero)
        self.text = Text
        self.textColor = .white
        self.textAlignment = .center
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
