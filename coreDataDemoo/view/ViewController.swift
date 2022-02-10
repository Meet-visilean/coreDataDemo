//
//  ViewController.swift
//  coreDataDemoo
//
//  Created by Visilean Meet on 08/02/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var EnterEmailTXT: UITextField!
    @IBOutlet var EnterNameTXT: UITextField!
    private let manager: EmployeeManager = EmployeeManager()
    override func viewDidLoad() {
        super.viewDidLoad()
       let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
                debugPrint(path[0])
        // Do any additional setup after loading the view.
    }

    @IBAction func CreateBTNclick(_ sender: Any) {
        let employee = CDEmployee(name: EnterNameTXT!.text, id: UUID(), email: EnterEmailTXT!.text)

                manager.createEmployee(employee: employee)
                self.performSegue(withIdentifier:"createEmp", sender: nil)
    }
    
}

