//
//  UserViewModel.swift
//  TechTest
//
//  Created by Adwait Gaikwad on 28/05/24.
//

import Foundation

protocol PostListProtocol {
    func didReceiveUserListResponse(response: (data: PostModel?, isSuccess: Bool?))
}



struct PostViewModel {
    
    var delegate: PostListProtocol?
    func getUserListData(url:String) {
        
        ApiHelper.shared.requestGet(url, parameters: nil, expecting: PostModel.self) { successResponse in
            self.delegate?.didReceiveUserListResponse(response: (data: successResponse, isSuccess: true))
        } failure: { errorString in
            self.delegate?.didReceiveUserListResponse(response: (data: nil, isSuccess: false))
        }

    }
}

