//
//  TaskModel.swift
//  TaskApp
//
//  Created by Mehmet Güler on 22.11.2025.
//

import Foundation

struct TaskModel: Identifiable , Hashable{
    var id: Int
    var title: String
    var isCompleted: Bool
    var createdAt: Date
    var updatedAt: Date?
    
    var formattedDate : String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        return dateFormatter.string(from: createdAt)
    }
    
    
    static var sampleList = [
        TaskModel(id: 1, title: "Buy groceries", isCompleted: false, createdAt: Date(), updatedAt: nil),
        TaskModel(id: 2, title: "Read a book", isCompleted: true, createdAt: Date(), updatedAt: nil),
        TaskModel(id: 3, title: "Workout", isCompleted: false, createdAt: Date(), updatedAt: nil),
        TaskModel(id: 4, title: "Call mom", isCompleted: true, createdAt: Date(), updatedAt: nil)
    ]
}
