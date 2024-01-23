//
//  AViewController.swift
//  DemoFidelity
//
//  Created by Kenneth Cluff on 1/22/24.
//

import UIKit

class AViewController: UIViewController {
    
    let wrapper = DataTransporter.shared
    
    @IBOutlet weak var textView: UITextView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.text = wrapper.textValue
        textView.delegate = self
    }
}


extension AViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        wrapper.textValue = textView.text
    }
}
