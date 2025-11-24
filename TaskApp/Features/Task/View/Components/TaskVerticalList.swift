//
//  TaskVerticalList.swift
//  TodoApp
//
//  Created by Mehmet Güler on 24.11.2025.
//

import SwiftUI

struct TaskVerticalList: View {
    @StateObject private var viewModel = TaskViewModel()
    
    var body: some View {
        ForEach($viewModel.tasks) { $task in
            HStack (spacing: 10) {
                Checkbox(isOn: $task.isCompleted,borderColor: task.taskPriority.color)
            VStack (alignment: .leading){
                Text(task.title)
                    .font(.title3)
                    .bold()
                Text(task.taskPriority.rawValue)
                    .priorityText(from: task.taskPriority)
            }
            Spacer()
            }
        }
        .padding(.horizontal,10)
        
            
    }
}

#Preview {
    TaskVerticalList()
}
