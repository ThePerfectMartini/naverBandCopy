import UIKit

class ChatViewController: UIViewController {

    // outlets
    @IBOutlet weak var chatTableView: UITableView!
    
    @IBOutlet weak var chatInput: UITextField!

    @IBAction func chatButton(_ sender: Any) {
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        chatTableView.register(UINib(nibName: "ChatTableViewCell", bundle: nil), forCellReuseIdentifier: "chatTableViewCell")
        chatTableView.dataSource = self
        chatTableView.delegate = self
        
        
    }

    override func viewWillAppear(_ animated: Bool) {
        chatTableView.reloadData()
    }

}

extension ChatViewController: UITableViewDelegate {
    
}

extension ChatViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatRoomList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = chatTableView.dequeueReusableCell(withIdentifier: "chatTableViewCell", for: indexPath) as! ChatTableViewCell
        cell.chatRoomName.text = chatRoomList[indexPath.row].you
        cell.chatMessage.text = chatRoomList[indexPath.row].chatList.last?[1]
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetail", sender: nil)
    }
}
