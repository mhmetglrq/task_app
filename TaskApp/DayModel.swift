//
//  DayModel.swift
//  TaskApp
//
//  Created by Mehmet Güler on 23.11.2025.
//

import Foundation

struct DayModel: Identifiable , Hashable {
    let id = UUID()
    let date: Date
    var isSelected: Bool = false
    var tasks: [TaskModel] = []
    
    // Gün numarası (1, 2, 3, ...)
    var dayNumber: Int {
        Calendar.current.component(.day, from: date)
    }
    
    // Kısa gün ismi (Mon, Tue vs.)
    var dayNameShort: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "E"
        return formatter.string(from: date)
    }
    
    // Bugün mü?
    var isToday: Bool {
        Calendar.current.isDateInToday(date)
    }
}


extension DayModel {
    static func monthDays(
        for date: Date = Date(),
        calendar: Calendar = .current
    ) -> [DayModel] {
        guard let range = calendar.range(of: .day, in: .month, for: date),
              let monthStart = calendar.date(from: calendar.dateComponents([.year, .month], from: date))
        else { return [] }
        
        return range.compactMap { day -> DayModel? in
            calendar.date(byAdding: .day, value: day - 1, to: monthStart)
                .map { DayModel(date: $0) }
        }
    }
}
