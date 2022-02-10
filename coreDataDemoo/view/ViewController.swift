//
//  ViewController.swift
//  coreDataDemoo
//
//  Created by Visilean Meet on 08/02/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var LBLtitle: UILabel!
    var labelTitle : String = ""
    
    @IBOutlet var EnterEmailTXT: UITextField!
    @IBOutlet var EnterNameTXT: UITextField!
    var idX : UUID? = nil
    
    @IBOutlet var InsertBtn: UIButton!
    var insertBTNdstate : Bool = false
    
    @IBOutlet var UpdateBTn: UIButton!
    var UpdateBTNstate : Bool = false
    
    var NameDataFromUpdate : String = ""
    var EmailDataFromUpdate : String = ""
    
    private let manager: EmployeeManager = EmployeeManager()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        InsertBtn.isHidden = insertBTNdstate
        UpdateBTn.isHidden = UpdateBTNstate
        self.LBLtitle.text = labelTitle
        self.EnterEmailTXT.text = EmailDataFromUpdate
        self.EnterNameTXT.text = NameDataFromUpdate
        
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        debugPrint(path[0])
        
    }
    
    @IBAction func CreateBTNclick(_ sender: Any) {
        let employee = CDEmployee(name: EnterNameTXT!.text, id: UUID(), email: EnterEmailTXT!.text)
        manager.createEmployee(employee: employee)
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func UpdateBTNclick(_ sender: Any) {
        let employee = CDEmployee(name: self.EnterNameTXT.text, id: idX!, email: self.EnterEmailTXT.text)
        
        if(manager.updateEmployee(employee: employee))
        {
            displayAlert(alertMessage: "Record Updated")
        }else
        {
            displayErrorAlert()
        }
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
        let errorAlert = UIAlertController(title: "Alert", message: "please try again later", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "ok", style: .default, handler: nil)
        errorAlert.addAction(okAction)
        self.present(errorAlert, animated: true)
    }
}

