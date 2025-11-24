//
//  TaskViewModel.swift
//  TodoApp
//
//  Created by Mehmet Güler on 24.11.2025.
//

import Foundation
import Combine

class TaskViewModel: ObservableObject {
    @Published var tasks : [TaskModel] = TaskModel.sampleList
    
}
