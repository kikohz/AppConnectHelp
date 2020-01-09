//
//  Extension.swift
//  AppConnectHelp
//
//  Created by Bllgo on 2020/1/9.
//  Copyright © 2020 Bllgo. All rights reserved.
//

import Foundation
import Cocoa

extension NSTextField {
    //实现了快捷键功能
    override open func performKeyEquivalent(with event: NSEvent) -> Bool {
    
            // The command key is the ONLY modifier key being pressed.
        //判断是否包含快捷键command，不包含就返回true
        if event.modifierFlags.isDisjoint(with: .command) {
            return super.performKeyEquivalent(with: event)
        }
        switch event.charactersIgnoringModifiers {
        case "a":
            return NSApp.sendAction(#selector(NSText.selectAll(_:)), to: self.window?.firstResponder, from: self)
        case "c":
            return NSApp.sendAction(#selector(NSText.copy(_:)), to: self.window?.firstResponder, from: self)
        case "v":
            return NSApp.sendAction(#selector(NSText.paste(_:)), to: self.window?.firstResponder, from: self)
        case "x":
            return NSApp.sendAction(#selector(NSText.cut(_:)), to: self.window?.firstResponder, from: self)
        default:
             return super.performKeyEquivalent(with: event)
        }
    }
}
