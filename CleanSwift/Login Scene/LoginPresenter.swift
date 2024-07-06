//
//  LoginPresenter.swift
//  CleanSwift
//
//  Created by Кирилл on 05.07.2024.
//

import Foundation

protocol LoginPresenterProtocol {
	func present(responce: LoginModels.Responce)
}

class LoginPresenter: LoginPresenterProtocol {
	private weak var viewController: LoginViewControllerProtocol?
	
	init(viewController: LoginViewControllerProtocol?) {
		self.viewController = viewController
	}
	
	func present(responce: LoginModels.Responce) {
		let viewModel = LoginModels.ViewModel(
			userName: responce.login,
			lastLoginDate: "\(responce.lastLoginData)",
			succes: responce.success
		)
		viewController?.render(viewModel: viewModel)
	}
	
}
