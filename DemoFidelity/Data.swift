//
//  Data.swift
//  DemoFidelity
//
//  Created by Kenneth Cluff on 1/23/24.
//

import Foundation


/// Source of truth for the app.
///     In this use case, I made the object a singleton. Since only one view would be present at a time, I could get away
///     with a simple implementation like this. I published the one property which all of the views would interact with. I
///     made the singleton more for the UIKit viewcontroller. If there were no UIKit view controller in this app, a singleton
///     wouldn't be needed as all the other views inherit from the ContentView. Making it a state object would be enoujgh.
class DataTransporter: ObservableObject {
    static let shared: DataTransporter = DataTransporter()
    
    @Published var textValue: String = "Start with this"
}
