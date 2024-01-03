//
//  SFSymbolName.swift
//  
//
//  Created by Kaleb Cooper on 9/4/22.
//

import Foundation

import UIKit
public enum SFSymbolName: String, Hashable {
    case arrowUpRight = "arrowshape.turn.up.right"
    case arrowChevronRight = "chevron.right"
    case plusCircle = "plus.circle"
    case plusCircleFilled = "plus.circle.fill"
    case plus = "plus"
    case lightbulb = "lightbulb"
    case heartCircle = "heart.circle"
    case starOfLife = "staroflife"
    case starIcon = "star.fill"
    case starEmptyIcon = "star"
    case person = "person"
    case globe = "globe"
    case heightArrow = "arrow.up.and.down"
    case weightIcon = "speedometer"
    case weightEntryIcon = "square.and.pencil"
    case activityIcon = "waveform.path.ecg"
    case calendarIcon = "calendar"
    case permissionsIcon = "hand.raised"
    case notificationIcon = "bell"
    case cameraIcon = "camera"
    case infoIcon = "info.circle"
    case clockIcon = "clock"
    case searchIcon = "magnifyingglass"
    case profileIcon = "person.crop.circle"
    case barcodeIcon = "barcode.viewfinder"
    case arrowChevronUp = "chevron.up"
    case arrowChevronDown = "chevron.down"
    case checkmarkIcon = "checkmark.circle"
    case checkmarkFilledIcon = "checkmark.seal.fill"
    case cautionIcon = "exclamationmark.circle"
    case errorIcon = "xmark.circle"
    case shareIcon = "square.and.arrow.up"
    case trashIcon = "trash"
    case flashOn = "bolt.fill"
    case flashOff = "bolt.slash.fill"

}
public class SFSymbol {
    static func getSymbol(withName name: SFSymbolName, font: UIFont) -> UIImage {
        let configuration = UIImage.SymbolConfiguration(font: font)
        var image = UIImage(systemName: name.rawValue, withConfiguration: configuration)!
        image = image.withRenderingMode(.alwaysTemplate)
        return image
    }
}
