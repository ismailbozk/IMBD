//
//  Coordinator.swift
//  IMDBUI
//
//  Created by Ismail Bozkurt on 16/07/2023.
//

import Foundation

public protocol Coordinator: AnyObject {
    associatedtype R = Route
    func navigate(_ route: R)
}

public protocol Route { }
