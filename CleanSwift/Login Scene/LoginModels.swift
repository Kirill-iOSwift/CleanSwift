//
//  LoginModels.swift
//  CleanSwift
//
//  Created by Кирилл on 05.07.2024.
//

import Foundation

enum LoginModels {
	
	struct Request {
		var login: String
		var password: String
	}
	
	struct Responce {
		var login: String
		var lastLoginData: Date
		var success: Bool
	}
	
	struct ViewModel {
		var userName: String
		var lastLoginDate: String
		var succes: Bool
	}
}
