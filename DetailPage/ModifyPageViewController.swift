//
//  ModifyPageViewController.swift
//  naverBandCopy
//
//  Created by t2023-m0053 on 2023/08/14.
//

import UIKit

class ModifyPageViewController: UIViewController {
    @IBOutlet weak var ModifyTitle: UITextField!
    @IBOutlet weak var ModifyContent: UITextView!
    @IBOutlet weak var doneButton: UIButton!
    
    
    @IBAction func completeButton(_ sender: Any) {
        guard let index = index else {return}

        postList[index].title = ModifyTitle.text ?? ""
        postList[index].content = ModifyContent.text ?? ""
        self.navigationController?.popViewController(animated: true)
    }
    
    var index:Int?
    var titleString:String?
    var contentString:String?
    var writerString:String?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        ModifyTitle.text = titleString
        ModifyContent.text = contentString
        setupButton(doneButton)
        
        ModifyContent.layer.cornerRadius = 10
        ModifyContent.layer.borderWidth = 1
        ModifyContent.layer.borderColor = UIColor.systemGray6.cgColor
        
    }
}
