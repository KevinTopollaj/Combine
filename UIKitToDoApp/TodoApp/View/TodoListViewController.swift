//
//  ViewController.swift
//  TodoApp
//
//  Created by Karin Prater on 04.02.21.
//

import UIKit
import Combine

class TodoListViewController: UIViewController {

    // use viewmodel to populate table
    
    @IBOutlet weak var tableView: UITableView!
    
    var subscriptions = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
        // add data stream that calls tableView.reloadData() when data changes
        self.tableView.reloadData()
        
       
    }

    @IBSegueAction func addNewViewIsGoingToAppear(_ coder: NSCoder) -> AddNewViewController? {
        let controller = AddNewViewController(coder: coder)
        // hande over viewmodel to controller
        return controller
    }
    
}

extension TodoListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        cell.textLabel?.text = "mock"
        return cell
    }
    
    
}
