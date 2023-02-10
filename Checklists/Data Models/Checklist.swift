//
//  Checklist.swift
//  Checklists
//
//  Created by Dylan DeSantis on 2/8/23.
//

import UIKit

class Checklist: NSObject, Codable {
    var iconName = ""
    var name = ""
    var items = [ChecklistItem]()
    
    init(name: String, iconName: String = "No Icon") {
      self.name = name
        self.iconName = iconName
      super.init()
    }
    
    func countUncheckedItems() -> Int {
        var count = 0
        for item in items where !item.checked {
            count += 1
        }
        return count
    }
    
}
