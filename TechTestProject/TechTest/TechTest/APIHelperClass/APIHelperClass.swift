//
//  APIHelperClass.swift
//  TechTest
//
//  Created by Adwait Gaikwad on 28/05/24.
//

import Foundation
import Alamofire
import UIKit


class ApiHelper {
    static let shared = ApiHelper()
    // Private initializer to prevent instantiation from outside
    private init() {}

    func requestGet<T: Decodable>(_ strURL: String,
                                        parameters: Parameters?,
                                        expecting: T.Type,
                                        success:@escaping (T?) -> Void,
                                        failure:@escaping (String) -> Void) {
        
        AF.request(strURL, method: .get, parameters: parameters, encoding: JSONEncoding.default, headers: nil, interceptor: nil).responseDecodable(of: T.self) { response in
            
            if response.response?.statusCode == 200 {
                print(response)
            
                do {
                    let decodedResponse = try response.result.get()
                    success(decodedResponse)
                } catch {
                    failure(error.localizedDescription)
                }                
            } else {
                failure(response.error?.localizedDescription ?? "Something went wrong")
            }
        }
    }
}
    
