//
//  TodosView.swift
//  TaskApp
//
//  Created by Mehmet Güler on 22.11.2025.
//

import SwiftUI

struct TodosView: View {
    var todos = TaskModel.sampleList
    
    var body: some View {
        ZStack {
            Color(.systemGray6)
                .ignoresSafeArea()
            VStack {
                DayHorizontalList()
                
            }
        }
    }
}

struct TodoRowView: View {
    let todo: TaskModel
    @State var isOn: Bool = false
    
    var body: some View {
        HStack {
            Text(todo.title)
            Spacer()
            CheckBox(isOn: $isOn)
        }
    }
}

struct CheckBox: View {
    @Binding var isOn: Bool
    
    var body: some View {
        Button{
            withAnimation(.linear) {
                isOn.toggle()
            }
        } label: {
            Image(systemName: isOn ? "checkmark.circle.fill" : "circle")
                .font(.system(size: 24))
                .foregroundStyle(isOn ? .blue : .primary)
        }
    }
}

#Preview {
    TodosView()
}
