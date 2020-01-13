//
//  ColMonthCell.swift
//  MDatePickerView
//
//  Created by Matt on 2020/1/9.
//  Copyright © 2020 Matt. All rights reserved.
//

import UIKit
//import AudioToolbox

enum DateType {
    case Year(Int)
    case Month(Int)
    case Day(Int)
}

class ColCell: UICollectionViewCell {
    
    let ColCellID = "ColCellID"
    var delegate : ColCellDelegate?
    var WeekColor : UIColor?
    var WeekIsHidden = true
    var Selected : [Int]?
    
    lazy var Col : UICollectionView = {
        let layout = FlatCardCollectionViewLayout()
        let col = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        col.dataSource = self
        col.delegate = self
        col.showsHorizontalScrollIndicator = false
        col.contentInset = UIEdgeInsets(top: 0, left: (self.frame.width / 3) , bottom: 0, right: (self.frame.width / 3) )
        col.translatesAutoresizingMaskIntoConstraints = false
        col.backgroundColor = .white
        return col
    }()
    
    let Line : UIView = {
       let line = UIView()
        line.backgroundColor = UIColor.lightGray
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        Col.register(Cell.self, forCellWithReuseIdentifier: ColCellID)
        
        addSubview(Line)
        Line.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        Line.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
        Line.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
        Line.heightAnchor.constraint(equalToConstant: 0.7).isActive = true
        
        addSubview(Col)
        Col.topAnchor.constraint(equalTo: Line.bottomAnchor, constant: 0).isActive = true
        Col.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
        Col.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
        Col.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        Col.collectionViewLayout.invalidateLayout()
        Col.contentInset = UIEdgeInsets(top: 0, left: (self.frame.width / 3) , bottom: 0, right: (self.frame.width / 3) )
        Col.reloadData()
    }
}

extension ColCell : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UIScrollViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = Col.dequeueReusableCell(withReuseIdentifier: ColCellID, for: indexPath) as! Cell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (self.frame.width / 3) , height: (self.frame.height - 1) )
    }
    

//         let soundID = SystemSoundID(1519)
//         AudioServicesPlaySystemSound(soundID)

    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let cellwidth = (self.frame.width / 3) + 10
        
        var offset = targetContentOffset.pointee
        let index = (offset.x + scrollView.contentInset.left) / cellwidth
        let roundedIndex = round(index)
        
        offset = CGPoint(x: roundedIndex * cellwidth - scrollView.contentInset.left, y: -scrollView.contentInset.top)
        targetContentOffset.pointee = offset
        
        selectDate(Int(roundedIndex + 1))
    }
    
    @objc func selectDate(_ T : Int) { }
}

class Cell : UICollectionViewCell {
    
    lazy var Week : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.1
        label.numberOfLines = 1
        return label
    }()
    
    lazy var Label : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.1
        label.numberOfLines = 1
        return label
    }()
    
    lazy var Stack : UIStackView = {
       let stack = UIStackView(arrangedSubviews: [Label,Week])
        stack.axis = .vertical
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        addSubview(Stack)
        Stack.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
        Stack.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

public protocol MDatePickerViewDelegate {
    func mdatePickerView(selectDate:Date)
}

protocol ColCellDelegate {
    func CallDate(Type:DateType)
}
