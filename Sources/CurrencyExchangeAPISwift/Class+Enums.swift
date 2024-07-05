//
//  File.swift
//  
//
//  Created by Jung Tae Cha on 7/5/24.
//

import Foundation

// This class represents the currency rates and conforms to the Decodable protocol
public class CurrencyRates: Decodable {
    // The amount of the base currency
    var amount: Float
    
    // The timestamp when the rates were last updated
    var updated_at: String
    
    // A list of currency exchange rates
    var rates: [CurrencyExchangeRate]
}

// This class represents a single currency rate and conforms to the Decodable protocol
public class CurrencyRate: Decodable {
    // The amount of the base currency
    var amount: Float
    
    // The timestamp when the rate was last updated
    var updated_at: String
    
    // The exchange rate details
    var rate: CurrencyExchangeRate
}

// This class represents the details of a currency exchange rate and conforms to the Decodable protocol
public class CurrencyExchangeRate: Decodable {
    // The target currency code
    var target: String
    
    // The amount of the target currency
    var amount: Float
    
    // An optional error message
    var error: String?
    
    // Coding keys to map the JSON keys to the properties
    enum CodingKeys: CodingKey {
        case target
        case amount
        case error
    }
    
    // Initializer to decode JSON data into the properties
    required public init(from decoder: any Decoder) throws {
        // Create a container using the coding keys
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // Decode the target currency code
        self.target = try container.decode(String.self, forKey: .target)
        
        // Decode the amount of the target currency
        self.amount = try container.decode(Float.self, forKey: .amount)
        
        // Decode the optional error message, if present
        self.error = try container.decodeIfPresent(String.self, forKey: .error)
    }
}

// This enumeration represents a URL error
public enum URLError: Error {
    // Error case for when the URL is invalid or not provided
    case noURL
}


