# AnalyticsProvider

## Podfile

```ruby
pod 'AnalyticsProvider'
```

## Usage

```swift
  Analytics.register(providers: [AnswersProvider(), GoogleAnalyticsProvider()])
  
  Analytics.log(.profile(.logout))
```
