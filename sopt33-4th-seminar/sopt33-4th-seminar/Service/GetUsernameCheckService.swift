//
//  GetUsernameCheckService.swift
//  sopt33-4th-seminar
//
//  Created by 이조은 on 2023/11/11.
//

import Foundation

class GetUsernameCheckService {
    static let shared = GetUsernameCheckService()
    private init() {}

    func makeRequest(username: String) -> URLRequest {
        print("http: \(username)")
        let url = URL(string: "http://3.39.54.196/api/v1/members/check?username=\(username)")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let header = ["Content-Type": "application/json"]
        header.forEach {
            request.addValue($0.value, forHTTPHeaderField: $0.key)
        }
        return request
    }

    func PostRegisterData(username: String) async throws -> UsernameCheckDataModel? {
        do {
            let request = self.makeRequest(username: username)
            let (data, response) = try await URLSession.shared.data(for: request)
            dump(request)
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.responseError
            }
            dump(response)
            return parseUserInfoData(data: data)
        } catch {
            throw error
        }

    }


    private func parseUserInfoData(data: Data) -> UsernameCheckDataModel? {
        do {
            let jsonDecoder = JSONDecoder()
            let result = try jsonDecoder.decode(UsernameCheckDataModel.self, from: data)
            return result
        } catch {
            print(error)
            return nil
        }
    }

    private func configureHTTPError(errorCode: Int) -> Error {
        return NetworkError(rawValue: errorCode)
        ?? NetworkError.unknownError
    }

}
