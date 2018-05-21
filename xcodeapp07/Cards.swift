//
//  Cards.swift
//  xcodeapp07
//
//  Created by stoller on 2018/5/15.
//  Copyright © 2018年 hung. All rights reserved.
//

import Foundation
import GameplayKit

let spades = ["♠︎A","♠︎2","♠︎3","♠︎4","♠︎5","♠︎6","♠︎7","♠︎8","♠︎9","♠︎10","♠︎J","♠︎Q","♠︎K"]
let clubs = ["♣︎A","♣︎2","♣︎3","♣︎4","♣︎5","♣︎6","♣︎7","♣︎8","♣︎9","♣︎10","♣︎J","♣︎Q","♣︎K"]
let hearts = ["♥︎A","♥︎2","♥︎3","♥︎4","♥︎5","♥︎6","♥︎7","♥︎8","♥︎9","♥︎10","♥︎J","♥︎Q","♥︎K"]
let diamonds = ["♦︎A","♦︎2","♦︎3","♦︎4","♦︎5","♦︎6","♦︎7","♦︎8","♦︎9","♦︎10","♦︎J","♦︎Q","♦︎K"]
let cards = spades + clubs + hearts + diamonds

//    洗牌
let distribution = GKShuffledDistribution(lowestValue: 0, highestValue: cards.count - 1)
let player1cardsShow1 = cards[distribution.nextInt()]
let player1cardsShow2 = cards[distribution.nextInt()]
let player1cardsShow3 = cards[distribution.nextInt()]
let player1cardsShow4 = cards[distribution.nextInt()]
let player1cardsShow5 = cards[distribution.nextInt()]

let player2cardsShow1 = cards[distribution.nextInt()]
let player2cardsShow2 = cards[distribution.nextInt()]
let player2cardsShow3 = cards[distribution.nextInt()]
let player2cardsShow4 = cards[distribution.nextInt()]
let player2cardsShow5 = cards[distribution.nextInt()]
