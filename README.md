# AnalyticsProvider

## Podfile

```ruby
pod 'AnalyticsProvider'
```

## Answers Support 
https://github.com/mariohahn/AnswersAnalytics

## Usage

```swift
  Analytics.register(providers: [AnswersProvider(), GoogleAnalyticsProvider()])
  
  Analytics.log(.profile(.logout))
```
