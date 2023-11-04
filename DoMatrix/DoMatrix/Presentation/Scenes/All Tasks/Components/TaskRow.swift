//
//  TaskRow.swift
//  DoMatrix
//
//  Created by Baher Tamer on 04/11/2023.
//

import OSLog
import SwiftUI

struct TaskRow: View {
    
    @Environment(\.modelContext) private var modelContext
    
    var task: DMTask
    
    var body: some View {
        HStack {
            Button {
                checkBoxButtonPressed()
            } label: {
                Image(systemName: task.isCompleted ? SFSymbols.taskIsCompleted : SFSymbols.taskIsNotCompleted)
                    .font(.headline)
                    .foregroundStyle(task.priority.color)
                    .imageScale(.large)
            }
            
            Text(task.title)
                .foregroundStyle(task.isCompleted ? .secondary : .primary)
        }

    }
}

// MARK: - Functions
extension TaskRow {
    
    private func checkBoxButtonPressed() {
        withAnimation {
            task.isCompleted.toggle()
            saveContext()
        }
    }
    
    private func saveContext() {
        do {
            try modelContext.save()
        } catch {
            Logger.saveContext.error("Failed to save the task, \(error).")
        }
    }
    
}
