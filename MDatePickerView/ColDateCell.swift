//
//  ColMonthCell.swift
//  MDatePickerView
//
//  Created by Matt on 2020/1/9.
//  Copyright © 2020 Matt. All rights reserved.
//

import UIKit

class ColMonthCell: ColCell {
    
    let month = ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"]
    var value = 0
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = Col.dequeueReusableCell(withReuseIdentifier: ColCellID, for: indexPath) as! Cell
        cell.Label.text = "\(month[indexPath.row])"
        cell.Week.isHidden = WeekIsHidden
        cell.Label.textColor = .white
        cell.Label.font = UIFont.boldSystemFont(ofSize: frame.height / 2.5)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.CallDate(Type:.Month(indexPath.row + 1))
        Col.scrollToItem(at: [0,indexPath.row], at: .centeredHorizontally, animated: true)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        CellType = .Month(.zero)
        
        if value < 2 {
            if (Selected[1]) - 1 == 0 {
                value += 1
                return
            }
        }
        Col.scrollToItem(at: [0,(Selected[1]) - 1], at: .centeredHorizontally, animated: true)
        
    }
    
    override func selectDate(_ T : Int) {
        delegate?.CallDate(Type:.Month(T))
    }
}

class ColDayCell: ColCell {
    
    var day = 0
    let week = ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"]
    
    override var Selected: [Int] {
        didSet{
            let time = DateComponents(calendar: Calendar.current, year: Selected[0], month: Selected[1])
            let calendar = Calendar(identifier:Calendar.Identifier.gregorian)
            let range = (calendar as NSCalendar?)?.range(of: NSCalendar.Unit.day, in: NSCalendar.Unit.month, for: time.date ?? Date())
            day = range?.length ?? 30
            
            let week = DateComponents(calendar: Calendar.current, year: Selected[0], month: Selected[1],day: 1)
            let comps = (calendar as NSCalendar?)?.components(NSCalendar.Unit.weekday, from: week.date ?? Date())
            if let Comps = comps?.weekday {
                CellType = .Day(week: Comps - 1, range: day)
            }
        
            if day < Selected[2] {
                Col.reloadData()
                Col.scrollToItem(at: [0,day - 1], at: .centeredHorizontally, animated: true)
                return
            }
            Col.reloadData()
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return day
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = Col.dequeueReusableCell(withReuseIdentifier: ColCellID, for: indexPath) as! Cell
        
        
        let time = DateComponents(calendar: Calendar.current, year: Selected[0], month: Selected[1],day: indexPath.row + 1)
        let calendar = Calendar(identifier:Calendar.Identifier.gregorian)
        let comps = (calendar as NSCalendar?)?.components(NSCalendar.Unit.weekday, from: time.date ?? Date())
        if let Comps = comps?.weekday {
            cell.Week.text = week[Comps - 1]
        }
        
        cell.Label.font = UIFont.boldSystemFont(ofSize: frame.height / 2)
        cell.Week.font = UIFont.boldSystemFont(ofSize: frame.height / 6)
        cell.Label.text = "\(indexPath.row + 1)"
        cell.Week.isHidden = false
        cell.Week.textColor = WeekColor
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        Col.scrollToItem(at: [0,indexPath.row], at: .centeredHorizontally, animated: true)
        delegate?.CallDate(Type:.Day(week: indexPath.row + 1, range: .zero))
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        Col.scrollToItem(at: [0,(Selected[2]) - 1], at: .centeredHorizontally, animated: true)
    }
    
    override func selectDate(_ T : Int) {
        delegate?.CallDate(Type:.Day(week: T, range: .zero))
    }
}

class ColYearCell: ColCell {
    
    lazy var Year : [Int] = {
        var year = [Int]()
        for i in from...to {
            year.append(i)
        }
        return year
    }()
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Year.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = Col.dequeueReusableCell(withReuseIdentifier: ColCellID, for: indexPath) as! Cell
        cell.Label.text = "\(Year[indexPath.row])"
        cell.Week.isHidden = WeekIsHidden
        cell.Label.font = UIFont.boldSystemFont(ofSize: frame.height / 2.5)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.CallDate(Type:.Year(select: Year[indexPath.row], range: .init()))
        Col.scrollToItem(at: [0,indexPath.row], at: .centeredHorizontally, animated: true)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        CellType = .Year(select: .zero, range: Year)
        
        var Index = Year.count - 1
        
        for (index, value) in Year.enumerated() {
            if value == Selected[0] {
                Index = index
            }
        }
        Col.scrollToItem(at: [0,Index], at: .centeredHorizontally, animated: true)
    }
    
    override func selectDate(_ T : Int) {
        delegate?.CallDate(Type:.Year(select: Year[T - 1], range: .init()))
    }
}
