//
//  AnalyticsProvider.swift
//  AnalyticsProvider
//
//  Created by Mario Hahn on 19.12.17.
//  Copyright © 2017 Mario Hahn. All rights reserved.
//

import Foundation
import UIKit

public protocol ViewType {
    var name: String { get }
    var parameters: [String: Any]? { get }
}

public protocol EventType {
    var name: String { get }
    var parameters: [String: Any]? { get }
}

public protocol PurchaseType: EventType {
    var price: Double { get }
    var currency: String { get }
    var success: Bool { get }
}

public protocol AnalyticsProvider {
    func log(_ view: ViewType)
    func log(_ event: EventType)
    func log(_ purchase: PurchaseType)
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
}
