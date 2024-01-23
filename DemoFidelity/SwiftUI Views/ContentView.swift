//
//  ContentView.swift
//  DemoFidelity
//
//  Created by Kenneth Cluff on 1/22/24.
//

import SwiftUI

struct ContentView: View {
    
    // This is the wrapper for the UIKit view controller
    @State private var uiKitView = UIKitWrapperView()
    @State private var isShowing: Bool = false
    // This is the source of truth for the app. 
    @StateObject private var wrapper = DataTransporter.shared
    
    
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink{
                    uiKitView
                } label: {
                    Text("Click Me UIKit")
                }
                .buttonStyle(.bordered)
                .padding()
                TextField("", text: $wrapper.textValue, axis: .vertical)
                    .padding()
                
                Divider()
                
                NavigationLink{
                    BViewSwiftUIView(someNewText: $wrapper.textValue)
                } label: {
                    Text("Click Me SwiftUI")
                }
                .buttonStyle(.borderedProminent)
                .padding()
                
                Text(wrapper.textValue)
                    .padding()
                
                Divider()
                
                Button("Modal Editor") {
                    isShowing = true
                }
                .padding()
                
                Spacer()
            }
            .navigationTitle("Some Text")
            .sheet(isPresented: $isShowing, content: {
                TextField("Change me", text: $wrapper.textValue, axis: .vertical)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("Done") {
                    isShowing = false
                }
                Spacer()
            })
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
