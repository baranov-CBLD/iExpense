//
//  Expence.swift
//  iExpense
//
//  Created by Kirill Baranov on 09/01/24.
//

import Foundation
import SwiftData

@Model
class ExpenseItem: Identifiable {
    var id: UUID
    let name: String
    let type: String
    let amount: Double
    
    init(id: UUID = UUID(), name: String, type: String, amount: Double) {
        self.id = id
        self.name = name
        self.type = type
        self.amount = amount
    }
}

//@Observable
//class Expenses {
//    var items: [ExpenseItem] {
//        didSet {
//            if let encoded = try? JSONEncoder().encode(items) {
//                UserDefaults.standard.set(encoded, forKey: "Items")
//            }
//        }
//    }
//    
//    init() {
//        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
//            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
//                items = decodedItems
//                return
//            }
//        }
//
//        items = []
//    }
//    
//}
