//
//  MainSections.swift
//  Currency
//
//  Created by Nazhmeddin Babakhanov on 29/07/2020.
//  Copyright © 2020 Nazhmeddin Babakhanov. All rights reserved.
//

import Foundation
import XLPagerTabStrip

enum MainSections: Int, CaseCountable {
    
    case atfbankCurrency
    case altynCurrency
    case halkCurrency
    
    var sectionHeader : MainHeaderSectionView {
        return MainHeaderSectionView(type: self)
    }
    
    var title: IndicatorInfo {
        switch self {
        case .atfbankCurrency:
            return IndicatorInfo(title: "АТФ")
        case .altynCurrency:
            return IndicatorInfo(title: "Алтын-ай")
        case .halkCurrency:
            return IndicatorInfo(title: "Халык")
        }
    }
    
}
