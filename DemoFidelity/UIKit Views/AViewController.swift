//
//  AViewController.swift
//  DemoFidelity
//
//  Created by Kenneth Cluff on 1/22/24.
//

import UIKit

class AViewController: UIViewController {
    
    let wrapper = DataTransporter.shared
    
    /// I use a UITextView since it can grow in size to enclose the text once it's in read-only mode.
    /// In the mean time, it is scrollable as text is entered.
    @IBOutlet weak var textView: UITextView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set the value
        textView.text = wrapper.textValue
        // Set the delegate
        textView.delegate = self
    }
    
    /// NOTE: If the view doesn't get dismissed, then code to set the value of the text view can be put in
    /// the viewWillAppear method of the view controller.
}


extension AViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        wrapper.textValue = textView.text
    }
}
