//
//  allEmp.swift
//  coreDataDemoo
//
//  Created by Visilean Meet on 08/02/22.
//

import UIKit

class allEmp: UIViewController {
    
    
    @IBOutlet var tableview: UITableView!
    private let manager = EmployeeManager()
    var employees : [CDEmployee]? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        
        employees = manager.fetchEmployee()
        
        tableview.reloadData()
        
    }
    
    @IBAction func AddBTNclick(_ sender: Any) {
        
        let next = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        next.labelTitle = "Insert"
        next.UpdateBTNstate = true
        next.insertBTNdstate = false
        self.navigationController?.pushViewController(next, animated: true)
        
    }
    
}

