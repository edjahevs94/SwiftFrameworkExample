//
//  ViewModel.swift
//  MyLibraryLearningExample
//
//  Created by EdgardVS on 24/11/22.
//

import Foundation


public class ViewModel: ObservableObject {
    
    @Published var imageData = Data()
    //new version with workspace
    init(photoPath: String, did: String, sid: String) {
        getCredentials()
        getImage()
    }
    
    func getCredentials() {
        Service.shared.login(user: "ODSDEV", password: "FZcMKH23") { response in
            print("login realizado: \(response.success)")
            let did = response.data.did
            let sid = response.data.sid
            UserDefaults.standard.set(did, forKey: "did")
            UserDefaults.standard.set(sid, forKey: "sid")
        }
    }
    
    func getImage() {
        Service.shared.download(path: "/odsappdev" ,imageName: "test2.jpeg") { response , loading  in
            self.imageData = response
            //self.loading = false
        }
            
    }
    
    
    
    
}
