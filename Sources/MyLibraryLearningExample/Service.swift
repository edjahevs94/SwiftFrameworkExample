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
    
    func login(user: String, password: String, completion: @escaping (LoginResponse) ->()) {
        
        let fullUrl = "https://apidrive.ulima.edu.pe/drive/webapi/auth.cgi?api=SYNO.API.Auth&version=3&method=login&account=\(user)&passwd=\(password)&session=FileStation&format=cookie"
        
        AF.request(fullUrl, method: .get).responseDecodable(of: LoginResponse.self) { response in
            if let data = response.value {
                completion(data)
            }
        }
    }
    
    //func downloadImageNative(photoPath:String, did: String, sid: String , completion: @escaping (Data) ->()) {
        
    func download(path: String, imageName: String, completion: @escaping (Data, Bool) ->()) {
        
        let sid = UserDefaults.standard.string(forKey: "sid")
        let did = UserDefaults.standard.string(forKey: "did")
        
        //print("sid defaults: \(sid!)")
        //print("did defaults: \(did!)")
        
        let fullUrl = "https://apidrive.ulima.edu.pe/drive/webapi/entry.cgi?api=SYNO.FileStation.Download&version=2&method=download&path=\(path)/\(imageName)&mode=%22open%22"
        
        let headers: HTTPHeaders = [
            "Cookie": "did=\(did!); id=\(sid!)"
        ]
        
        AF.download(fullUrl,method: .get , headers: headers).downloadProgress { progress in
            print("Download progress: \(progress.fractionCompleted)")
        }.responseData { response in
            if let data = response.value {
                completion(data, false)
            }
        }
    }
       
    
}
