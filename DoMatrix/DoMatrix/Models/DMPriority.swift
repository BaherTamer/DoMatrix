//
//  DMPriority.swift
//  DoMatrix
//
//  Created by Baher Tamer on 04/11/2023.
//

import SwiftData
import SwiftUI

enum DMPriority: Int, CaseIterable {
    
    case doFirst = 1
    case schedule
    case delegate
    case dontDo
    
}

// MARK: Priority Titles
extension DMPriority {
    
    var title: String {
        switch self {
        case .doFirst:
            "Do First"
        case .schedule:
            "Schedule"
        case .delegate:
            "Delegate"
        case .dontDo:
            "Don't Do"
        }
    }
    
}

// MARK: Priority Colors
extension DMPriority {
    
    var color: Color {
        switch self {
        case .doFirst:
            .green
        case .schedule:
            .blue
        case .delegate:
            .orange
        case .dontDo:
            .red
        }
    }
    
}

// MARK: Priority Task Filters
extension DMPriority {
    
    var predicate: Predicate<DMTask> {
        switch self {
        case .doFirst:
            #Predicate<DMTask> {$0.isImportant && $0.isUrgent}      // Important & Urgent
        case .schedule:
            #Predicate<DMTask> {$0.isImportant && !$0.isUrgent}     // Important & Not Urgent
        case .delegate:
            #Predicate<DMTask> {!$0.isImportant && $0.isUrgent}     // Not Important & Urgent
        case .dontDo:
            #Predicate<DMTask> {!$0.isImportant && !$0.isUrgent}    // Not Important & Not Urgent
        }
    }
    
}
