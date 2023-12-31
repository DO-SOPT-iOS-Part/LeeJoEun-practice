//
//  ResultVC.swift
//  sopt33-1st-seminar
//
//  Created by 이조은 on 2023/10/07.
//

import UIKit


class ResultVC: UIViewController {
    typealias loginData = String
    var loginDataCompletion: (([loginData]) -> Void)? //스트링 타입의 배열을 매개변수로 전달 할거고, 리턴타입은 void다!

    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!

    var email: String = ""
    var password: String = ""
    var delegate: GetDataProtocol?

    private func bindText() {
        self.emailLabel.text = "email : \(email)"
        self.passwordLabel.text = "password : \(password)"
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        bindText()
    }
    

    @IBAction func backButton(_ sender: Any) {
        if let navigationController = self.navigationController {
            navigationController.popViewController(animated: true)
        } else {
            self.dismiss(animated: true)
        }
        delegate?.getLoginData(email: self.email,
                               password: self.password)

        guard let loginDataCompletion else { return }
        loginDataCompletion([email, password])
    }
}
