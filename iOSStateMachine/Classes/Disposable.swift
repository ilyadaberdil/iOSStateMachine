//
//  Disposable.swift
//  StateMachine
//
//  Created by berdil karaçam on 14.02.2020.
//  Copyright © 2020 berdil karaçam. All rights reserved.
//


public protocol Disposable {
    var disposed: Bool { get }

    func dispose()
}

public final class ActionDisposable: Disposable {
    private var action: (() -> ())?

    public var disposed: Bool {
        return action == nil
    }

    public init(action: @escaping (() -> ())) {
        self.action = action
    }

    public func dispose() {
        self.action?()
        self.action = nil
    }

}
