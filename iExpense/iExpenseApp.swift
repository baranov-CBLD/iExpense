//
//  iExpenseApp.swift
//  iExpense
//
//  Created by Kirill Baranov on 05/12/23.
//

import SwiftData
import SwiftUI

@main
struct iExpenseApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: ExpenseItem.self)
    }
}
