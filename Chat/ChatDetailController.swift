//
//  ChatRoomDetail.swift
//  naverBandCopy
//
//  Created by t2023-m0078 on 2023/08/14.
//

import UIKit


class ChatDetailController: UIViewController {
    var chatIndex:Int = 0
    
    @IBAction func tabRecog(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBOutlet weak var chatTableView: UITableView!
    
    @IBOutlet weak var inputTextField: UITextField!
    
    @IBAction func inputButton(_ sender:Any) {
        
        if inputTextField.text == "" {
            view.endEditing(true)
        }else{
            chatRoomList[chatIndex].chatList.append(["0",inputTextField.text ?? ""])
            chatTableView.reloadData()

            let index = IndexPath(row: chatRoomList[chatIndex].chatList.count-1, section: 0)
            
            chatTableView.scrollToRow(at: index, at: .bottom, animated: true)
            
            inputTextField.text = ""
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chatTableView.dataSource = self
        chatTableView.register(UINib(nibName: "ChatDetailCell", bundle: nil), forCellReuseIdentifier: "ChatDetailCell")
        chatTableView.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboard), name:UIResponder.keyboardWillShowNotification, object: nil)

        
        DispatchQueue.main.async {
            let index = IndexPath(row: chatRoomList[self.chatIndex].chatList.count-1, section: 0)

            self.chatTableView.scrollToRow(at: index, at: .bottom, animated: false)
            print("맨밑으로 스크롤 애니메이션")
        }
    }
    
    @objc func keyboard(notification: Notification){
        print("\(notification.name)")
        let index = IndexPath(row: chatRoomList[self.chatIndex].chatList.count-1, section: 0)

        self.chatTableView.scrollToRow(at: index, at: .bottom, animated: false)
        print("키보드 내려감")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    
    
    deinit{
        print("deinitial")
    }
}






extension ChatDetailController: UITableViewDelegate{
    
}

extension ChatDetailController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatRoomList[chatIndex].chatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = chatTableView.dequeueReusableCell(withIdentifier: "ChatDetailCell", for: indexPath) as! ChatDetailCell
        cell.chatContent.text = chatRoomList[chatIndex].chatList[indexPath.row][1]
        if chatRoomList[chatIndex].chatList[indexPath.row][0] == "0" {
            cell.chatPerson.text = chatRoomList[chatIndex].me
            cell.chatPerson.textAlignment = .right
            cell.chatContent.textAlignment = .right
        }else{
            cell.chatPerson.text = chatRoomList[chatIndex].you
            cell.chatPerson.textAlignment = .left
            cell.chatContent.textAlignment = .left

            
        }
        
        cell.chatContent.text = chatRoomList[0].chatList[indexPath.row][1]
        
        return cell
        
    }
    

}


extension ChatDetailController: UIScrollViewDelegate{
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        let offSetMatch = chatTableView.contentSize.height - scrollView.frame.size.height
        if position > offSetMatch {
            print("화면 끝 도달")
        }
        
    }
    

}
