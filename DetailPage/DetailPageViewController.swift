import UIKit

class DetailPageViewController: UIViewController{
    
    

    let backgroundcolor = UIColor(red:255/255.0, green:255/255.0, blue:255/255.0, alpha: 1.0)
    @IBOutlet weak var EditButton: UIButton!
    @IBOutlet weak var DetailTitle: UILabel!
    @IBOutlet weak var Writer: UILabel!
    @IBOutlet weak var DetailContent: UILabel!
    @IBOutlet weak var TextTitle: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        DetailTitle.text = postList[0].title                //데이터
        Writer.text = postList[0].writer
        DetailContent.text = postList[0].content
        TextTitle.text = postList[0].content
        DetailTitle.backgroundColor = backgroundcolor        //뒷배경색
        Writer.backgroundColor = backgroundcolor
        DetailContent.backgroundColor = backgroundcolor
        TextTitle.backgroundColor = backgroundcolor
        DetailTitle.layer.borderColor = UIColor.black.cgColor     //라벨 테두리
        DetailTitle.layer.borderWidth = 1
        Writer.layer.borderColor = UIColor.black.cgColor
        Writer.layer.borderWidth = 1
        DetailContent.layer.borderColor = UIColor.black.cgColor
        DetailContent.layer.borderWidth = 1
        
    }
}

