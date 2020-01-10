//
//  MainWindowController.swift
//  AppConnectHelp
//
//  Created by Bllgo on 2020/1/10.
//  Copyright © 2020 Bllgo. All rights reserved.
//

import Cocoa

class MainWindowController: NSWindowController {

    var masterView:MasterViewController?
    var bundleidsView:BundleIDsViewController?
    
    override func windowDidLoad() {
        super.windowDidLoad()

        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
        self.masterView = MasterViewController(nibName: "MasterViewController", bundle: nil)
        self.window?.contentView?.addSubview(self.masterView!.view)
        self.masterView?.view.frame = self.window!.contentView!.bounds
        self.masterView?.view.autoresizingMask = [.width,.height]
        //
        self.bundleidsView = BundleIDsViewController(windowNibName: "BundleIDsViewController")
    }
    
    func openBundleidsView() {
        self.bundleidsView?.window?.orderFront(nil)
        self.window?.orderOut(nil)
    }
    
    func showMainWindow() {
        self.window?.makeKeyAndOrderFront(nil)
    }
    
}
