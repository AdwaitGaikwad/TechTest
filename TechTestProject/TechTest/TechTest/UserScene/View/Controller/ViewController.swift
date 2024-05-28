//
//  ViewController.swift
//  TechTest
//
//  Created by Adwait Gaikwad on 28/05/24.
//

import UIKit

class ViewController: UIViewController {
  
    @IBOutlet weak var userListTableView: UITableView!
    
    private var viewModel = PostViewModel()
    fileprivate var PostModelObject : PostModel?
    private var maxArrayCount: Int = 100
    private var page: Int = 1
        //MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.delegate = self
        self.viewModel.getUserListData(url: "https://jsonplaceholder.typicode.com/posts?_page=\(page)&_limit=10")
    }
}


//MARK: - Extension UserList 	
extension ViewController : PostListProtocol {
    func didReceiveUserListResponse(response: (data: PostModel?, isSuccess: Bool?)) {
        print(response)
        if page == 1 {
            self.PostModelObject = response.data
        } else {
            self.PostModelObject?.append(contentsOf: response.data ?? PostModel())
        }
        self.userListTableView.reloadData()
    }
    
}


extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PostModelObject?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath) as? UserTableViewCell
        cell?.postTitleLabel.text = PostModelObject?[indexPath.row].title
        cell?.postDesriptionLabel.text = PostModelObject?[indexPath.row].body
        cell?.postIdLabel.text = "\(PostModelObject?[indexPath.row].id ?? 0)"
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == (PostModelObject?.count ?? 0 ) - 1 && (PostModelObject?.count ?? 0) < maxArrayCount {
            self.page += 1
            self.viewModel.getUserListData(url: "https://jsonplaceholder.typicode.com/posts?_page=\(page)&_limit=10")
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let userDetailsViewController = self.storyboard?.instantiateViewController(withIdentifier: "UserDetailViewController") as? UserDetailViewController else {
            return
        }
        userDetailsViewController.userDetailsElement = PostModelObject?[indexPath.row]
        self.navigationController?.pushViewController(userDetailsViewController, animated: true)
    }
}
