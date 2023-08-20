//
//  ChatDetailCell.swift
//  naverBandCopy
//
//  Created by t2023-m0078 on 2023/08/14.
//

import UIKit

class ChatDetailCell: UITableViewCell {

    @IBOutlet weak var chatContent: LabelDesign!
    @IBOutlet weak var chatContentRight: LabelDesign!
    
    @IBOutlet weak var chatPerson: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
