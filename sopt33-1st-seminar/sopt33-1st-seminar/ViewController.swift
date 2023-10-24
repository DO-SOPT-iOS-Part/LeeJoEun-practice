//
//  ViewController.swift
//  sopt33-1st-seminar
//
//  Created by 이조은 on 2023/10/07.
//

import UIKit

class ViewController: UIViewController {
    private var idText: String = ""
    private var passwordText: String = ""
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!

    @IBAction func idTextFieldDidEditing(_ sender: Any) {
        guard let textField = sender as? UITextField else {return}
        if let idText = textField.text {
            self.idText = idText
        }
    }

    @IBAction func passwordTextFieldDidEditing(_ sender: Any) {
        guard let textField = sender as? UITextField else {return}
        if let passwordText = textField.text {
            self.passwordText = passwordText
        }
    }

    @IBAction func sliderValueChange(_ sender: UISlider) {
        let value = sender.value
        valueLabel.text = String(Int(value))
    }


    @IBAction func loginButtonTap(_ sender: Any) {
        print("\(idText)\n\(passwordText)")
        pushToResultVC()
    }

    func pushToResultVC() {
        guard let resultVC = self.storyboard?.instantiateViewController(identifier: "ResultVC") as? ResultVC else {return}
        resultVC.email = idText
        resultVC.password = passwordText

        resultVC.delegate = self
        getLoginData(email: idText, password: passwordText)

        resultVC.loginDataCompletion = { data in
            print("클로저로 받아온 email : \(data[0]), 클로저로 받아온 password : \(data[1])")
        }

        self.navigationController?.pushViewController(resultVC, animated: true)
    }

    func presentToResultVC() {
        guard let resultVC = self.storyboard?.instantiateViewController(withIdentifier: "ResultVC") as? ResultVC else {return}
        resultVC.email = idText
        resultVC.password = passwordText
        self.present(resultVC, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ViewController: GetDataProtocol {
    func getLoginData(email: String, password: String) {
        print("받아온 email : \(email), 받아온 password : \(password)")
    }
}
