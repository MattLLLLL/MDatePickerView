//
//  CustomDatePickerView.swift
//  MDatePickerView
//
//  Created by Bowei Liu on 2020/1/18.
//  Copyright © 2020 Matt. All rights reserved.
//

import UIKit

class CustomDatePickerView: UIView {
    
    let Month = ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"]
    let ColCellID = "ColCellID"
    var calendarController : CalendarController?
    var colcell : ColCell?
    var Selected = [Int]()
    var DATETYPE : DateType? {
        didSet{
            if let type = DATETYPE {
                switch type {
                case .Year(select: _, range: let Range):
                    for (index, value) in Range.enumerated() {
                        if value == Selected[0] {
                            Col.layoutIfNeeded()
                            Col.scrollToItem(at: [0,index], at: .centeredVertically, animated: false)
                            break
                        }
                    }
                case .Month(_):
                    break
                case .Day(_):
                    break
                }
            }
            YearPicker.text = "\(Month[Selected[1] - 1]),\(Selected[0])"
            Col.reloadData()
        }
    }
    
    lazy var YearPicker : UILabel = {
        let yearpicker = UILabel()
        yearpicker.textAlignment = .center
        yearpicker.textColor = .white
        yearpicker.font = UIFont.boldSystemFont(ofSize: 20)
        return yearpicker
    }()
    
    lazy var MonthStack : UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            TextLabel(Text: "S"),
            TextLabel(Text: "M"),
            TextLabel(Text: "T"),
            TextLabel(Text: "W"),
            TextLabel(Text: "T"),
            TextLabel(Text: "F"),
            TextLabel(Text: "S")
        ])
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var HeaderStack : UIStackView = {
        let stack = UIStackView(arrangedSubviews: [YearPicker,MonthStack])
        stack.axis = .vertical
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var Col : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let col = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        col.contentInset = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
        col.delegate = self
        col.dataSource = self
        col.backgroundColor = .white
        col.translatesAutoresizingMaskIntoConstraints = false
        return col
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 4
        Col.register(CustomCell.self, forCellWithReuseIdentifier: ColCellID)
        
        addSubview(HeaderStack)
        NSLayoutConstraint.activate([
            HeaderStack.topAnchor.constraint(equalTo:topAnchor, constant: 12),
            HeaderStack.leftAnchor.constraint(equalTo: leftAnchor, constant: 12),
            HeaderStack.rightAnchor.constraint(equalTo: rightAnchor, constant: -12)
        ])
        
        addSubview(Col)
        NSLayoutConstraint.activate([
            Col.topAnchor.constraint(equalTo:HeaderStack.bottomAnchor, constant: 8),
            Col.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
            Col.rightAnchor.constraint(equalTo: rightAnchor, constant: 0),
            Col.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CustomDatePickerView : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch DATETYPE {
        case .Year(select: _, range:_):
            MonthStack.isHidden = true
            return 1
        case .Month(_):
            MonthStack.isHidden = true
            return 12
        case .Day(week: let Week, range: let Range):
            MonthStack.isHidden = false
            return Range + Week
        default:
            return .zero
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = Col.dequeueReusableCell(withReuseIdentifier: ColCellID, for: indexPath) as! CustomCell
        cell.Color = backgroundColor ?? UIColor(red: 255/255, green: 97/255, blue: 82/255, alpha: 1)
        switch DATETYPE {
        case .Year(select: _, range: _):
            cell.backgroundColor = .red
        case .Month(_):
            cell.Label.text = "\(Month[indexPath.row])"
            if Selected[1] == indexPath.row + 1 {
                cell.isSelected = true
            }
        case .Day(week: let Week, range: _):
            if indexPath.row >= Week {
                cell.Label.text = "\((indexPath.row - Week) + 1)"
            }
            if Selected[2] == (indexPath.row - Week) + 1 {
                cell.isSelected = true
            }
        default:
            break
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch DATETYPE {
        case .Year(select: _, range: _):
            
            return CGSize(width: collectionView.frame.width - 24, height: 200)
        case .Month(_):
            let cellWidth = (collectionView.frame.width / 4) - 8
            return CGSize(width: cellWidth, height: 44)
        case .Day(_):
            let cellWidth = (collectionView.frame.width / 7) - 4
            return CGSize(width: cellWidth, height: 44)
        default:
            return .zero
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch DATETYPE {
        case .Year(select: _, range: let Range):
            colcell?.delegate?.CallDate(Type: .Year(select: Range[indexPath.row], range: .init()))
        case .Month(_):
            colcell?.delegate?.CallDate(Type: .Month(indexPath.row + 1))
        case .Day(week: let Week, range: _):
            colcell?.delegate?.CallDate(Type: .Day(week: (indexPath.row - Week) + 1, range: .zero))
        default:
            break
        }
        calendarController?.dismiss(animated: true, completion: nil)
    }
}

class CustomCell: Cell {
    
    var Color = UIColor()
    
    override var isSelected: Bool {
        didSet{
            backgroundColor = .white
            Label.textColor = .black
            if isSelected {
                backgroundColor = Color
                Label.textColor = .white
            }
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 4
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

