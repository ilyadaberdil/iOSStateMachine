//
//  StateMachine.swift
//  StateMachine
//
//  Created by berdil karaçam on 14.02.2020.
//  Copyright © 2020 berdil karaçam. All rights reserved.
//


infix operator >>>
public final class StateMachine<E: EventType, S: StateType> {
    
    public typealias StateRouteMapping = (_ event: E, _ fromState: S) -> S?
    public typealias RouteStateToState = (_ fromState: S, _ toState: S) -> ()
        
    private var _routeMappings: StateRouteMapping?
    private var _routeStateToState: RouteStateToState?
    
    private var currentState: S {
        didSet {
            route(from: oldValue)
        }
    }
    
    @discardableResult
    public func addRouteMapping(routeMapping: @escaping StateRouteMapping) -> ActionDisposable {

        _routeMappings = routeMapping
        
        return ActionDisposable { [weak self] in
            self?._routeMappings = nil
        }
    }
    
    @discardableResult
    public func addRoute(_ newRouter: @escaping RouteStateToState) -> ActionDisposable {
        _routeStateToState = newRouter
        
        return ActionDisposable { [weak self] in
            self?._routeStateToState = nil
        }
    }

    private func route(from oldState: S) {
        _routeStateToState?(oldState, currentState)
    }

    public static func >>>(lhs: StateMachine, rhs: E) {
            lhs.trigger(event: rhs)
    }
    
    public static func >>>(lhs: StateMachine, rhs: S) {
            lhs.change(state: rhs)
    }
    
    private func trigger(event: E) {
        print("triggered \(event)")
        guard let mapping = _routeMappings?(event, currentState) else { return }
        change(state: mapping)
    }
    
    private func change(state: S) {
        print("changed \(state)")
        currentState = state
    }
    
    @discardableResult
    public init(currentState: S, _ initialClosure: ((StateMachine) -> Void)? = nil) {
        self.currentState = currentState
        initialClosure?(self)
    }
    
}
