//
//  CallBackViewController.swift
//  Popoups
//
//  Created by Yury Popov on 29/08/2019.
//  Copyright © 2019 Yury Popov. All rights reserved.
//

import UIKit

class CallBackViewController: UIViewController {
    @IBOutlet weak var dateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDatePopoupViewControllerSeque" {
            let popupVC = segue.destination as! DatePopoupViewController
            popupVC.shownTimePicker = false
            //1 вариант assign to func
//            popupVC.onSave = onSave
            //2 вариант use a closure
            popupVC.onSave = { (data) in
                self.dateLabel.text = data
            }
        }
        
    }
    
    //1 вариант assign to func
    func onSave(_ data: String) -> () {
        dateLabel.text = data
    }


}
