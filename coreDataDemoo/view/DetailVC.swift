//
//  DetailVC.swift
//  coreDataDemoo
//
//  Created by Visilean Meet on 08/02/22.
//

import UIKit

class DetailVC: UIViewController {

    private let manager = EmployeeManager()
    var selectedEmployee: CDEmployee? = nil
    @IBOutlet var NameTXT: UITextField!
    @IBOutlet var updateBTN: UIButton!
    @IBOutlet var EmailTXT: UITextField!
    @IBOutlet var deleteBTN: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        run()
        // Do any additional setup after loading the view.
    }
    func run()
        {
            self.NameTXT.text = selectedEmployee?.name
            self.EmailTXT.text = selectedEmployee?.email
          
        }

    private func displayAlert(alertMessage:String)
        {
            let alert = UIAlertController(title: "Alert", message: alertMessage, preferredStyle: .alert)

            let okAction = UIAlertAction(title: "Ok", style: .default) { (action) in
                self.navigationController?.popViewController(animated: true)
            }
            alert.addAction(okAction)
            self.present(alert, animated: true)
        }

        private func displayErrorAlert()
        {
            let errorAlert = UIAlertController(title: "Alert", message: "Something went wrong, please try again later", preferredStyle: .alert)

            let okAction = UIAlertAction(title: "ok", style: .default, handler: nil)
            errorAlert.addAction(okAction)
            self.present(errorAlert, animated: true)
        }
    @IBAction func updateBTNclick(_ sender: Any) {
        
        let employee = CDEmployee(name: self.NameTXT.text, id: selectedEmployee!.id, email: self.EmailTXT.text)

        if(manager.updateEmployee(employee: employee))
        {
           displayAlert(alertMessage: "Record Updated")
        }else
        {
            displayErrorAlert()
        }
    }
    @IBAction func deleteBTNclick(_ sender: Any) {
        if(manager.deleteEmployee(id: selectedEmployee!.id))
               {
                   displayAlert(alertMessage: "Record deleted")
               }
               else
               {
                   displayErrorAlert()
               }
    }
}
