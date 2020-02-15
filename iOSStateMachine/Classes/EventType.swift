//
//  EventType.swift
//  StateMachine
//
//  Created by berdil karaçam on 14.02.2020.
//  Copyright © 2020 berdil karaçam. All rights reserved.
//


public protocol EventType: Hashable { }


// Needed if there is no events for changing states
public enum NoEvent: EventType { }
