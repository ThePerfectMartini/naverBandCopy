//
//  TableViewCell.swift
//  naverBandCopy
//
//  Created by t2023-m0048 on 2023/08/15.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var postView: UIView!
    @IBOutlet weak var postTitle: UILabel!
    @IBOutlet weak var postContent: UILabel!
    
    let cellIdentifier = "myPost"
    
    // viewDidLoad랑 비슷한 메소드, xib파일에서 셀이 만들때 호출됨
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
