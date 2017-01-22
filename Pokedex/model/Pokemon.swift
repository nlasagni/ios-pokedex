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
    private var mNextEvolutionId: Int!
    private var mNextEvolutionName: String!
    private var mNextEvolutionLevel: String!
    
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
    
    var pokedexId: String {
        return "\(id)"
    }
    
    var description: String {
        get {
            if mDescription == nil {
                mDescription = ""
            }
            return mDescription
        }
        set {
            mDescription = newValue
        }
    }
    
    var type: String {
        get {
            if mType == nil {
                mType = ""
            }
            return mType
        }
        set {
            mType = newValue
        }
    }
    
    var defense: String {
        get {
            if mDefense == nil {
                mDefense = ""
            }
            return mDefense
        }
        set {
            mDefense = newValue
        }
    }
    
    var height: String {
        get {
            if mHeight == nil {
                mHeight = ""
            }
            return mHeight
        }
        set {
            mHeight = newValue
        }
    }
    
    var weight: String {
        get {
            if mWeight == nil {
                mWeight = ""
            }
            return mWeight
        }
        set {
            mWeight = newValue
        }
    }
    
    var baseAttack: String {
        get {
            if mBaseAttack == nil {
                mBaseAttack = ""
            }
            return mBaseAttack
        }
        set {
            mBaseAttack = newValue
        }
    }
    
    var hasEvolution: Bool {
        return nextEvolutionId != 0
    }
    
    var nextEvolutionId: Int {
        get {
            if mNextEvolutionId == nil {
                mNextEvolutionId = 0
            }
            return mNextEvolutionId
        }
        set {
            mNextEvolutionId = newValue
        }
    }
    
    var nextEvolutionImageName: String {
        return "\(nextEvolutionId)"
    }
    
    var nextEvolutionName: String {
        get {
            if mNextEvolutionName == nil {
                mNextEvolutionName = ""
            }
            return mNextEvolutionName
        }
        set {
            mNextEvolutionName = newValue
        }
    }
    
    var nextEvolutionLevel: String {
        get {
            if mNextEvolutionLevel == nil {
                mNextEvolutionLevel = ""
            }
            return mNextEvolutionLevel
        }
        set {
            mNextEvolutionLevel = newValue
        }
    }
    
    var nextEvolutionDescription: String {
        if !hasEvolution {
            return "No Evolution"
        } else {
            return "Next Evolution: \(nextEvolutionName) Lvl. \(nextEvolutionLevel)"
        }
    }
    
}
