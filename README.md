# ExchangeCurrency

[![SwiftUI 2.0](https://img.shields.io/badge/SwiftUI-2.0-orange)](https://developer.apple.com/xcode/swiftui/)
[![iOS](https://img.shields.io/badge/iOS-14.0-blue)](https://developer.apple.com/ios/)
[![MIT License](https://img.shields.io/badge/license-MIT-green)](LICENSE)

The `ExchangeCurrency` class provides a set of functions to interact with a Currency Converter API. This API allows you to retrieve a list of available currencies, the latest exchange rates for a specified currency, and the latest exchange rates for a specified source and target currency, with optional amount parameters. The API also supports retrieving historical exchange rates.

## Features

- Retrieve a list of available currencies.
- Retrieve the latest exchange rates for a specified currency.
- Retrieve the latest exchange rates for a specified currency and amount.
- Retrieve the latest exchange rates for a specified source and target currency.
- Retrieve historical exchange rates for a specified currency, date, and optional amount.

## Requirements

- iOS 13.0+
- Swift 5.0+
- A network connection to access the Currency Converter API.

## Installation

### Swift Package Manager

#### Adding the Package to an iOS Project in Xcode

1. Open your project in Xcode.
2. Go to `File` > `Add Packages...`
3. Enter the repository URL: `https://github.com/chonte0313/CurrencyExchangeAPISwift`
4. Select the package options according to your project needs.
5. Click `Add Package`.


## Usage

### Retrieve a List of Available Currencies

```swift
let exchangeCurrency = ExchangeCurrency()
Task {
    do {
        let currencies = try await exchangeCurrency.getCurrencyList()
        print(currencies)
    } catch {
        print("Error: \(error)")
    }
}
```

### Retrieve the Latest Exchange Rates for a Specified Currency

```swift
Task {
    do {
        let currencyRates = try await exchangeCurrency.getLatestExchange(currency: "USD")
        print(currencyRates)
    } catch {
        print("Error: \(error)")
    }
}
```

### Retrieve the Latest Exchange Rates for a Specified Currency and Amount

```swift
Task {
    do {
        let currencyRates = try await exchangeCurrency.getLatestExchange(currency: "USD", amount: 100.0)
        print(currencyRates)
    } catch {
        print("Error: \(error)")
    }
}
```

### Retrieve the Latest Exchange Rates for a Specified Source and Target Currency

```swift
Task {
    do {
        let currencyRate = try await exchangeCurrency.getLatestExchange(currency: "USD", target: "EUR")
        print(currencyRate)
    } catch {
        print("Error: \(error)")
    }
}
```

### Retrieve Historical Exchange Rates for a Specified Currency, Date, and Optional Amount

```swift
let date = Date() // Replace with the desired date
Task {
    do {
        let currencyRates = try await exchangeCurrency.getExchange(currency: "USD", date: date)
        print(currencyRates)
    } catch {
        print("Error: \(error)")
    }
}
```

## Data Models

### CurrencyRates

A class representing the currency rates.

```swift
public class CurrencyRates: Decodable {
    var amount: Float
    var updated_at: String
    var rates: [CurrencyExchangeRate]
}
```

### CurrencyRate

A class representing a single currency rate.

```swift
public class CurrencyRate: Decodable {
    var amount: Float
    var updated_at: String
    var rate: CurrencyExchangeRate
}
```

### CurrencyExchangeRate

A class representing the details of a currency exchange rate.

```swift
public class CurrencyExchangeRate: Decodable {
    var target: String
    var amount: Float
    var error: String?
}
```

## Error Handling

The `ExchangeCurrency` class includes custom error handling using the `URLError` enumeration.

```swift
public enum URLError: Error {
    case noURL
}
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
