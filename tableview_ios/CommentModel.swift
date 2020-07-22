//
//  CommentModel.swift
//  tableview_ios
//
//  Created by 城田雄亮 on 2020/07/17.
//  Copyright © 2020 城田雄亮. All rights reserved.
//

import Foundation

struct Comment: Codable {
    let postId: Int
    let id: Int
    let name: String
    let email: String
    let body: String
}
