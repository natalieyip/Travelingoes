//
//  TranslationViewController.swift
//  TextCapture
//
//  Created by Natalie Yip on 5/3/17.
//  Copyright © 2017 Findo Inc. All rights reserved.
//

import UIKit

class TranslationViewController: UIViewController {
    
    @IBOutlet weak var Label: UILabel!
    
    var LabelText = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Label.text = LabelText
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
