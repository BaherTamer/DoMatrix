//
//  DMTask.swift
//  DoMatrix
//
//  Created by Baher Tamer on 04/11/2023.
//

import Foundation
import SwiftData

@Model
final class DMTask {
    
    @Attribute(.unique) var id: UUID
    
    var title: String
    var isUrgent: Bool
    var isImportant: Bool
    var isCompleted: Bool
    
    @Transient var priority: DMPriority {
        switch (self.isUrgent, self.isImportant) {
            
        // Urgent & Important
        case (true, true):
            return .doFirst
            
        // Not Urgent & Important
        case (false, true):
            return .schedule
            
        // Urgent & Not Important
        case (true, false):
            return .delegate
            
        // Not Urgent & Not Important
        case (false, false):
            return .dontDo
            
        }
    }
    
    init(
        id: UUID = UUID(),
        title: String = "New Task",
        isUrgent: Bool = false,
        isImportant: Bool = false,
        isCompleted: Bool = false
    ) {
        self.id = id
        self.title = title
        self.isUrgent = isUrgent
        self.isImportant = isImportant
        self.isCompleted = isCompleted
    }
}
