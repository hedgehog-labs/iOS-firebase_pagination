//
//  Player.swift
//  fb pagination
//
//  Created by Ymmanuel on 4/20/17.
//  Copyright © 2017 Hedgehog Labs. All rights reserved.
//

class Player {
    
    fileprivate var _key:String!
    fileprivate var _name:String!
    fileprivate var _score:Int!
    fileprivate var _avatar:String!
    
    var key:String!{
        return _key
    }
    
    var name:String!{
        return _name
    }
    
    var score:Int!{
        return _score
    }
    
    var avatar:String!{
        return _avatar
    }
    
    
    init(key:String!,dictionary:Dictionary<String,AnyObject>) {
        
        _key = key
        
        if let name = dictionary["name"] as? String{
            self._name = name
        }
        
        if let score = dictionary["score"] as? Int{
            self._score = score
        }
        
        if let avatar = dictionary["avatar"] as? String{
            self._avatar = avatar
        }
    }
    
    
}
