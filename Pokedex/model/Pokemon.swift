//
//  Pokemon.swift
//  Pokedex
//
//  Created by Nicola Lasagni on 21/01/2017.
//  Copyright © 2017 Nicola Lasagni. All rights reserved.
//

import Foundation

class Pokemon {
    
    private var mId: Int!
    private var mName: String!
    
    init(id: Int, name: String) {
        mId = id
        mName = name
    }
    
    var id: Int {
        return mId
    }
    
    var name: String {
        return mName
    }
    
}
