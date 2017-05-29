//
//  NewsDetailServiceConfiguration.swift
//  NewsMaker
//
//  Created by m.rakhmanov on 29.05.17.
//  Copyright © 2017 HeadHunterLLC. All rights reserved.
//

import Foundation

struct NewsDetailServiceConfiguration {
    let identifier: String
}

extension NewsDetailServiceConfiguration: URLParametersTransformable, URLFactoryConfiguration {
    func toDictionary() -> [String : String] {
        return ["id": identifier]
    }
}
