//
//  SigninViewModel.swift
//  MVVMDemo
//
//  Created by Puran on 20/07/23.
//

import Foundation
protocol signinViewModelDelegatge {
    
    func sendValues(from emailString:String?, passwordString:String?)
}
class SigninViewModel : signinViewModelDelegatge{
    
    var delegate : signinViewControllerDelegatge?
    func sendValues(from emailString: String?, passwordString: String?) {
        
        guard let emailTextFiled = emailString else {return;}
        guard let passwordTextFiled = emailString else {return;}
        if emailTextFiled.length == 0{
            
            delegate?.getErrorBack(from: "Email id is blank")
        }
        else if !emailTextFiled.isValidEmail(){
            
            delegate?.getErrorBack(from: "Email id is not valid")
        }
        else if passwordTextFiled.length == 0{
            
            delegate?.getErrorBack(from: "Password is blank")
        }
        delegate?.getInformationBack(from: "Login successfully with username=\(emailTextFiled) && password=\(passwordTextFiled)")
    }
}

extension String{
    
    func isValidEmail() -> Bool{
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
    public var length:Int{
        
        return self.count
    }
}
