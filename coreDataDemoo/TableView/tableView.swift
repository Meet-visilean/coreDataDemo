//
//  tableView.swift
//  coreDataDemoo
//
//  Created by Visilean Meet on 09/02/22.
//

import Foundation
import UIKit

private let manager = EmployeeManager()
extension allEmp : UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.employees!.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "delete") {( action,sourceView,compilationHandler )in
            
            let alert = UIAlertController(title: "Delete", message: "Are You Sure to Delete Permently?", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Yes", style: .default) { (action) in
                let employee = self.employees![indexPath.row]
                manager.deleteEmployee(id: employee.id)
                self.employees = manager.fetchEmployee()
                tableView.deleteRows(at: [indexPath], with: .left)
                tableView.reloadData()
            }
            let NoAction = UIAlertAction(title: "No", style: .default) { (action) in
                self.dismiss(animated: true, completion: nil)
            }
            alert.addAction(okAction)
            alert.addAction(NoAction)
            self.present(alert, animated: true)
            
            
            compilationHandler(true)
            
        }
        
        let UpdateAction = UIContextualAction(style: .normal, title: "Update") {( action,sourceView,compilationHandler )in
            
            let next = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
            
            let employee = self.employees![indexPath.row]
            next.idX = employee.id
            next.NameDataFromUpdate = employee.name!
            next.EmailDataFromUpdate = employee.email!
            next.labelTitle = "Update"
            next.UpdateBTNstate = false
            next.insertBTNdstate = true
            self.navigationController?.pushViewController(next, animated: true)
            compilationHandler(true)
            
        }
        let swipeConfig = UISwipeActionsConfiguration(actions: [deleteAction,UpdateAction])
        return swipeConfig
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tablecell") as! tablecell
        let employee = self.employees![indexPath.row]
        cell.selectionStyle = .none
        cell.UsernameLBL.text = employee.name
        cell.emailLBL.text = employee.email
        
        return cell
    }
    
    
}

