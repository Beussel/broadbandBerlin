//
//  Result.swift
//  Belegarbeit
//
//  Created by Ali on 30.05.18.
//  Copyright © 2018 Ali. All rights reserved.
//

import Foundation

struct Result: Codable{
    var index: [Item]
}

struct Item: Codable, Hashable {
    var bzrname: String
    var plrname: String
    var ein_mbit: String
    var zwei_mbit: String
    var sechs_mbit: String
    var sechzehn_mbit: String
    var dreißig_mbit: String
    var fünfzig_mbit: String
    var hundert_mbit: String
    
    enum CodingKeys: String, CodingKey{
        case bzrname
        case plrname
        case ein_mbit = "1_mbit"
        case zwei_mbit = "2_mbit"
        case sechs_mbit = "6_mbit"
        case sechzehn_mbit = "16_mbit"
        case dreißig_mbit = "30_mbit"
        case fünfzig_mbit = "50_mbit"
        case hundert_mbit = "100_mbit"
    }
}
