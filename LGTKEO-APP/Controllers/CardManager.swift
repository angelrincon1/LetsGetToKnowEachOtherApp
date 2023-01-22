//
//  CardManager.swift
//  lgd-mk2
//
//  Created by Angel Rincon on 11/3/22.
//

import UIKit

class CardManager: ObservableObject {
    
    
    @Published var imageName: String = "1"
    @Published var lastImage: Bool = false
    
    var imageCount = 1
    
    func rollImage() {
        
        if imageCount < 55 {
            imageCount += 1
        }
        else if imageCount == 55 {
            lastImage = true
            imageCount += 1
        }
        else if imageCount == 56 {
            imageCount += 1
        }
        else {
            imageCount = 1
        }
        
        imageName = "\(imageCount)"
    }
    
    func determinButtonLabel() -> String {
        
        if imageCount == 57 {
            return "Restart"
        }
        else {
            return "Next"
        }
    }
    
    func reset() {
        imageCount = 1
        lastImage = false
        imageName = "\(imageCount)"
    }
    
    func lastImageReset() {
        self.lastImage = false
    }
    
}
