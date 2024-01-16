//
//  LotteryViewController.swift
//  LotteryAPI
//
//  Created by 김재석 on 1/16/24.
//

import UIKit

class LotteryViewController: UIViewController {

    // 회차 입력 textField
    @IBOutlet var roundTextField: UITextField!
    // 로또 결과 label
    @IBOutlet var resultLabel: UILabel!
    
    // PickerView 객체 생성
    let lotteryPickerView = UIPickerView()
    
    // round list 생성
    let roundList: [Int] = Array(1...1102).reversed()
    
    // API 관리 객체 생성
    let apiManager = LotteryAPIManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
        apiManager.getLotteryNumbers(
            round: 1102) { value in
                self.resultLabel.text = value
            } roundInfoHandler: { value in
                self.roundTextField.text =  value
            }
    }

    @IBAction func dismissOnTap(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    
    @IBAction func enterOntapped(_ sender: UITextField) {
        roundTextField.endEditing(true)
    }
}

extension LotteryViewController {
    
    func configureView() {
        lotteryPickerView.delegate = self
        lotteryPickerView.dataSource = self
        
        roundTextField.textAlignment = .center
        resultLabel.textAlignment = .center
        resultLabel.text = "잠시만 기다려 주세요"
        
        roundTextField.inputView = lotteryPickerView
    }
}

extension LotteryViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    // 고를 수 있는 컴포넌트 개수
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // 한 컴포넌트에 포함된 row 개수
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return roundList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        apiManager.getLotteryNumbers(round: roundList[row]) { value in
            self.resultLabel.text = value
        } roundInfoHandler: { value in
            self.roundTextField.text = value
        }

    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(roundList[row])회"
    }
    
}
