//
//  Untitled.swift
//  TodoApp
//
//  Created by Mehmet Güler on 24.11.2025.
//

import Foundation
import SwiftUI

extension Text {
    func priorityText(from priority: TaskPriority) -> some View {
        self
            .font(.subheadline)
            .foregroundStyle(priority.color)
    }
}

extension TaskPriority {
    var color: Color {
        switch self {
        case .high: return .red
        case .medium: return .orange
        case .low: return .green
        }
    }
}
