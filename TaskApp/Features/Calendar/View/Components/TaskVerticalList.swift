//
//  TaskVerticalList.swift
//  TodoApp
//
//  Created by Mehmet Güler on 24.11.2025.
//

import SwiftUI

struct TaskVerticalList: View {
    let tasks: [TaskModel]
    let title: String
    var body: some View {
        VStack (alignment: .leading ){
            Text(title)
                .font(Font.largeTitle.bold())
                .accessibilityLabel(Text("\(tasks.count) task(s)"))
            ForEach(tasks, id: \.self) { task in       HStack (spacing: 10) {
                    Image(systemName: "clock")
                        .font(.largeTitle)
                        .padding(10)
                        .background(.lightGray)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    VStack (alignment: .leading){
                        Text(task.title)
                            .font(.title3)
                            .bold()
                        Text(task.formattedDate)
                            .font(.subheadline)
                    }
                Spacer()
                }
            }
            
        }
        .padding(.horizontal,10)
        
            
    }
}

#Preview {
    TaskVerticalList(tasks: TaskModel.sampleList, title: "Today")
}
