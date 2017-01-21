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
    private var mDescription: String!
    private var mType: String!
    private var mDefense: String!
    private var mHeight: String!
    private var mWeight: String!
    private var mBaseAttack: String!
    private var mNextEvolutionDescription: String!
    
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
    
    var imageName: String {
        return "\(id)"
    }
    
}
