# iOSStateMachine
StateMachine easy to use for iOS Platforms. 
Install library into project, never have to handle states of complex logics.

[![Version](https://img.shields.io/cocoapods/v/iOSStateMachine.svg?style=flat)](https://cocoapods.org/pods/iOSStateMachine)
[![License](https://img.shields.io/cocoapods/l/iOSStateMachine.svg?style=flat)](https://cocoapods.org/pods/iOSStateMachine)
[![Platform](https://img.shields.io/cocoapods/p/iOSStateMachine.svg?style=flat)](https://cocoapods.org/pods/iOSStateMachine)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

```ruby
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
```

## Installation

iOSStateMachine is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'iOSStateMachine'
```

## Author

ilyadaberdil, ilyadaberdil@gmail.com

## License

iOSStateMachine is available under the MIT license. See the LICENSE file for more info.
