//
//  ColorManager+ConvertHexCodesToColor.swift
//  TravelAssistant
//
//  Created by Metehan Veliashvili on 16.10.2024.
//

import UIKit

protocol ConvertHexCodeToColorProtocol {
    func convertColor(from hex: String) -> UIColor
}
