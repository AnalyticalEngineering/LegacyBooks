//
//  AddBookView.swift
//  LegacyBooks
//
//  Created by J. DeWeese on 1/30/24.
//

import SwiftUI
import SwiftData



struct AddNewBookView: View {
    ///Environment
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) var dismiss
    ///Presenting Toast
   
    ///Properties
    @State private var title = ""
    @State private var author = ""
    
    var body: some View {
        NavigationStack  {
            Form {
                TextField("Book Title", text: $title)
                TextField("Author", text: $author)
                Button("Add"){
                    HapticManager.notification(type: .success)
                    let newBook = Book(title: title, author: author)
                    context.insert(newBook)
                    dismiss()
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .buttonStyle(.borderedProminent)
                .padding(.vertical)
                .disabled(title.isEmpty || author.isEmpty)
                .navigationTitle( "New Book")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    ToolbarItem(placement: .topBarLeading) {
                        Button("Cancel") {
                            dismiss()
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    AddNewBookView()
}
