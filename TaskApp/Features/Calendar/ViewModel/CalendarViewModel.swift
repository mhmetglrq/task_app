//
//  CalendarViewModel.swift
//  TodoApp
//
//  Created by Mehmet Güler on 24.11.2025.
//

import Foundation
import Combine

class CalendarViewModel: ObservableObject {
    @Published var currentMonthStart: Date
    private let calendar : Calendar
    
    init() {
             var cal = Calendar.current
             cal.firstWeekday = 2 // Pazartesi başlangıç
             self.calendar = cal
             
             let today = Date()
             self.currentMonthStart = cal.date(
                 from: cal.dateComponents([.year, .month], from: today)
             ) ?? today
    }
    
    
    var monthTitle : String {
        let formatter = DateFormatter()
        formatter.locale = .current
        formatter.dateFormat = "LLLL yyyy" // Kasım 2025
        return formatter.string(from: currentMonthStart)
    }
    
    var weekDaySymbols : [String] {
        let formatter = DateFormatter()
        formatter.locale = .current
        
        var symbols = formatter.shortWeekdaySymbols ?? []
        if calendar.firstWeekday == 2 {
            let sunday = symbols.removeFirst()
            symbols.append(sunday)
        }
        return symbols
    }
    
    var gridDays: [CalendarDay] {
        guard
            let range = calendar.range(of: .day, in: .month, for: currentMonthStart),
            let monthStart = calendar.date(from: calendar.dateComponents([.year,.month], from: currentMonthStart))
        else { return [] }
        
        let today = Date()
        
        let firstWeekdayOfMonth = calendar.component(.weekday, from: monthStart)
        let offset = (firstWeekdayOfMonth - calendar.firstWeekday + 7 ) % 7
        
        var cells : [CalendarDay] = []
        
        for _ in 0..<offset {
            cells.append(CalendarDay(date: nil, isInCurrentMonth: false, isToday: false))
        }
        
        for day in range {
            if let date = calendar.date(byAdding: .day, value: day - 1, to: monthStart) {
                let isToday = calendar.isDate(date, inSameDayAs: today)
                cells.append(CalendarDay(date: date, isInCurrentMonth: true, isToday: isToday))
            }
        }
        
        while cells.count < 42 {
            cells.append(CalendarDay(date: nil, isInCurrentMonth: false, isToday: false))
        }
        
        return cells
    }
    
    func changeMonth(by value: Int) {
        if let newMonth = calendar.date(byAdding: .month, value: value, to: currentMonthStart) {
            currentMonthStart = newMonth
        }
    }
}
