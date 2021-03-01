//
//  AnalyticsProvider.swift
//  AnalyticsProvider
//
//  Created by Mario Hahn on 19.12.17.
//  Copyright © 2017 Mario Hahn. All rights reserved.
//

import Foundation

public protocol ViewType {
    var name: String { get }
    var parameters: [AnyHashable: Any]? { get }
}

public extension ViewType {

    var parameters: [AnyHashable: Any]? {
        return nil
    }
}

public protocol EventType {
    var action: String { get }
    var category: String { get }
    var label: String? { get }
    var value: Double? { get }
    var parameters: [AnyHashable: Any]? { get }
}

public extension EventType {

    var label: String? {
        return nil
    }

    var value: Double? {
        return nil
    }

    var parameters: [AnyHashable: Any]? {
        return nil
    }
}

public protocol PurchaseType {
    var transactionId: String { get }
    var price: Double { get }
    var name: String { get }
    var currency: String { get }
    var category: String { get }
    var sku: String { get }
    var success: Bool { get }
}

public extension PurchaseType {
    var transactionId: String {
        return UUID().uuidString
    }
}

public protocol AnalyticsProvider {
    func log(_ view: ViewType)
    func log(_ event: EventType)
    func log(_ purchase: PurchaseType)

    func setUserProperty(_ value: String?, for key: String)
}

public struct Analytics {

    private static var instance = Analytics()
    private var providers = [AnalyticsProvider]()

    public static func register(providers analyticsProviders: [AnalyticsProvider]) {
        instance.providers.append(contentsOf: analyticsProviders)
    }

    public static func log(_ view: ViewType) {
        instance.providers.forEach { $0.log(view) }
    }

    public static func log(_ event: EventType) {
        instance.providers.forEach { $0.log(event) }
    }

    public static func log(_ purchase: PurchaseType) {
        instance.providers.forEach { $0.log(purchase) }
    }

    public static func setUserProperty(_ value: String?, for key: String) {
        instance.providers.forEach { $0.setUserProperty(value, for: key) }
    }
}

