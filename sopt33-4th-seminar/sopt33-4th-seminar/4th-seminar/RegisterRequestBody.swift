//
//  RegisterRequestBody.swift
//  sopt33-4th-seminar
//
//  Created by 이조은 on 2023/11/11.
//

import Foundation

struct RegisterRequestBody: Codable {
    let username: String
    let password: String
    let nickname: String
}
