//
//  MypageModel.swift
//  naverBandCopy
//
//  Created by t2023-m0048 on 2023/08/15.
//

import Foundation

// TableView 게시글 구조체
struct Post {
    var title: String
    var content: String
}

var posts = [Post(title: "제목 1", content: "dkgkfngkfngkfn"),
             Post(title: "제목 2", content: "fkg아아아nf"),
             Post(title: "제목이다다ㅏ", content: "fkg아아ㅇㅇㅇㅇ아nf")
]

let cellIdentifier = "myPost"
