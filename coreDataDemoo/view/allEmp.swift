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

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
          
           self.title = "Employees List"
           employees = manager.fetchEmployee()
        self.tableview.reloadData()
           if(employees != nil && employees?.count != 0)
           {
               self.tableview.reloadData()
           }
       }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

            if(segue.identifier == "update")
            {
                let detailsView = segue.destination as? DetailVC
                guard detailsView != nil else { return }
                detailsView?.selectedEmployee = self.employees![self.tableview.indexPathForSelectedRow!.row]
            }
         }

}
extension allEmp : UITableViewDelegate, UITableViewDataSource
{

    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.employees!.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        30
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "tablecell") as! tablecell
        let employee = self.employees![indexPath.row]
       
        cell.UsernameLBL.text = employee.name

        return cell
    }
}
