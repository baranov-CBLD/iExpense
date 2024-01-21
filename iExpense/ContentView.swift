//
//  ContentView.swift
//  iExpense
//
//  Created by Kirill Baranov on 05/12/23.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    
    @Environment (\.modelContext) var modelContex
    @Query var expenses: [ExpenseItem]
    
    @State private var filterValue = "All"
    
    @State private var showingAddExpense = false
    @State private var sortOrder = [
        SortDescriptor(\ExpenseItem.name),
        SortDescriptor(\ExpenseItem.amount)
    ]
    
    var body: some View {
        
        NavigationStack {
            VStack {
                ExpenceView(filterValue: filterValue, sortOrder: sortOrder)
            }
            .navigationTitle("iExpense")
            .toolbar {
                
                Menu("Filter", systemImage: "line.3.horizontal.decrease.circle") {
                    Picker("Type", selection: $filterValue) {
                        Text("All Items")
                            .tag("All")
                        Text("Personal")
                            .tag("Personal")
                        Text("Business")
                            .tag("Business")
                    }
                    
                }
                
                Menu("Sort", systemImage: "arrow.up.arrow.down") {
                    Picker("Sort", selection: $sortOrder) {
                        Text("Name")
                            .tag([
                                SortDescriptor(\ExpenseItem.name),
                                SortDescriptor(\ExpenseItem.amount)
                            ])
                        Text("Value")
                            .tag([
                                SortDescriptor(\ExpenseItem.amount),
                                SortDescriptor(\ExpenseItem.name)
                            ])
                    }
                }
                
                NavigationLink {
                    AddView()
                } label: {
                    Image(systemName: "plus")
                }
                
            }
            
        }
    }
    
    
    
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: ExpenseItem.self, configurations: config)
        return ContentView()
            .modelContainer(container)
    } catch {
        return Text("Failed to create container: \(error.localizedDescription)")
    }
}
