//
//  ViewModel.swift
//  MyLibraryLearningExample
//
//  Created by EdgardVS on 24/11/22.
//

import Foundation

public class ViewModel: ObservableObject {
    
    @Published var imageData = Data()
    
    init(photoPath: String, did: String, sid: String) {
        getImageNative(photoPath: photoPath, did: did, sid: sid)
    }
    
    func getImageNative(photoPath: String, did: String, sid: String) {
        Service.shared.downloadImageNative(photoPath: photoPath, did: did, sid: sid) { response in
            DispatchQueue.main.async {
                self.imageData = response
            }
           
        }
    }
    
    
}
