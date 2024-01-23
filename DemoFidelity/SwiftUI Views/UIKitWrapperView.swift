//
//  UIKitWrapperView.swift
//  DemoFidelity
//
//  Created by Kenneth Cluff on 1/23/24.
//

import Foundation
import SwiftUI


// This is the SwiftUI wrapper needed to run a UIKit view inside a SwiftUI view
struct UIKitWrapperView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> AViewController {
        var retValue = AViewController()
        // Here is where you can also configure the view controller
        return retValue
    }
    
    func updateUIViewController(_ uiViewController: AViewController, context: Context) {
        // Here you can update the view controller as SwiftUI events occur. For this demo, this wasn't needed.
    }
    
    typealias UIViewControllerType = AViewController
}
