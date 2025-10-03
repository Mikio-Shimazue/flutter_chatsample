//
//  ChatContext.swift
//  Runner
//
//  Created by 島津江幹雄 on 2022/06/07.
//

import os
import Foundation
import CallKit

class ChatContext{
    static let TUNNEL_TIMEOUT:Int = 60  //  秒
    
    //  初回起動か否か
    static var isFirstRun: Bool {
        get{
            let key = "isFirstRun"
            if UserDefaults.standard.object(forKey: key) != nil{
                return UserDefaults.standard.bool(forKey: key)
            } else {
                return true
            }
        }
        set(arg){
            let key = "isFirstRum"
            UserDefaults.standard.set(arg, forKey: key)
        }
    }
    
    static var sipEnable: Bool{
        get {
            let key = "sipEnable"
            if UserDefaults.standard.object(forKey: key) != nil {
                return UserDefaults.standard.bool(forKey: key)
            } else {
                return true
            }
        }
        set(arg) {
            let key = "sipEnable"
            UserDefaults.standard.set(arg,forKey: key)
        }
    }
    
    static var flutterRepository: FlutterRepository? = nil
    static var account_id: String = "";
    static var account_password: String = "";
    
    
    static func log_print(msg:String?){
        if let msg2 = msg {
            let dateFormat:DateFormatter = {
                let ret = DateFormatter()
                ret.dateFormat = "yyyy/MM/dd HH:mm:ss.SSS"
                ret.locale = Locale(identifier: "ja_JP")
                return ret
            }()
            
            if #available(iOS 10.0, *) {
                os_log("%{public}@",log:OSLog(subsystem: "ChatSample", category: "debug"), type:.default,msg2)
            } else {
                // Fallback on earlier versions
            }
        }
    }
}
