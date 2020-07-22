//
//  ViewController.swift
//  tableview_ios
//
//  Created by 城田雄亮 on 2020/07/14.
//  Copyright © 2020 城田雄亮. All rights reserved.
///imgres

import UIKit
import SnapKit

class ViewController: UIViewController, UITableViewDataSource {
    
    private let commentViewModel = CommentViewModel()
    private let tableView = UITableView()
    private let url: String = "https://jsonplaceholder.typicode.com/comments"
    fileprivate var comments: [Comment] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        title = "Comments"
        tableView.dataSource = self
        tableView.estimatedRowHeight = 50
        tableView.rowHeight = UITableView.automaticDimension
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) -> Void in
            make.size.equalTo(view)
        }
        
        // コメントを取得
        commentViewModel.getDatas(urlStr: url, completionClosure: { comments in
            self.comments = comments
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        let comment = comments[indexPath.row]
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = "PostId: \(comment.postId)\nId: \(comment.id)\nName: \(comment.name)\nEmail: \(comment.email)"
        cell.detailTextLabel?.numberOfLines = 0
        cell.detailTextLabel?.text = "Body: \(comment.body)"
        cell.detailTextLabel?.textColor = UIColor.darkGray
        return cell
    }
    
}

