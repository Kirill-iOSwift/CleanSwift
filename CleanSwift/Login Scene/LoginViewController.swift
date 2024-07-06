//
//  LoginViewController.swift
//  CleanSwift
//
//  Created by Кирилл on 05.07.2024.
//

import UIKit

protocol LoginViewControllerProtocol: AnyObject {
	func render(viewModel: LoginModels.ViewModel)
}

class LoginViewController: UIViewController {
	
	private var interactor: LoginInteractorProtocol?
	
	@IBOutlet weak var textFieldLogin: UITextField!
	@IBOutlet weak var textFieldPass: UITextField!
	
	@IBAction func buttonLogin(_ sender: Any) {
		if let email = textFieldLogin.text, let password = textFieldPass.text {
			let request = LoginModels.Request(login: email, password: password)
			interactor?.login(request: request)
		}
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		assembly()
	}
	func assembly() {
		let worker = LoginWorker()
		let presenter = LoginPresenter(viewController: self)
		interactor = LoginInteractor(worker: worker, presenter: presenter)
	}

}

extension LoginViewController: LoginViewControllerProtocol {
	func render(viewModel: LoginModels.ViewModel) {
		
		let alert: UIAlertController
		
		if viewModel.succes {
			alert = UIAlertController(
				title: "Success",
				message: viewModel.userName,
				preferredStyle: .alert
			)
		} else {
			alert = UIAlertController(
				title: "Error",
				message: "",
				preferredStyle: .alert
			)
		}
		
		let action = UIAlertAction(title: "Ok", style: .default)
		alert.addAction(action)
		present(alert, animated: true, completion: nil)
	}
}
