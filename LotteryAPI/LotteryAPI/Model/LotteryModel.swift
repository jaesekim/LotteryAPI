//
//  LotteryModel.swift
//  LotteryAPI
//
//  Created by 김재석 on 1/16/24.
//

import Foundation

struct LotteryModel: Codable {
    let drwNo: Int  // 회차
    let drwNoDate: String // 날짜
    
    let drwtNo1: Int
    let drwtNo2: Int
    let drwtNo3: Int
    let drwtNo4: Int
    let drwtNo5: Int
    let drwtNo6: Int
    let bnusNo: Int
    
    var roundWithDate: String {
        return "\(drwNo)회 | \(drwNoDate)"
    }
    
    var description: String {
        return "\(drwtNo1), \(drwtNo2), \(drwtNo3), \(drwtNo4), \(drwtNo5), \(drwtNo6) | 보너스: \(bnusNo)"
    }
}
