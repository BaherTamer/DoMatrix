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
