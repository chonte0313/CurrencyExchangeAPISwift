// The Swift Programming Language
// https://docs.swift.org/swift-book
import Combine
import SwiftUI


@available(iOS 13.0.0, *)
public class ExchangeCurrency {
    // Shared URL session instance for making HTTP requests
    var session = URLSession.shared
    
    // This function retrieves a list of available currencies
    // Available from iOS 13.0 onwards
    final public func getCurrencyList() async throws -> [String] {
        // Ensure the URL is valid, otherwise throw an error
        guard let url = URL(string: "https://currencyexchangeapi-cs01.onrender.com/currencyList") else { throw URLError.noURL }
        
        // Fetch data from the URL
        let (data, _) = try await session.data(from: url)
        
        // Decode the JSON response into an array of strings
        let decoder = JSONDecoder()
        return try decoder.decode([String].self, from: data)
    }
    
    // This function retrieves the latest exchange rates for a specified currency
    final public func getLatestExchange(currency: String) async throws -> CurrencyRates {
        // Ensure the URL is valid, otherwise throw an error
        guard let url = URL(string: "https://currencyexchangeapi-cs01.onrender.com/latest/\(currency)") else { throw URLError.noURL }
        
        // Fetch data from the URL
        let (data, _) = try await session.data(from: url)
        
        // Decode the JSON response into a CurrencyRates object
        let decoder = JSONDecoder()
        return try decoder.decode(CurrencyRates.self, from: data)
    }
    
    // This function retrieves the latest exchange rates for a specified currency and amount
    final public func getLatestExchange(currency: String, amount: Float) async throws -> CurrencyRates {
        // Ensure the URL is valid, otherwise throw an error
        guard let url = URL(string: "https://currencyexchangeapi-cs01.onrender.com/latest/\(currency)?amount=\(amount)") else { throw URLError.noURL }
        
        // Fetch data from the URL
        let (data, _) = try await session.data(from: url)
        
        // Decode the JSON response into a CurrencyRates object
        let decoder = JSONDecoder()
        return try decoder.decode(CurrencyRates.self, from: data)
    }
    
    // This function retrieves the latest exchange rates for a specified source and target currency
    final public func getLatestExchange(currency: String, target: String) async throws -> CurrencyRate {
        // Ensure the URL is valid, otherwise throw an error
        guard let url = URL(string: "https://currencyexchangeapi-cs01.onrender.com/latest/\(currency)?target=\(target)") else { throw URLError.noURL }
        
        // Fetch data from the URL
        let (data, _) = try await session.data(from: url)
        
        // Decode the JSON response into a CurrencyRate object
        let decoder = JSONDecoder()
        return try decoder.decode(CurrencyRate.self, from: data)
    }
    
    // This function retrieves the latest exchange rates for a specified source currency, target currency, and amount
    final public func getLatestExchange(currency: String, target: String, amount: Float) async throws -> CurrencyRate {
        // Ensure the URL is valid, otherwise throw an error
        guard let url = URL(string: "https://currencyexchangeapi-cs01.onrender.com/latest/\(currency)?target=\(target)&amount=\(amount)") else { throw URLError.noURL }
        
        // Fetch data from the URL
        let (data, _) = try await session.data(from: url)
        
        // Decode the JSON response into a CurrencyRate object
        let decoder = JSONDecoder()
        return try decoder.decode(CurrencyRate.self, from: data)
    }
}
