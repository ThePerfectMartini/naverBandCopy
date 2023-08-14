//
//  Data.swift
//  naverBandCopy
//
//  Created by t2023-m0078 on 2023/08/14.
//

import Foundation


var profileList:[String:profile] = [
    "의적":profile(name:"홍길동",introduce:"나는 의적이오~"),
    "스승님":profile(name:"백운도사",introduce:"홍길동 스승이올시다")
]

var postList:[postContent] = [postContent(title:"제목",content:"내용",writer:"의적")]

var chatRoomList:[chatRoom] = [chatRoom(me:"의적",you:"스승님",chatList:[:])]


struct postContent {
    var title:String
    var content:String
    
    var writer:String
}

struct profile {
    var name:String
    var introduce:String
}


struct chatRoom {
    var me:String
    var you:String
    
    var chatList:[Bool:String] = [:]
    
}
