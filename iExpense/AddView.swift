//
//  AddView.swift
//  iExpense
//
//  Created by Kirill Baranov on 09/01/24.
//

import SwiftData
import SwiftUI

struct AddView: View {
    @State private var name = "New expense"
    @State private var type = "Personal"
    @State private var amount = 0.0
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    
    @Query var expenses: [ExpenseItem]

    let types = ["Business", "Personal"]

    var body: some View {
        NavigationStack {
            Form {

                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }

                TextField("Amount", value: $amount, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle($name)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                            Button("Cancel") {
                                dismiss()
                            }
                        }   
                ToolbarItem {
                    Button("Save") {
                        let item = ExpenseItem(name: name, type: type, amount: amount)
                        modelContext.insert(item)
                        dismiss()
                    }
                }
            }
            .navigationBarBackButtonHidden()

        }
    }
}

#Preview {
    AddView()
}
