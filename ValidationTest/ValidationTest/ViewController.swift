//
//  ViewController.swift
//  ValidationTest
//
//  Created by 이준협 on 2022/12/29.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var pwdLabel: UILabel!
    @IBOutlet weak var pwdTextField: UITextField!
    
    @IBOutlet weak var phoneNumLabel: UILabel!
    @IBOutlet weak var phoneNumTextfield: UITextField!
    
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailTextfield: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func pwdBtn(_ sender: Any) {
        if pwdLabel.text != nil {
            if isValidPwd(testStr: pwdTextField.text!){
                pwdLabel.text = "비밀번호 형식 맞음"
            }else {
                pwdLabel.text = "비밀번호 형식 틀림"
            }
        }else {
            print("핸드폰번호를 입력하세요.")
        }
    }
    
    @IBAction func phoneNumBtn(_ sender: Any) {
        if phoneNumLabel.text != nil {
            if isValidPhoneNum(testStr: phoneNumTextfield.text!) {
                phoneNumLabel.text = "핸드폰 형식 맞음"
            }else {
                phoneNumLabel.text = "핸드폰 형식 틀림"
            }
        }else {
            print("핸드폰번호를 입력하세요.")
        }
    }
    
    @IBAction func emailBtn(_ sender: Any) {
        if phoneNumLabel.text != nil {
            if isValidEmail(testStr: emailTextfield.text!) {
                emailLabel.text = "이메일 형식 맞음"
            }else {
                emailLabel.text = "이메일 형식 틀림"
            }
        }else {
            print("핸드폰번호를 입력하세요.")
        }
       
    }
    
    
    func isValidEmail(testStr:String) -> Bool {
           let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        // 영문숫자 + 골뱅이 + 영문숫자 + . + 영문숫자
           let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
           let isValid = emailTest.evaluate(with: testStr)
            return isValid
        }
    
    
    
    func isValidPwd(testStr:String) -> Bool {
        let regex = "^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[!@#$%^&*()_+=-]).{8,50}" // 8자리 ~ 50자리 영어+숫자+특수문자

           let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
           let isValid = predicate.evaluate(with: testStr)
            return isValid
        }
    
    
    
    func isValidPhoneNum(testStr:String) -> Bool {
        //01 로 시작해서 0~9 사이의 숫자가 7~8자리
        let regex = "^01[0-1, 7][0-9]{7,8}$"
           let phonePredicate = NSPredicate(format: "SELF MATCHES %@", regex)
           let isValid = phonePredicate.evaluate(with: testStr)
            return isValid
        }
    
    
    
    
    
}


