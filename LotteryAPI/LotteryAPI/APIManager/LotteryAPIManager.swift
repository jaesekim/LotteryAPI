//
//  LotteryAPIManager.swift
//  LotteryAPI
//
//  Created by 김재석 on 1/16/24.
//

import UIKit
import Alamofire

struct LotteryAPIManager {
    func getLotteryNumbers(
        round: Int,
        totalNumHandler: @escaping (String) -> Void,
        roundInfoHandler: @escaping (String) -> Void) {
        let url = "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=\(round)"
        
        AF.request(url, method: .get)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: LotteryModel.self) { response in
                switch response.result {
                case .success(let success):
                    roundInfoHandler(success.roundWithDate)
                    totalNumHandler(success.description)
                case .failure(_):
                    print("Error")
                }
        }
    }
}
