//
//  NavigationContext.swift
//  IMDBUI
//
//  Created by Ismail Bozkurt on 16/07/2023.
//

import Foundation
import SwiftUI

public protocol NavigationContext {
    func setInitialView<T: View> (view: T)
    func push<T: View>(view: T, animated: Bool)
    func pop (animated: Bool)
    func present<T: View> (view: T, animated: Bool)
    func dismiss (animated: Bool)
}
