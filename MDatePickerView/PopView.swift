//
//  PopView.swift
//  MDatePickerView
//
//  Created by Matt on 2020/1/14.
//  Copyright © 2020 Matt. All rights reserved.
//

import UIKit

class PopView : UIViewController {
    
    let KeyboardCellid = "KeyboardCellid"
    
    let Label : UILabel = {
       let label = UILabel()
        label.text = "2054"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var KeyboardCol : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let col = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.minimumLineSpacing = 4
        layout.minimumInteritemSpacing = 4
        col.contentInset = UIEdgeInsets(top: 8, left: 45, bottom: 8, right: 45)
        col.delegate = self
        col.dataSource = self
        col.backgroundColor = .white
        col.translatesAutoresizingMaskIntoConstraints = false
        return col
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        KeyboardCol.register(numberCell.self, forCellWithReuseIdentifier: KeyboardCellid)
        
        view.addSubview(Label)
        NSLayoutConstraint.activate([
            Label.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            Label.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            Label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
        ])
        
        view.addSubview(KeyboardCol)
        NSLayoutConstraint.activate([
            KeyboardCol.topAnchor.constraint(equalTo: Label.bottomAnchor, constant: 0),
            KeyboardCol.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            KeyboardCol.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            KeyboardCol.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
        ])
    }
    
}

extension PopView : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = KeyboardCol.dequeueReusableCell(withReuseIdentifier: KeyboardCellid, for: indexPath) as! numberCell
        
        if indexPath.row != 9 && indexPath.row != 11{
            cell.Number.text = "\(indexPath.row + 1)"
            if indexPath.row == 10 {
                cell.Number.text = "0"
            }
            cell.backgroundColor = .lightGray
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collWidth = (collectionView.frame.width / 3) - 40
        return CGSize(width: collWidth , height: collWidth)
    }
    
}


class numberCell: UICollectionViewCell {
    
    let Number : UILabel = {
       let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = frame.height / 2
        
        addSubview(Number)
        NSLayoutConstraint.activate([
            Number.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
            Number.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
