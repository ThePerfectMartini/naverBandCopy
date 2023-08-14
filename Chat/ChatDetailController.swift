//
//  ChatRoomDetail.swift
//  naverBandCopy
//
//  Created by t2023-m0078 on 2023/08/14.
//

import UIKit


class ChatDetailController: UIViewController {
    
    var chatIndex:Int = 0
    
    

    
    @IBOutlet weak var chatTableView: UITableView!
    
    @IBOutlet weak var inputTextField: UITextField!
    
    @IBAction func inputButton(_ sender:Any) {
        
        if inputTextField.text == "" {
            
        }else{
            chatRoomList[chatIndex].chatList.append(["0",inputTextField.text ?? ""])
            let index = IndexPath(row: chatRoomList[chatIndex].chatList.count-1, section: 0)
            
            chatTableView.reloadData()
            chatTableView.scrollToRow(at: index, at: .bottom, animated: true)
            inputTextField.text = ""
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chatTableView.dataSource = self
        chatTableView.register(UINib(nibName: "ChatDetailCell", bundle: nil), forCellReuseIdentifier: "ChatDetailCell")
        

        DispatchQueue.main.async {
            let index = IndexPath(row: chatRoomList[self.chatIndex].chatList.count-1, section: 0)

            self.chatTableView.scrollToRow(at: index, at: .bottom, animated: false)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    deinit{
        print("deinitial")
    }
}






extension ChatDetailController: UITableViewDelegate{
    
}

extension ChatDetailController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(IndexPath(row: chatRoomList[chatIndex].chatList.count-1, section: 0),"셀 갯수")
        return chatRoomList[chatIndex].chatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(IndexPath(row: chatRoomList[chatIndex].chatList.count-1, section: 0),"cell생성")
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
