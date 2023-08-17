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

var postList:[postContent] = [postContent(title:"건프라는 자유다!",content:"건담덕후를 위한 밴드, 서로의 건프라제작 팁을 알려주는 밴드입니다!!",writer:"의적"),
                              postContent(title:"클래식세상보기",content:"세계 최고의 클래식 음악 영상 제작사 유니텔, 베를린필, 빈필의 국내 소개영상에 대한 해설 등을...",writer:"의적"),
                              postContent(title:"<중밴>중국어영화대사 공부방",content:"중국어 고급반 중국어 최고수들 모임 중국어 자신있는 한국분, 중국분들 모임 중국영화",writer:"의적"),
                              postContent(title:"소리내어책읽기 말더듬극복 스피치",content:"말더듬을 다같이 극복해봅시다",writer:"의적"),
                              postContent(title:"글 쓰는 사람들",content:"우리 밴드는 문학을 좋아하는 사람들의 공간입니다. 시인, 수필가, 시조, 시인, 동시 작가, 소설 등",writer:"의적")
]

var chatRoomList:[chatRoom] = [
    chatRoom(me:"의적",you:"스승님",
             chatList:[
                ["0","안녕하세요"],
                ["1","안녕하신sadsda가"],
                ["0","의적님의 sadsad말"],
                ["1","ㅏㅓㅗ허ㅗ"],
                ["1","ㅁㄴㅇㅁㄴㅇ"],
                ["0","ㅂㅂㅂㅂㅂㅂ"],
                ["0","ㅂㅂㅂㅂㅂㅂ"],
                ["0","ㅂㅂㅂㅂㅂㅂ"],
                ["0","ㅂㅂㅂㅂㅂㅂ"],
                ["0","이글이안보이면한칸위에"],
             ]
            )
]


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
    
    var chatList:[[String]]
    
}
