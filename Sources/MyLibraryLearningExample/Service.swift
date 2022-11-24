//
//  Service.swift
//  MyLibraryLearningExample
//
//  Created by EdgardVS on 24/11/22.
//

import Foundation

public struct Service {
    static let shared = Service()
    
    func downloadImageNative(photoPath:String, did: String, sid: String , completion: @escaping (Data) ->()) {
        
        
        var request = URLRequest(url: URL(string: "https://apidrive.ulima.edu.pe/drive/webapi/entry.cgi?api=SYNO.FileStation.Download&version=2&method=download&path=\(photoPath)&mode=%22open%22")!)
        
        request.addValue("did=\(did); id=\(sid)", forHTTPHeaderField: "Cookie")
        
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                
                return
            }
            completion(data)
            
        }
        
        task.resume()
        
    }
    
}
