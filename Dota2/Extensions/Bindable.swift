//
//  Bindable.swift
//  Dota2
//
//  Created by José Alves da Cunha on 14/08/23.
//

import Foundation

public final class Bindable<T> {
    
    public typealias Listener = (T) -> Void
    
    private var listener: Listener?
    public var value: T {
        didSet {
            listener?(value)
        }
    }
    public init(_ value: T) {
        self.value = value
    }
    
    public func bind(listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
}
