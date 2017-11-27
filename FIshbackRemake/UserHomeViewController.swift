//
//  UserHomeViewController.swift
//  FIshbackRemake
//
//  Created by Shermiah on 11/12/17.
//  Copyright © 2017 FishBackAcct. All rights reserved.
//

// This .swift file will handle all of the users current information such as name, cash balance, and purchased stocks
import UIKit

class UserHomeViewController: UIViewController {
    
    // Make the user label change accoriding to the specific user
    @IBOutlet weak var UserLabel: UILabel!
    
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
