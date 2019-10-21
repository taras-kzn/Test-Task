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
    
    var newSesionID = [Users]() {
    
        didSet{
           tableView.reloadData()
        } willSet {
            tableView.reloadData()
        }
    }
    
  
    
    ///
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        
//        testServise.loadNewSession() { [weak self] newSession in
//            // print(newSession.session)
//            var sessionId = newSession.session
//            print(sessionId)
//            self?.testServise.loadAddEntry(session: sessionId)
//            self?.tableView.reloadData()
//        }
    
        testServise.loadGetEntries(sessionID: "UPRltygFn8TWCzqA5y") { [weak self] array in
            print(array.count)
            var users = array
            self?.newSesionID = users
            self?.tableView.reloadData()
        }
    }
    
    @objc func addTapped() {
        let VC1 = self.storyboard!.instantiateViewController(withIdentifier: "AddViewController") as! AddViewController
        let navController = UINavigationController(rootViewController: VC1)
        self.present(navController, animated:true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "backController":
            guard let destination = segue.destination as? AddViewController else {return}
          //  destination.gameDelegate = self
            
        default:
            break
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newSesionID.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath) as! TestTableViewCell
        let array = newSesionID[indexPath.row]
        cell.userLabel.text = array.id
        return cell
    }
    
    
}

