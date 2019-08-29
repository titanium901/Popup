//
//  SelectTimeViewController.swift
//  Popoups
//
//  Created by Yury Popov on 29/08/2019.
//  Copyright © 2019 Yury Popov. All rights reserved.
//

import UIKit

class SelectTimeViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func selectTime(_ sender: UIButton) {
        let sb = UIStoryboard(name: "DatePopoupViewController", bundle: nil)
        let popoup = sb.instantiateInitialViewController()! as! DatePopoupViewController
        popoup.shownTimePicker = true
        //delegate
        popoup.delegate = self 
        present(popoup, animated: true)
    }
    
}

extension SelectTimeViewController: PopoupDelegate {
    func popoupValueSelected(value: String) {
        timeLabel.text = value
    }
    
    
}
