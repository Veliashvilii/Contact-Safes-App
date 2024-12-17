//
//  MainThread+Weakify.swift
//  ContactSafesApp
//
//  Created by Metehan Veliashvili on 1.12.2024.
//

import Foundation

protocol MainThreadRunner: AnyObject {
    func runOnMain(_ block: @escaping () -> Void)
    func runOnMainSafety(_ block: @escaping () -> Void)
}

extension MainThreadRunner {
    func runOnMain(_ block: @escaping () -> Void) {
        guard Thread.isMainThread else {
            DispatchQueue.main.async {
                block()
            }
            return
        }
        block()
    }
    func runOnMainSafety(_ block: @escaping () -> Void) {
        guard Thread.isMainThread else {
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                block()
            }
            return
        }
        block()
    }
}
