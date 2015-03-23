//
//  RecordedAudio.swift
//  PitchPerfect
//
//  Created by Jessie Torres on 3/15/15.
//  Copyright (c) 2015 jessInteractive. All rights reserved.
//

import Foundation

class RecordedAudio: NSObject {
    var filePathUrl: NSURL!
    var title: String!
    
    
    init(filePathUrl: NSURL, title: String ){
        self.filePathUrl = filePathUrl
        self.title = title
    }
    
   
    
    
}
