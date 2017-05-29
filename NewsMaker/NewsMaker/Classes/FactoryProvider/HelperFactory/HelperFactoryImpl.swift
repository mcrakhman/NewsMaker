//
//  HelperFactoryImpl.swift
//  NewsMaker
//
//  Created by m.rakhmanov on 26.05.17.
//  Copyright © 2017 HeadHunterLLC. All rights reserved.
//

import Foundation

class HelperFactoryImpl: BaseFactory, HelperFactory {

    func tableViewHeightCalculator() -> TableViewHeightCalculator {
        return TableViewHeightCalculatorImpl()
    }

    func dateFormatter() -> DateFormatter {
        let dateFormatter = DateFormatter()
        let locale = Locale(identifier: "ru_RU")
        let dateFormat = "HH:mm (d MMMM)"
        let timeZone = TimeZone(abbreviation: "GMT+3")
        dateFormatter.timeZone = timeZone
        dateFormatter.locale = locale
        dateFormatter.dateFormat = dateFormat

        return dateFormatter
    }
}
