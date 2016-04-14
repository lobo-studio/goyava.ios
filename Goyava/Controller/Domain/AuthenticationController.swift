//
//  AuthenticationController.swift
//  Goyava
//
//  Created by Susim Samanta on 01/04/16.
//  Copyright © 2016 LordAlexWorks. All rights reserved.
//

import UIKit
import RealmSwift
public typealias AuthenticationHandler = (obj : AnyObject? , error : NSError?) -> Void

class AuthenticationController: NSObject {
    
    //MARK: Login controller method
    class func doLogin(session : Session, handler : AuthenticationHandler){
        AppServices.callLoginService(session) { (obj, error) -> Void in
            if error != nil {
                handler(obj: nil,error: error)
            }else {
                // do bussiness logic with login json response
                let json = obj as! NSDictionary
                let error = json["errors"]
                if error != nil {
                   session.isSuccess = false
                }else {
                    session.isSuccess = true
                    // create user 
                    let clientJson = json["client"] as! NSDictionary
                    let user = User()
                    user.setModelData(clientJson)
                    let realm = try! Realm()
                    try! realm.write {
                        realm.add(user)
                    }
                }
                handler(obj: session, error: nil)
            }
        }
    }
    
    //MARK: Signup controller method
    class func doSignup(session : Session, handler : AuthenticationHandler){
        AppServices.callSignupService(session) { (obj, error) -> Void in
            if error != nil {
                handler(obj: nil,error: error)
            }else {
                // do bussiness logic with signup json response
                let json = obj as! NSDictionary
                let userid = json["client"]!["id"]
                if userid != nil {
                    session.isSuccess = false
                }else {
                    session.isSuccess = true
                }
                handler(obj: session, error: nil)
            }
        }
    }
    class func getLocalUser()-> User? {
        let realm = try! Realm()
        return realm.objects(User).first
    }
}
