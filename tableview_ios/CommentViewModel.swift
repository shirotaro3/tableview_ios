//
//  CommentViewModel.swift
//  tableview_ios
//
//  Created by 城田雄亮 on 2020/07/22.
//  Copyright © 2020 城田雄亮. All rights reserved.
//

import Foundation
import Alamofire

class CommentViewModel {
    func getDatas(urlStr: String, completionClosure: @escaping ([Comment]) -> Void ) {
        AF.request(urlStr, method: .get)
        .validate(statusCode: 200..<300)
        .validate(contentType: ["application/json"])
        .responseJSON { response in
            switch response.result {
            case .success:
                guard let datas = response.data else { return }
                let comments = try! JSONDecoder().decode([Comment].self, from: datas)
                completionClosure(comments)
            case let .failure(error):
                print(error)
            }
        }
    }
}
