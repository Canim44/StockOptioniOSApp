//
//  RegistartionViewController.swift
//  FIshbackRemake
//
//  Created by Shermiah on 11/6/17.
//  Copyright © 2017 FishBackAcct. All rights reserved.
//

import UIKit

class RegistartionViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var reenterPasswordTextField: UITextField!
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        let email = emailTextField.text;
        let username = userNameTextField.text;
        let password = passwordTextField.text;
        let reenterpassword = reenterPasswordTextField.text;
        
        // check to see if they are empty
        if((email?.isEmpty)!||(username?.isEmpty)!||(password?.isEmpty)!||(reenterpassword?.isEmpty)!){
            //alert if any are empty
            let alertController = UIAlertController(title: "Registration Error", message: "All fields must be have values in order for regisration to occur properly!", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title:"OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alertController, animated: true, completion: nil)
            return;
            
        }
        // check to see if the passwords match
        if(password != reenterpassword){
            let notMatching = UIAlertController(title:"Registration Error", message:"Your passwords must match!", preferredStyle: UIAlertControllerStyle.alert)
            notMatching.addAction(UIAlertAction(title:"OK", style:UIAlertActionStyle.default, handler: nil))
            self.present(notMatching, animated: true, completion: nil)
            return;
        }
        //create new user
        else{
            let urlString = "http://ukfl2017g2.optionapps.com/register.php?user=\(String(describing: username!))&pass=\(String(describing: password!))&email=\(String(describing: email!))"
            guard let requestUrl = URL(string:urlString) else{return}
            let request = URLRequest(url: requestUrl)
            let task = URLSession.shared.dataTask(with: request){
                (data, response, error) in
                if error == nil, let usableData = data{
                    let errormessage = (String(data: usableData, encoding: .utf8));
                    if (errormessage == "User exists"){
                        print("User registartion failed")
                       // self.createalert(title: "Registration Error", message: "User Already Exist")
                    }
                    else{
                        print("User registered successful")
                        
                        
                    }
                }
            }
            task.resume()
            return
        }
    }
    
    func createalert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle:UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action) in alert.dismiss(animated: true, completion: nil)
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
