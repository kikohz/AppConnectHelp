//
//  MasterViewController.swift
//  AppConnectHelp
//
//  Created by Bllgo on 2020/1/8.
//  Copyright © 2020 Bllgo. All rights reserved.
//

import Cocoa

class MasterViewController: NSViewController {

    @IBOutlet weak var keyPath: NSTextField!
    @IBOutlet weak var tokenTf: NSTextField!
    @IBOutlet weak var issTf: NSTextField!
    @IBOutlet weak var kidTf: NSTextField!
    
    @IBOutlet var bundleDsView: NSView!
    @IBOutlet var apiInfoTextView: NSTextView!
    @IBOutlet weak var urlTf: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        self.loadCache()
    }
    
    fileprivate func loadCache() {
        let userdefault = UserDefaults()
        if let iss = userdefault.string(forKey: "iss") ,let kid = userdefault.string(forKey: "kid"){
            self.issTf.stringValue = iss
            self.kidTf.stringValue = kid
        }
    
    }
    
    
    @IBAction func generateToken(_ sender: Any) {
        if keyPath.stringValue.count > 0, issTf.stringValue.count > 0 ,kidTf.stringValue.count > 0 {
            let jwphelp = JWTTokensHelp()
            self.tokenTf.stringValue = jwphelp.generate(path: keyPath.stringValue, iss: issTf.stringValue,kid: kidTf.stringValue)
            let userdefault = UserDefaults()
            userdefault.set(issTf.stringValue, forKey: "iss")
            userdefault.set(kidTf.stringValue, forKey: "kid")
            userdefault.synchronize()
        }
        else {
            let alert = NSAlert()
            alert.icon = NSImage(named: "error-alert")
            alert.addButton(withTitle: "OK")
            alert.messageText = "基础信息错误"
            alert.informativeText = "请填写正确的信息，并且选择key文件之后再试,谢谢"
            alert.alertStyle = .informational
            alert.beginSheetModal(for: NSApplication.shared.mainWindow!) { response in
            }
        }
    }
    @IBAction func selectKey(_ sender: Any) {
        self.openFilePanel()
    }
    
    @IBAction func startTestApi(_ sender: Any) {
        if tokenTf.stringValue.count > 0 {
            let api = ConnectAPI()
            api.apps(tokenTf.stringValue) { value in
                if let responce = value {
                    self.apiInfoTextView.string = responce
                }
                else{
                    self.apiInfoTextView.string = "请求失败，清重试"
                }
            }
        }
        else {
            let alert = NSAlert()
            alert.icon = NSImage(named: "error-alert")
            alert.addButton(withTitle: "OK")
            alert.messageText = "token错误"
            alert.informativeText = "token不能为h空，清先生成token在做相应操作"
            alert.alertStyle = .informational
            alert.beginSheetModal(for: NSApplication.shared.mainWindow!) { response in
            }
        }
    }
    
    @IBAction func openApiView(_ sender: Any) {
//        let view = NSView(frame: CGRect(x: 0, y: 0, width: 100, height: 200 ))
//        self.view.addSubview(view)
//        let bundleidsView = BundleIDsViewController(windowNibName: "BundleIDsViewController")
//        bundleidsView.window?.orderFront(nil)
//        NSApplication.shared.mainWindow?.orderOut(nil)
        
    }
    fileprivate func openFilePanel() {
        let openPanel = NSOpenPanel()
        openPanel.allowedFileTypes = ["p8"]
        openPanel.directoryURL = nil
        openPanel.begin { (response) in
            if response == .OK {
                let selectPath = openPanel.url?.path
                self.keyPath.stringValue = selectPath!
            }
            openPanel.close()
        }
    }
}
