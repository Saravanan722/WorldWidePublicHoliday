//: [Previous](@previous)

import Foundation

//@State
//Creates a new source of truth owned by your view. Does not share with other sources of truth.
//Use @State for transient data owned by the view. In other words, the state is local to the view.


//@Binding
//Creates a new source of truth owned by your view. Does not share with other sources of truth.
//Use @Binding for mutating data owned by another view.

//@ObservableObject
//ObservableObject is a protocol that can only be adopted by reference types (classes).
//A type of object with a publisher that emits before the object has changed.
//Use @Published to mark any properties that you want the changes to be managed automatically.

struct Book {
    var name: String
}

class BookStore: ObservableObject {
    @Published var books: [Book] = [Book(name: "The Great Influenza")]
    
    public func addBook(name: String) {
        self.books.append(Book(name: name))
    }
}

let bookStore = BookStore()
let subscription: AnyCancellable = bookStore.objectWillChange.sink(receiveValue: { books in
    print("bookStore will change")
})
bookStore.addBook(name: "Who's in Charge?")
print(bookStore.books)

