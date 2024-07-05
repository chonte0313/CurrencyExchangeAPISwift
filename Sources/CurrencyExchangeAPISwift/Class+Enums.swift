//
//  File.swift
//  
//
//  Created by Jung Tae Cha on 7/5/24.
//

import Foundation

public class CurrencyRates : Decodable{
    var amount: Float
    var updated_at : String
    var rates : [CurrencyExchangeRate]
    
}

public class CurrencyRate : Decodable{
    var amount: Float
    var updated_at : String
    var rate : CurrencyExchangeRate
}


public class CurrencyExchangeRate: Decodable{
    var target: String
    var amount: Float
    var error: String?
    
    enum CodingKeys: CodingKey {
        case target
        case amount
        case error
    }
    
    required public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.target = try container.decode(String.self, forKey: .target)
        self.amount = try container.decode(Float.self, forKey: .amount)
        self.error = try container.decodeIfPresent(String.self, forKey: .error)
    }
}


public enum URLError: Error {
    case noURL
}
