//
//  UIDevice+Extension.swift
//  TapticEngineExample
//
//  Created by Saoud Rizwan on 8/14/17.
//  Copyright © 2017 Saoud Rizwan. All rights reserved.
//

import UIKit

extension UIDevice {
    
    var iPhone7AndAbove: Bool {
        return hasHapticFeedback
    }
    
    enum DevicePlatform: String {
        case other = "Old Device"
        case iPhone6S = "iPhone 6S"
        case iPhone6SPlus = "iPhone 6S Plus"
        case iPhone7 = "iPhone 7"
        case iPhone7Plus = "iPhone 7 Plus"
        case iPhoneX = "iPhone X"
        case iPhoneXs = "iPhone Xs"
        case iPhoneXsMax = "iPhone Xs Max"
        case iPhoneXr = "iPhone Xr"
    }
    
    var platform: DevicePlatform {
        get {
            var sysinfo = utsname()
            uname(&sysinfo)
            let platform = String(bytes: Data(bytes: &sysinfo.machine, count: Int(_SYS_NAMELEN)), encoding: .ascii)!.trimmingCharacters(in: .controlCharacters)
            switch platform {
            case "iPhone11,8":
                return .iPhoneXr
            case "iPhone11,4", "iPhone11,6":
                return .iPhoneXsMax
            case "iPhone11,2":
                return .iPhoneXs
            case "iPhone10,3", "iPhone10,6":
                return .iPhoneX
            case "iPhone9,2", "iPhone9,4":
                return .iPhone7Plus
            case "iPhone9,1", "iPhone9,3":
                return .iPhone7
            case "iPhone8,2":
                return .iPhone6SPlus
            case "iPhone8,1":
                return .iPhone6S
            default:
                return .other
            }
        }
    }
    
    var hasTapticEngine: Bool {
        get {
            return platform == .iPhone6S
                || platform == .iPhone6SPlus
                || iPhone7AndAbove
        }
    }
    
    var hasHapticFeedback: Bool {
        get {
            return platform == .iPhone7
                || platform == .iPhone7Plus
                || platform == .iPhoneX
                || platform == .iPhoneXs
                || platform == .iPhoneXsMax
                || platform == .iPhoneXr
        }
    }
}
