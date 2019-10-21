//
//  AddViewController.swift
//  TestTask
//
//  Created by admin on 21.10.2019.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class AddViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var addTextFild: UITextField!
    
    let addService = TestService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addTextFild.contentVerticalAlignment = .top
        addTextFild.isUserInteractionEnabled = true
        addTextFild.delegate = self
        

    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == addTextFild {
            addTextFild.resignFirstResponder()
        }
        return true
    }
    

    @IBAction func cancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButton(_ sender: Any) {
        guard let cityName = addTextFild.text, !cityName.isEmpty else {
            return
        }
        
        addService.loadNewSession() { [weak self] newSession in
            // print(newSession.session)
            var sessionId = newSession.session
            print(sessionId)
            self?.addService.loadAddEntry(session: "UPRltygFn8TWCzqA5y")
        }
        self.dismiss(animated: true, completion: nil)
        
    }
 
}
