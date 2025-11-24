//
//  CalendarView.swift
//  TodoApp
//
//  Created by Mehmet Güler on 24.11.2025.
//

import SwiftUI

struct CalendarView: View {
    var body: some View {
        
        NavigationStack {
            VStack {
                CalendarMonthView()
                TaskVerticalList(
                    tasks: TaskModel.sampleList, title: "Today"
                )
            }
            .navigationTitle("Calendar")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    Button {
                        
                    } label: {
                        Image(systemName:"plus")
                    }
                }
            }
        }
    }
}

#Preview {
    CalendarView()
}
