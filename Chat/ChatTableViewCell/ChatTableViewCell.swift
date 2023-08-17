//
//  ChatTableViewCell.swift
//  naverBandCopy
//
//  Created by t2023-m0078 on 2023/08/14.
//

import UIKit

class ChatTableViewCell: UITableViewCell {

    @IBOutlet weak var chatRoomName: UILabel!
    
    @IBOutlet weak var chatMessage: UILabel!
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
