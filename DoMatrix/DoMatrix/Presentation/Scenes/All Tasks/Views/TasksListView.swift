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
    
    @AppStorage(PreferenceKeys.showCompletedTasks) private var showCompletedTasks: Bool = false
    
    @Query private var originalTasks: [DMTask]
    
    private var tasks: [DMTask] {
        
        var filteredTasks: [DMTask] = []
        
        // Filter completed tasks from query or not
        if showCompletedTasks {
            filteredTasks = originalTasks
        } else {
            filteredTasks = originalTasks.filter({ !$0.isCompleted })
        }
        
        // Return tasks sorted by non-completed tasks first
        return filteredTasks.sorted(by: { !$0.isCompleted && $1.isCompleted })
    }
    
    init(priority: DMPriority) {
        // Return predicate based on priority to filter tasks based on priority
        _originalTasks = Query(filter: priority.predicate)
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
