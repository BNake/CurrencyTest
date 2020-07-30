//
//  MainSections.swift
//  Currency
//
//  Created by Nazhmeddin Babakhanov on 29/07/2020.
//  Copyright © 2020 Nazhmeddin Babakhanov. All rights reserved.
//

import Foundation
enum MainSections: Int, CaseCountable {
    
    case atfbankCurrency
    case altynCurrency
    case halkCurrency
    
    var sectionHeader : MainHeaderSectionView {
        return MainHeaderSectionView(type: self)
    }
    
    var title: String {
        switch self {
        case .atfbankCurrency:
            return "АТФ"
        case .altynCurrency:
            return "Алтын-ай"
        case .halkCurrency:
            return "Халык"
        }
    }
    
}
