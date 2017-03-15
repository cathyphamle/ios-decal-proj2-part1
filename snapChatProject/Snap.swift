//
//  Snap.swift
//  snapChatProject
//
//  Created by Cathy Pham Le on 3/14/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class Snap {

    var name: String = ""
    var seen = false
    var snapImage: UIImage
    var time : NSDate?
    
    init(img: UIImage, user: String) {
        self.name = user
        self.seen = false
        self.snapImage = img
    }
    
    func start() {
        if seen == false {
            time = NSDate()
        }
    }
    
    var interval : TimeInterval {
        if let time = self.time {
            return -time.timeIntervalSinceNow/60
        }
        return 0
    }

}
