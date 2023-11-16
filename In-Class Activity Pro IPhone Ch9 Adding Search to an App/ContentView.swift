//
//  ContentView.swift
//  In-Class Activity Pro IPhone Ch9 Adding Search to an App
//
//  Created by Student Account on 11/15/23.
//

import SwiftUI

class Library : ObservableObject {
    @Published var myBooks = [BookObject(title: "The Way of Kings", author: "Brandon Sanderson"), BookObject(title: "Words of Radiance", author: "Brandon Sanderson"), BookObject(title: "Oathbringer", author: "Brandon Sanderson"), BookObject(title: "Rhythm of War", author: "Brandon Sanderson") , BookObject(title: "Ender's Game", author: "Orson Scott Card"), BookObject(title: "Speaker for the Dead", author: "Orson Scott Card"), BookObject(title: "Xenocide", author: "Orson Scott Card"), BookObject(title: "Earth Unaware", author: "Orson Scott Card"), BookObject(title: "Earth Afire", author: "Orson Scott Card"), BookObject(title: "The Name of the Wind", author: "Patrick Rothfus") , BookObject(title: "The Wise Man's Fear", author: "Patrick Rothfus"), BookObject(title: "Game of Thrones", author: "George R. R. Martin"), BookObject(title: "A Clash of Kings", author: "George R. R. Martin"), BookObject(title: "A Storm of Swords", author: "George R. R. Martin"), BookObject(title: "A Feast for Crows", author: "George R. R. Martin"), BookObject(title: "Shadow and Bone", author: "Leigh Bardugo"), BookObject(title: "Siege and Storm", author: "Leigh Bardugo"), BookObject(title: "Ruin and Rising", author: "Leigh Bardugo")]
}

struct ContentView: View {
    @State var searchText = ""
    @StateObject var library = Library()
    @State var isPresent = true
    var body: some View {
        NavigationView{
            LibraryListView()
        }.searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Look for a book") {
            Text("Brandon Sanderson").searchCompletion("Brandon Sanderson")
            Text("Orson Scott Card").searchCompletion("Orson Scott Card")
            Text("Leigh Bardugo").searchCompletion("Leigh Bardugo")
            Divider()
            ForEach(library.myBooks.filter {$0.title.hasPrefix(searchText)}) { book in
            Text(book.title)
            }
            ForEach(library.myBooks.filter {$0.author.hasPrefix(searchText)}) { book in
                Text(book.title)
                }
        }
    }
}
struct LibraryListView: View {
    @StateObject var library = Library()
    var body: some View {
        List {
            ForEach(library.myBooks) { book in
                Text(book.title)
            }
        }
    }
}
struct BookObject: Identifiable{
    var id = UUID()
    let title: String
    var author: String
}

#Preview {
    ContentView()
}
