//
//  ExpenceView.swift
//  iExpense
//
//  Created by Kirill Baranov on 21/01/24.
//

import SwiftData
import SwiftUI

struct ExpenceView: View {
    
    @Environment (\.modelContext) var modelContex
    @Query var expenses: [ExpenseItem]
    
    var body: some View {
        List {
            
            if !(expenses.filter { $0.type ==  "Personal" }).isEmpty {
                Section("Personal") {
                
                    ForEach(expenses.filter { $0.type ==  "Personal" }) { item in
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
            }
            
            if !(expenses.filter { $0.type ==  "Business" }).isEmpty {
                Section("Business") {
                    
                    ForEach(expenses.filter { $0.type ==  "Business" }) { item in
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
        }
    }
    
    init(filterValue: String, sortOrder: [SortDescriptor<ExpenseItem>]) {
        if filterValue != "All" {
            _expenses = Query(filter: #Predicate {
                $0.type == filterValue
            } ,sort: sortOrder)
        } else {
            _expenses = Query(sort: sortOrder)
        }
    }
    
    func removePersonalItems(at offsets: IndexSet) {
        do {
            let personalItems = expenses.filter { $0.type ==  "Personal" }
            for index in offsets {
                let IDtoDelete = personalItems[index].id
                try modelContex.delete(model: ExpenseItem.self, where: #Predicate {$0.id == IDtoDelete})
            }
        } catch {
            print("Failed to delete personal item")
        }
        
    }
    
    func removeBusinessItems(at offsets: IndexSet) {
        do {
            let businessItems = expenses.filter { $0.type ==  "Business" }
            for index in offsets {
                let IDtoDelete = businessItems[index].id
                try modelContex.delete(model: ExpenseItem.self, where: #Predicate {$0.id == IDtoDelete})
            }
        } catch {
            print("Failed to delete business item")
        }
    }
}

//#Preview {
//    ExpenceView()
//}
