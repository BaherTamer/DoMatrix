//
//  TasksListView.swift
//  DoMatrix
//
//  Created by Baher Tamer on 04/11/2023.
//

import SwiftData
import SwiftUI

struct TasksListView: View {
    
    @Environment(\.modelContext) private var modelContext
    
    @Query private var tasks: [DMTask]
    
    private let priority: DMPriority
    
    init(priority: DMPriority) {
        self.priority = priority
        
        // Return predicate based on priority to filter tasks based on priority
        _tasks = Query(filter: priority.predicate)
    }
    
    var body: some View {
        Section {
            ForEach(tasks, id: \.id) { task in
                TaskRow(task: task)
            }
        }
        .listSectionSeparator(.hidden)
    }
}
