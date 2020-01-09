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

    @IBOutlet weak var window: NSWindow!

    var masterView:MasterViewController?

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        self.masterView = MasterViewController(nibName: "MasterViewController", bundle: nil)
        self.window.contentView?.addSubview(self.masterView!.view)
        self.masterView?.view.frame = self.window.contentView!.bounds
        self.masterView?.view.autoresizingMask = [.width,.height]
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

