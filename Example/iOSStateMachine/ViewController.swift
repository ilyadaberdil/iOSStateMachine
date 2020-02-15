//
//  ViewController.swift
//  StateMachine
//
//  Created by berdil karaçam on 14.02.2020.
//  Copyright © 2020 berdil karaçam. All rights reserved.
//

import UIKit
import iOSStateMachine

class ViewController: UIViewController {

    //MARK: USAGE
    enum Events: EventType {
        case event1
        case event2
    }

    enum States: StateType {
        case state1
        case state2
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        doSomething()
    }
    
    private func doSomething() {
            
        StateMachine<Events, States>(currentState: .state1) { stateMachine in
            let mappingDisposable = stateMachine.addRouteMapping { (event, state) -> ViewController.States? in
                switch (event, state) {
                case (.event1, .state1):
                    print("event1 triggered -> state1 to state2")
                    return .state2
                case (.event2, .state2):
                    print("event2 triggered -> state2 to state1")
                    return .state1
                default:
                    return nil
                }
            }
            stateMachine.addRoute { (fromState, toState) in
                switch (fromState, toState) {
                case (.state1, .state2):
                    print("state1 to state2")
                    stateMachine >>> .event2
                case (.state2, .state1):
                    print("state2 to state1")
                    mappingDisposable.dispose()
                    // it does not trigger mapping functions. Cause of dispose()
                    stateMachine >>> .event1
                default:
                    break
                }
            }
            // event1 triggered
            stateMachine >>> .event1
        }
        
        //NO EVENT MACHINE
        let machine = StateMachine<NoEvent, States>(currentState: .state1)
         
        machine.addRoute { (fromState, toState) in
            switch (fromState, toState) {
            case (.state1, .state2):
                print("no event -> state1 to state2")
            case (.state2, .state1):
                print("no event -> state2 to state1")
            default:
                break
            }
        }
        //state changed
        machine >>> .state2
    }
}


