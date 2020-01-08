//
//  MasterViewController.swift
//  AppConnectHelp
//
//  Created by Bllgo on 2020/1/8.
//  Copyright © 2020 Bllgo. All rights reserved.
//

import Cocoa

class MasterViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    @IBOutlet weak var keyPath: NSTextField!
    
    @IBOutlet weak var tokenTf: NSTextField!
    

    @IBOutlet var apiInfoTextView: NSTextView!
    @IBOutlet weak var urlTf: NSTextField!
    @IBAction func generateToken(_ sender: Any) {
        if keyPath.stringValue.count > 0 {
            let jwphelp = JWTTokensHelp()
            self.tokenTf.stringValue = jwphelp.generate(path: keyPath.stringValue)
        }
        else {
            let alert = NSAlert()
            alert.icon = NSImage(named: "error-alert")
            alert.addButton(withTitle: "OK")
            alert.messageText = "key错误"
            alert.informativeText = "请您选择正确的文件再试,谢谢"
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
