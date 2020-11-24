//
//  ContentView.swift
//  Todo Amplify AWS
//
//  Created by user on 2020/11/24.
//

import SwiftUI
import Amplify
import AmplifyPlugins
import Combine

struct ContentView3: View {

    @State var todoSubscription: AnyCancellable?

    var body: some View {
        Text("Hello, World!")
            .onAppear {
                self.performOnAppear()
        }
    }

    func performOnAppear() {
        subscribeTodos()
    }

    func subscribeTodos() {
        self.todoSubscription
            = Amplify.DataStore.publisher(for: Todo.self)
            .sink(receiveCompletion: { completion in
                print("Subscription has been completed: \(completion)")
            }, receiveValue: { mutationEvent in
                print("Subscription got this value: \(mutationEvent)")

                do {
                    let todo = try mutationEvent.decodeModel(as: Todo.self)

                    switch mutationEvent.mutationType {
                    case "create":
                        print("Created: \(todo)")
                    case "update":
                        print("Updated: \(todo)")
                    case "delete":
                        print("Deleted: \(todo)")
                    default:
                        break
                    }

                } catch {
                    print("Model could not be decoded: \(error)")
                }
            })
    }
}


struct ContentView3_Previews: PreviewProvider {
    static var previews: some View {
        ContentView3()
    }
}
