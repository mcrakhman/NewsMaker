//
//  NetworkRequestConstants.swift
//  GithubItunesViewer
//
//  Created by m.rakhmanov on 21.01.17.
//  Copyright © 2017 m.rakhmanov. All rights reserved.
//

import Foundation

enum NetworkRequestConstants {
    
    enum HeaderName: String {
        case contentType = "Content-Type"
        case accept = "Accept"
    }
    
    enum APIPath: String {
        case main = "https://api.tinkoff.ru/v1/"
    }
    
    enum APIMethodName: String {
        case news = "news"
        case detail = "news_content"
    }
    
    enum HTTPMethod: String {
        case GET
        case POST
    }
}

