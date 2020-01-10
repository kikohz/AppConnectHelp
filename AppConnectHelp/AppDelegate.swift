//
//  AppDelegate.swift
//  AppConnectHelp
//
//  Created by Bllgo on 2020/1/7.
//  Copyright © 2020 Bllgo. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var mainWindowC:MainWindowController?

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        mainWindowC = MainWindowController(windowNibName: "MainWindowController")
        mainWindowC?.window?.center()
        mainWindowC?.window?.orderFront(nil)
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

