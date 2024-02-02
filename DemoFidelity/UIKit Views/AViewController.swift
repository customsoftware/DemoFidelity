//
//  AViewController.swift
//  DemoFidelity
//
//  Created by Kenneth Cluff on 1/22/24.
//

import UIKit
import Combine

class AViewController: UIViewController {
    private let wrapper = DataTransporter.shared
   
    private var cancellables: Set<AnyCancellable> = []
    
    // Publisher for the timer
    private let dateFormatter = DateFormatter()
    private let timePublisher = Timer.publish(every: 1, on: .main, in: .default)
        .autoconnect()
        .map{ _ in Date() }
    
    @IBOutlet weak var sampleLabel: UILabel!
    @IBOutlet weak var revieverTextView: UITextView!
    @IBOutlet weak var aTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sampleLabel.text = "Watch this! Example of combine updating label"
        revieverTextView.text = loadSomeText()
        
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .long
        
        // Utilizing the textField publisher to do something with the data.
        aTextField
            .textPublisher
            .sink { [weak self] text in
                // This forces an asynchronous behavior for the demonstration
                DispatchQueue.global().asyncAfter(deadline: .now() + 5, execute: {
                    // Now we push this back onto the main thread.
                    DispatchQueue.main.async {
                        // Here we do something with the text. In this instance we're handing it back to the DataTransporter class so the text will appear elsewhere in the application.
                        self?.wrapper.textValue = text
                        // Here, I'm storing it to this view so the user can see that something is being done while I type.
                        self?.revieverTextView.text = text
                    }
                })
            }
            .store(in: &cancellables)
        
        aTextField.text = wrapper.textValue
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // This is the asynchronous example
        timePublisher
            .map { self.dateFormatter.string(from: $0) }
            .sink { [weak self] time in
                self?.sampleLabel.text = time
            }
            .store(in: &cancellables)
    }
    
    private func loadSomeText() -> String {
        let retValue =
        """
I always knew when growing up that I was destined for greatness. My parents had a way of speaking to me that left the inescapable conclusion that a LOT was going to be expected of me.
"""
        return retValue
    }
}


// A publisher for the textField
extension UITextField {
    var textPublisher: AnyPublisher<String, Never> {
        NotificationCenter.default
            .publisher(for: UITextField.textDidChangeNotification, object: self)
            .map { ($0.object as? UITextField)?.text ?? "" }
            .eraseToAnyPublisher()
    }
}
