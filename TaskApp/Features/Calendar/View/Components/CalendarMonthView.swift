//
//  Calendar.swift
//  TodoApp
//
//  Created by Mehmet Güler on 24.11.2025.
//

import SwiftUI

struct CalendarMonthView: View {
    @StateObject private var viewModel = CalendarViewModel()
    @State private var selectedDate: Date? = Date()
    
    private let columns = Array(repeating: GridItem(.flexible(),spacing: 4), count: 7)
    
    var body: some View {
        VStack(spacing: 12) {
            HStack {
                Button {
                    viewModel.changeMonth(by: -1)
                } label: {
                    Image(systemName: "chevron.left")
                }
                Spacer()
                Text(viewModel.monthTitle)
                    .font(.headline)
                Spacer()
                Button {
                    viewModel.changeMonth(by: 1)
                } label: {
                    Image(systemName: "chevron.right")
                }
                .padding(.horizontal)
            }
            HStack {
                ForEach(viewModel.weekDaySymbols, id: \.self) { symbol in
                    Text(symbol)
                        .font(.caption)
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(.secondary)
                }
            }
            .padding(.horizontal,4)
            
            LazyVGrid(columns: columns, spacing: 4) {
                ForEach(viewModel.gridDays) { day in
                    CalendarDayCell(
                        day: day,
                        isSelected: selectedDate.map { sel in
                            if let date = day.date {
                                return Calendar.current.isDate(sel, inSameDayAs: date)
                            }
                            return false
                        } ?? false
                    )
                    .onTapGesture {
                        if let date = day.date {
                            withAnimation(.easeInOut) {
                                selectedDate = date
                            }
                        }
                    }
                }
            }
            
            
        }
        .padding(.horizontal,10)
    }
}


struct CalendarDayCell: View {
    let day: CalendarDay
    let isSelected: Bool
    
    var body: some View {
        let isToday = day.isToday
        let inMonth = day.isInCurrentMonth
        
        Text(day.dayNumberText)
            .font(.subheadline)
            .frame(maxWidth: .infinity, minHeight: 32)
            .padding(4)
            .foregroundStyle(inMonth == false ? .gray.opacity(0.3) : (isSelected || isToday ? .white : .primary)
            )
            .background(
                Group {
                    if isToday {
                        Color.orange
                    } else if isSelected {
                        Color.blue
                    } else {
                        Color.clear
                    }
                }
            )
            .clipShape(RoundedRectangle(cornerRadius: 8))
        
    }
}

#Preview {
    CalendarMonthView()
}
