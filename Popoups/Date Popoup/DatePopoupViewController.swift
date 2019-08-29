//
//  DatePopoupViewController.swift
//  Popoups
//
//  Created by Yury Popov on 29/08/2019.
//  Copyright © 2019 Yury Popov. All rights reserved.
//

import UIKit

class DatePopoupViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var saveButton: UIButton!
    
    var shownTimePicker: Bool = false
    //для calbacka
    var onSave: ((_ data: String) -> ())?
    
    //delegation
    var delegate: PopoupDelegate?
    
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: datePicker.date)
    }
    
    var forrmatedTime: String {
        get {
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            return formatter.string(from: datePicker.date)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if shownTimePicker {
            titleLabel.text = "Selected Time"
            datePicker.datePickerMode = .time
            saveButton.setTitle("Save Time", for: .normal)
        }
        
    }
    
    @IBAction func saveDate(_ sender: UIButton) {
        //передаче через notification
        NotificationCenter.default.post(name: NSNotification.Name.saveDataTime, object: self)
        
        //передача callback
        if shownTimePicker {
            onSave?(forrmatedTime)
            //delegate
            delegate?.popoupValueSelected(value: forrmatedTime)
        } else {
            onSave?(formattedDate)
            delegate?.popoupValueSelected(value: formattedDate)
        }
        
        
        
         dismiss(animated: true)
    }
    
}
