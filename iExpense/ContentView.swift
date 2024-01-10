//
//  ContentView.swift
//  iExpense
//
//  Created by Kirill Baranov on 05/12/23.
//

import SwiftUI

struct ContentView: View {
    @State private var expenses = Expenses()
    @State private var showingAddExpense = false
    
    
    var body: some View {
        
        NavigationStack {
            List {
                
                Section("Personal") {
                
                    ForEach(expenses.items.filter { $0.type ==  "Personal" }) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                Text(item.type)
                            }
                            
                            Spacer()
                            if item.amount < 10 {
                                Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                            } else if item.amount < 100 {
                                Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                                    .bold()
                            } else {
                                Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                                    .bold()
                                    .foregroundStyle(.red)
                            }
                            
                        }
                    }
                    .onDelete(perform: removePersonalItems)
                }
                Section("Business") {
                
                    ForEach(expenses.items.filter { $0.type ==  "Business" }) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                Text(item.type)
                            }
                            
                            Spacer()
                            if item.amount < 10 {
                                Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                            } else if item.amount < 100 {
                                Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                                    .bold()
                            } else {
                                Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                                    .bold()
                                    .foregroundStyle(.red)
                            }
                            
                        }
                    }
                    .onDelete(perform: removeBusinessItems)
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button("Add Expense", systemImage: "plus") {
                    showingAddExpense = true
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
    
    
    func removePersonalItems(at offsets: IndexSet) {
        let personalItems = expenses.items.filter { $0.type ==  "Personal" }
        for index in offsets {
            let IDtoDelete = personalItems[index].id
            expenses.items.removeAll(where: {$0.id == IDtoDelete})
        }
        
    }
    func removeBusinessItems(at offsets: IndexSet) {
        let businessItems = expenses.items.filter { $0.type ==  "Business" }
        for index in offsets {
            let IDtoDelete = businessItems[index].id
            expenses.items.removeAll(where: {$0.id == IDtoDelete})
        }
    }
}

#Preview {
    ContentView()
}

