//
//  LoginInteractor.swift
//  CleanSwift
//
//  Created by Кирилл on 05.07.2024.
//

import Foundation

protocol LoginDataStoreProtocol {
	var email: String { get set }
	var password: String { get set }
}

protocol LoginInteractorProtocol {
	func login(request: LoginModels.Request)
}

class LoginInteractor: LoginInteractorProtocol {
	private var worker: LoginWorkerProtocol
	private var presenter: LoginPresenterProtocol?
	
	init(worker: LoginWorkerProtocol, presenter: LoginPresenterProtocol) {
		self.worker = worker
		self.presenter = presenter
	}
	
	func login(request: LoginModels.Request) {
		let result = worker.login(login: request.login, password: request.password)
		
		let response = LoginModels.Responce(
			login: result.login,
			lastLoginData: result.lastLoginDate,
			success: result.success == 1
		)
		presenter?.present(responce: response)
	}
	
}
