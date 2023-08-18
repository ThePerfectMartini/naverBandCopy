//
//  ModifyPageViewController.swift
//  naverBandCopy
//
//  Created by t2023-m0053 on 2023/08/14.
//

import UIKit

class ModifyPageViewController: UIViewController {
    let backgroundcolor = UIColor(red:255/255.0, green:255/255.0, blue:255/255.0, alpha: 1.0)
    @IBOutlet weak var ModifyTitle: UITextField!
    @IBOutlet weak var ModifyContent: UITextField!
    
    var titleString:String?
    var contentString:String?
    var writerString:String?

    
    override func viewDidLoad() {
        super.viewDidLoad()

        ModifyTitle.text = titleString
        ModifyContent.text = contentString
        ModifyTitle.backgroundColor = backgroundcolor
        ModifyContent.backgroundColor = backgroundcolor
    }
}
