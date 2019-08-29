//
//  SecondViewController.swift
//  Popoups
//
//  Created by Yury Popov on 29/08/2019.
//  Copyright © 2019 Yury Popov. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var dateLabel: UILabel!
    var observer: NSObjectProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        NotificationCenter.default.addObserver(forName: .saveDataTime, object: nil, queue: .main) { (notification) in
//            let dateVC = notification.object as! DatePopoupViewController
//            self.dateLabel.text = dateVC.formattedDate
//        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //old way   1
        //        NotificationCenter.default.addObserver(self, selector: #selector(handlePopoupClosing), name: .saveDataTime, object: nil)
        
        //new way
        observer = NotificationCenter.default.addObserver(forName: .saveDataTime, object: nil, queue: .main) { (notification) in
            let dateVC = notification.object as! DatePopoupViewController
            self.dateLabel.text = dateVC.formattedDate
        }
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        if let observer = observer {
            NotificationCenter.default.removeObserver(observer)
        }
    }


}

