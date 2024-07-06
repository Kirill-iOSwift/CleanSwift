//
//  LoginWorker.swift
//  CleanSwift
//
//  Created by Кирилл on 05.07.2024.
//

import Foundation

public struct LoginDTO {
	var success: Int
	var login: String
	var lastLoginDate: Date
}

protocol LoginWorkerProtocol {
	func login(login: String, password: String) -> LoginDTO
}

class LoginWorker: LoginWorkerProtocol {
	func login(login: String, password: String) -> LoginDTO {
		if login == "login" && password == "123" {
			return LoginDTO(
				success: 1,
				login: login,
				lastLoginDate: Date()
			)
		} else {
			return LoginDTO(
				success: 0,
				login: login,
				lastLoginDate: Date()
			)
		}
	}
}
