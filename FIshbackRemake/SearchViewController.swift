//
//  SearchViewController.swift
//  FIshbackRemake
//
//  Created by Shermiah on 11/12/17.
//  Copyright © 2017 FishBackAcct. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UISearchBarDelegate {
    
    // When the user types in the for the name of stock they wish to purchase
    // Then the current stock information will appear
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var StockInformationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        // Do any additional setup after loading the view.
    }
    // function to detect whether the user is typing in the textbox
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        print("\(searchText)")
    }
    
    // function to search for the stock when the user clicks the enter key on the keyboard
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar){
        print("\(String(describing: searchBar.text!))")
        let urlString = "http://ukfl2017g2.optionapps.com/googleRequest.php?symbol=\(searchBar.text!)&type=1"
        guard let requestUrl = URL(string:urlString) else{return}
          let request = URLRequest(url: requestUrl)
        let task = URLSession.shared.dataTask(with: request){
            (data, response, error) in
            if error == nil, let usableData = data{
                let stockinfo = (String(data: usableData, encoding: .utf8)!);
                self.changeLabel(Label: stockinfo)
                print(stockinfo)
                print(String(data: usableData, encoding: .utf8)!);
            }
        }
        task.resume()
        return;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func changeLabel(Label: String){
        DispatchQueue.main.async {
            self.StockInformationLabel.text! = Label
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

}
