//
//  ContentView.swift
//  Todo Amplify AWS
//
//  Created by user on 2020/11/24.
//

import SwiftUI
import Amplify
import AmplifyPlugins

struct ContentView3: View {

    var body: some View {
        Text("Hello, World!")
            .onAppear {
                self.performOnAppear()
        }
    }

    func performOnAppear() {
       Amplify.DataStore.query(Todo.self,
                               where: Todo.keys.priority.eq(Priority.high)) { result in
           switch(result) {
           case .success(let todos):
               for todo in todos {
                   print("==== Todo ====")
                   print("Name: \(todo.name)")
                   if let priority = todo.priority {
                       print("Priority: \(priority)")
                   }
                   if let description = todo.description {
                       print("Description: \(description)")
                   }
               }
           case .failure(let error):
               print("Could not query DataStore: \(error)")
           }
       }
    }
}

struct ContentView3_Previews: PreviewProvider {
    static var previews: some View {
        ContentView3()
    }
}
