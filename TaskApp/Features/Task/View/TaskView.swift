//
//  TaskView.swift
//  TodoApp
//
//  Created by Mehmet Güler on 24.11.2025.
//

import SwiftUI

struct TaskView: View {
    var body: some View {
        NavigationStack {
            GeometryReader { geo in
                VStack {
                    TaskVerticalList()
                }
                .navigationTitle("Tasks")
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
}

#Preview {
    TaskView()
}
