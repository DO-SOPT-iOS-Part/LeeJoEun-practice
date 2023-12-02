//
//  PanGeusture.swift
//  sopt33-4th-seminar
//
//  Created by 이조은 on 11/25/23.
//

import UIKit
import SnapKit
import Then

class PanGestureVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white

        self.setLayout()

    }

    private func setLayout() {
        self.view.addSubview(imageView)
        imageView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.width.height.equalTo(100)
        }
    }


    @objc private func didImageViewMoved(_ sender: UIPanGestureRecognizer) {
        let transition = sender.translation(in: imageView)
        let changedX = imageView.center.x + transition.x
        let changedY = imageView.center.y + transition.y
        self.imageView.center = .init(x: changedX,
                                     y: changedY)

        // MARK: - translation 값을 초기화 해주자!!!!!!!!!!!
        // 이미지가 쇽 사라지는 문제를 해결하기 위해
        sender.setTranslation(.zero, in: imageView)
    }


    private lazy var imageView = UIImageView(image: UIImage(named: "apple")).then {
        let gesture = UIPanGestureRecognizer(target: self,
                                             action: #selector(didImageViewMoved(_:)))
        $0.addGestureRecognizer(gesture)
        $0.isUserInteractionEnabled = true
    }

}
