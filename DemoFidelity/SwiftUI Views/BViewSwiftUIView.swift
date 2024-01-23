//
//  BViewSwiftUIView.swift
//  DemoFidelity
//
//  Created by Kenneth Cluff on 1/22/24.
//

import SwiftUI

struct BViewSwiftUIView: View {
    
    @Binding var someNewText: String
    
    var body: some View {
        TextField("Say Something", text: $someNewText, axis: .vertical)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
        Spacer()
    }
}

#Preview {
    BViewSwiftUIView(someNewText: .constant("Test this"))
}
