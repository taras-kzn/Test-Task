//
//  ViewController.swift
//  TestTask
//
//  Created by admin on 19.10.2019.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let testServise = TestService()
    
    var newSesionID = [Users]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
//        testServise.loadNewSession() { [weak self] newSession in
//           // print(newSession.session)
//            var sessionId = newSession.session
//            print(sessionId)
//            self?.testServise.loadAddEntry(session: sessionId)
//            self?.tableView.reloadData()
//            }
//        }
        testServise.loadGetEntries(sessionID: "UPRltygFn8TWCzqA5y")
    
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newSesionID.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath) as! TestTableViewCell
        let body = newSesionID[indexPath.row]
        cell.userLabel.text = body.body
        return cell
    }
    
    
}

