//
//  Service.swift
//  MyLibraryLearningExample
//
//  Created by EdgardVS on 24/11/22.
//

import Foundation
import Alamofire

public struct Service {
    static let shared = Service()
    
    func login(domainPath: String, user: String, password: String, completion: @escaping (LoginResponse) ->()) {
        
        let fullUrl = "\(domainPath)/webapi/auth.cgi?api=SYNO.API.Auth&version=3&method=login&account=\(user)&passwd=\(password)&session=FileStation&format=cookie"
        
        AF.request(fullUrl, method: .get).responseDecodable(of: LoginResponse.self) { response in
            if let data = response.value {
                completion(data)
            }
        }
    }
            
    func download(path: String, domainPath: String, completion: @escaping (Data, Bool) ->()) {
        
        let fullUrl = "\(domainPath)/webapi/entry.cgi?api=SYNO.FileStation.Download&version=2&method=download&path=\(path)&mode=%22open%22"
        
        AF.download(fullUrl,method: .get , headers: nil).responseData { response in
            if let data = response.value {
                completion(data, false)
            }
        }
    }
       
    
}
