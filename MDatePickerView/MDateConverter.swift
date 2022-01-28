//
//  MDateConverter.swift
//  MDatePickerView
//
//  Created by Carlos Mellado on 28/1/22.
//  Copyright © 2022 Matt. All rights reserved.
//

import Foundation

extension Date {

    func matchesComponentDay(_ componentDay: Int) -> Bool {
        
        let dateDay = Calendar.current.component(.day, from: self)
        
        return dateDay == componentDay
    }
}

enum MDateConverter {
    
    static func getMonthName(monthNumber : Int) -> String {
    
        var dateComponents = DateComponents()
        dateComponents.month = monthNumber
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM"
        let date = Calendar.current.date(from: dateComponents)!
        let string = dateFormatter.string(from: date)
        
        return string.replacingOccurrences(of: ".", with: "").capitalized
    }
    
    static func getDayNames() -> [String] {
        
        return NSCalendar.current.weekdaySymbols
    }
    
    static func rearrange<T>(array: Array<T>, fromIndex: Int, toIndex: Int) -> Array<T>{
        
        var arr = array
        
        let element = arr.remove(at: fromIndex)
        arr.insert(element, at: toIndex)

        return arr
    }
}
