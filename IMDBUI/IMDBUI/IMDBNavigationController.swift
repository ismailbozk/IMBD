//
//  IMDBNavigationController.swift
//  IMDBUI
//
//  Created by Ismail Bozkurt on 16/07/2023.
//

import Foundation
import SwiftUI

public class IMDBNavigationController: UINavigationController, NavigationContext {

    public func setInitialView<T: View>(view: T) {
        let vc = UIHostingController (rootView: view)
        viewControllers = [vc]
    }

    public func push<T: View>(view: T, animated: Bool) {
        let vc = UIHostingController (rootView: view)
        pushViewController (vc, animated: animated)
    }

    public func present<T: View>(view: T, animated: Bool) {
        let vc = UIHostingController (rootView: view)
        vc.modalTransitionStyle = .coverVertical
        vc.modalPresentationStyle = . automatic
        present(vc, animated: animated)
    }

    public func pop(animated: Bool) {
        popViewController(animated: animated)
    }

    public func dismiss(animated: Bool) {
        dismiss(animated: animated, completion: nil)
    }
}
