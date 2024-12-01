//
//  OnboardingSlide.swift
//  ContactSafesApp
//
//  Created by Metehan Veliashvili on 1.12.2024.
//

import Foundation

enum OnboardingSlide {
    case first
    case second
    case third
    
    var title: String {
        switch self {
        case .first:
            return "You're Not Alone"
        case .second:
            return "Reach Out When It Matters Most"
        case .third:
            return "Stay Connected in Tough Times"
        }
    }
    
    var subTitle: String {
        switch self {
        case .first:
            return "Share your feelings and take a step towards clarity."
        case .second:
            return "Let your loved ones know you need support with just a tap."
        case .third:
            return "Ensure help is just a message away when you need it most."
        }
    }
    
    var buttonTitle: String {
        switch self {
        case .first:
            return "Get Started"
        case .second:
            return "Next"
        case .third:
            return "Finish"
        }
    }
    
}
