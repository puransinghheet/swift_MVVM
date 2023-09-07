//
//  ViewController.swift
//  MVVMDemo
//
//  Created by Puran on 20/07/23.
//

import UIKit

protocol signinViewControllerDelegatge {
    
    func getInformationBack(from handeledString:String?)
    func getErrorBack(from errorString:String?)
}
class SinginViewController: UIViewController{
    
    @IBOutlet weak var _txtEmail:UITextField!
    @IBOutlet weak var _txtPassword:UITextField!
    
    var viewModel = SigninViewModel()
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.title = "SINGIN"
        viewModel.delegate = self
    }
    @IBAction func didTapOnSigninButton(_ sender:UIButton){
        
        viewModel.sendValues(from: _txtEmail.text, passwordString: _txtPassword.text)
    }
}

extension SinginViewController : signinViewControllerDelegatge{
    
    func getInformationBack(from handeledString:String?){
        
        print("getInformationBack called");
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        if let controller = storyBoard.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController {
            
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
    func getErrorBack(from errorString:String?){
        
        //print("getErrorBack called");
        let alertController = UIAlertController(title: "Alert", message: errorString, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Okay", style: .default))
        self.present(alertController, animated: true)
    }
}

