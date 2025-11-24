//
//  CalendarDay.swift
//  TodoApp
//
//  Created by Mehmet Güler on 24.11.2025.
//

import Foundation

struct CalendarDay: Identifiable {
    let id = UUID()
    let date: Date?
    let isInCurrentMonth: Bool
    let isToday: Bool
    
    var dayNumberText: String {
        guard let date else { return "" }
        return String(Calendar.current.component(.day, from: date))
    }
}
