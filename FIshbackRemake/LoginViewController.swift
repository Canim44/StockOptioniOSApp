//
//  LoginViewController.swift
//  FIshbackRemake
//
//  Created by Shermiah on 11/6/17.
//  Copyright © 2017 FishBackAcct. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userEmailText: UITextField!
    @IBOutlet weak var userPasswordText: UITextField!
    @IBOutlet weak var userNameText: UITextField!
    
    // If the user tapped the login button check for several things
    @IBAction func loginButtonTapped(_ sender: Any) {
        // assign all the values
        let email = userEmailText.text;
        let password = userPasswordText.text;
        let username = userNameText.text;
        print("login button tapped")
        // if any of the text fields are empty then send an error
        if((email?.isEmpty)!||(password?.isEmpty)!||(username?.isEmpty)!){
            //display error message
            let alertController = UIAlertController(title:"Login Error", message: "You must enter your login all of your information!", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:nil))
            self.present(alertController, animated: true, completion:nil)
            
            return;
        }
        //check to see if the user exist
        else{
           
            //make request to database through link
            // check to see if the user exist
            // if the user exist then log them in with their account info
            //if they dont exist them prompt user with an error
            let urlString = "http://ukfl2017g2.optionapps.com/login.php?user=\(String(describing: username!))&pass=\(String(describing: password!))&loginkey=&remember"
            guard let requestUrl = URL(string:urlString) else{return}
            let request = URLRequest(url: requestUrl)
            let task = URLSession.shared.dataTask(with: request){
                (data, response, error) in
                if error == nil, let usableData = data{
                    let errormessage = (String(data: usableData, encoding: .utf8)!);
                   // print(String(data: usableData, encoding: .utf8)!);
                    // If the user enters incorrect information then the send them back to the login page
                    if(errormessage == "Error: Username password combination failed")
                    {
                        print("Error: Username password combination failed")
                        print("It works, just segue back")

                    }
                    // the user has entered correct information and push them into the application
                    else{
                        print("You are now logged in! \(String(describing: username!))")
                    }
                }
            }
            task.resume()
            return;
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


