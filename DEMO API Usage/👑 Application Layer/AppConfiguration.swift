//
//  AppConfiguration.swift
//  DEMO API Usage
//
//  Created by Johnnie Walker on 12.08.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import Foundation

enum AppConfiguration {
    
    static var databaseContainerName: String {
        let name = "DEMO API Usage"
        return name
    }
    
    static var serverUrl: String {
        let url = ""
        if url.isEmpty {
            fatalError("set your server url in AppConfiguration")
        }
        return url
    }
    
    static var serverApi: String {
        let url = AppConfiguration.serverUrl + "/api"
        return url
    }
    
}
