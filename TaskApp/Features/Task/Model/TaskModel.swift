//
//  TaskModel.swift
//  TaskApp
//
//  Created by Mehmet Güler on 22.11.2025.
//

import SwiftData
import Foundation

@Model
class TaskModel: Identifiable{
    
    @Attribute(.unique) var id = UUID()
    var title: String
    var isCompleted: Bool
    var createdAt: Date
    var updatedAt: Date?
    var taskPriority: TaskPriority

    var formattedDate : String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        return dateFormatter.string(from: createdAt)
    }

    init(id: UUID = UUID(), title: String, isCompleted: Bool, createdAt: Date, updatedAt: Date? = nil, taskPriority: TaskPriority = .medium) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.taskPriority = taskPriority
    }
    
    static var sampleList = [
        TaskModel( title: "Buy groceries", isCompleted: false, createdAt: Date(), updatedAt: nil,taskPriority: .high),
        TaskModel( title: "Read a book", isCompleted: true, createdAt: Date(), updatedAt: nil,taskPriority: .low),
        TaskModel( title: "Workout", isCompleted: false, createdAt: Date(), updatedAt: nil),
        TaskModel( title: "Call mom", isCompleted: true, createdAt: Date(), updatedAt: nil)
    ]
}

enum TaskPriority: String, Codable {
    case low = "Low Priority"
    case medium = "Medium Priority"
    case high = "High Priority"
}
