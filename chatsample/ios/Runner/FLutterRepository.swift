//
//  FLutterRepository.swift
//  Runner
//
//  Created by 島津江幹雄 on 2022/06/07.
//

import UIKit
import Foundation
import Flutter

class FlutterRepository : NSObject
{
    var _window: UIWindow
    var _flutterChannel: FlutterMethodChannel
    init(window: UIWindow){
        _window = window
        let controller : FlutterViewController = _window.rootViewController as!
            FlutterViewController
        _flutterChannel = FlutterMethodChannel(name:"com.chatsample-mikishi.methodchannel/chatsample.sdk",binaryMessenger: controller.binaryMessenger)
        
        super.init()
        
        _flutterChannel.setMethodCallHandler({ [self](call: FlutterMethodCall,result: FlutterResult) -> Void in
            
            //  Note: this method is invoked on the UI thread.
            switch( call.method ){
            case "regist_stretto":
                try!
                self.provisioningSuccess(callName: "login",phoneNumber: "090xxxxxxxx",extNumber: "1234");
                break;
            case "un_regist_stretto":
                break;
            case "regist_sip":
                break;
            case "un_regist_sip":
                break;
            case "mute":
                break;
            case "unmute":
                break;
            default:
                result(FlutterMethodNotImplemented)
            }
            return
        })
    }
    
    func provisioningSuccess(callName: String,phoneNumber: String, extNumber: String) throws{
        _flutterChannel.invokeMethod("provisioning_success", arguments:["call_name":callName,"id":ChatContext.account_id,"pw":ChatContext.account_password,"src_phone_number":phoneNumber,"src_ext_number":extNumber])
    }
}
