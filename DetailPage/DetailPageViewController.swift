import UIKit

class DetailPageViewController: UIViewController{
    
    
    var index:Int?
    var titleString:String?
    var contentString:String?
    var writerString:String?
    

    @IBAction func editButtonClick(_ sender: Any) {
        performSegue(withIdentifier: "toEdit", sender: index)
        
    }
    let backgroundcolor = UIColor(red:255/255.0, green:255/255.0, blue:255/255.0, alpha: 1.0)
    @IBOutlet var allView: UIView!
    @IBOutlet weak var EditButton: UIButton!
    @IBOutlet weak var DetailTitle: UILabel!
    @IBOutlet weak var Writer: UILabel!
    @IBOutlet weak var DetailContent: UILabel!
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var writerView: UIView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var contentImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let index = index else {return}

        DetailTitle.text = postList[index].title           //데이터
        Writer.text = postList[index].writer
        DetailContent.text = postList[index].content
         
        
        setupButton(EditButton)
        setupView(titleView)
        setupView(writerView)
        setupView(contentView)
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.systemGray6.cgColor
        
       // designConfig()
        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        guard let index = index else {return}

        DetailTitle.text = postList[index].title
        Writer.text = postList[index].writer
        DetailContent.text = postList[index].content
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toEdit" {
            guard let vc = segue.destination as? ModifyPageViewController,
                  let index = sender as? Int else {return}
            vc.titleString = postList[index].title
            vc.contentString = postList[index].content
            vc.writerString = postList[index].writer
            vc.index = index
        }
    }
    
    
    
    //private func designConfig(){
//        DetailTitle.backgroundColor = backgroundcolor        //뒷배경색
//        Writer.backgroundColor = backgroundcolor
//        DetailContent.backgroundColor = backgroundcolor
//        TextTitle.backgroundColor = backgroundcolor
        
        
        
//        DetailTitle.layer.borderColor = UIColor.black.cgColor     //라벨 테두리
//        DetailTitle.layer.borderWidth = 1
//        Writer.layer.borderColor = UIColor.black.cgColor
//        Writer.layer.borderWidth = 1
//        DetailContent.layer.borderColor = UIColor.black.cgColor
//        DetailContent.layer.borderWidth = 1

    
    
}


