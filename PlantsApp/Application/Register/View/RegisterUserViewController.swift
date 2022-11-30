//
//  RegisterViewController.swift
//  SecundProjectViewCode
//
//  Created by Jaqueline Oliveira on 28/11/22.
//

import UIKit

class RegisterUserViewController: UIViewController {
    
    var presenter: RegisterUserPresenter = RegisterUserPresenter()
    
    
    lazy var container: UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = .white
        return container
    }()
    
    lazy var emojiView: UIImageView = {
        let emojiView = UIImageView()
        emojiView.translatesAutoresizingMaskIntoConstraints = false
        emojiView.backgroundColor = .yellow
        
        return emojiView
    }()
    
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.numberOfLines = 0
        titleLabel.text = "Como podemos chamar você?"
        titleLabel.font = UIFont(name:"HelveticaNeue-Bold", size: 24)
        titleLabel.textAlignment = .center
        titleLabel.textColor = .gray
        return titleLabel
        
    }()
    
    lazy var textFieldUser: UITextField = {
        let textFieldUser = UITextField()
        textFieldUser.translatesAutoresizingMaskIntoConstraints = false
        textFieldUser.borderStyle = .none
        
        let centeredParagraphStyle = NSMutableParagraphStyle()
        centeredParagraphStyle.alignment = .center
        textFieldUser.attributedPlaceholder = NSAttributedString(
            string: "Digite um nome",
            attributes: [.paragraphStyle: centeredParagraphStyle]
        )
        return textFieldUser
    }()
    
    lazy var buttonConfirmar: UIButton = {
        let buttonConfirmar = UIButton()
        buttonConfirmar.translatesAutoresizingMaskIntoConstraints = false
        buttonConfirmar.backgroundColor = UIColor(hex: "#32B768")
        buttonConfirmar.layer.cornerRadius = 20
        buttonConfirmar.addTarget(self, action: #selector(confirmarButton), for: .touchUpInside)
        buttonConfirmar.setTitle("Confirmar", for: .normal)
        return buttonConfirmar
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        creatViews()
        creatConstraints()
        navigationController?.setNavigationBarHidden(true, animated: false)
        presenter.delegate = self
    }
    
    @objc private func confirmarButton() {
        
        
        let menuVC = MenuViewController()
        menuVC.name = textFieldUser.text
        
        if ((menuVC.name?.count) == 0) {
            
            let alertController = UIAlertController(title: "", message: "Digite seu nome", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "OK", style:  UIAlertAction.Style.default) {
                UIAlertAction in
                NSLog("OK Pressed")
            }
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.destructive) {
                UIAlertAction in
                NSLog("Cancel Pressed")
            }
            alertController.addAction(okAction)
            alertController.addAction(cancelAction)

            self.present(alertController, animated: true, completion: nil)
            print("inserir nome")
            
        } else {
            
            let menuVC = MenuViewController()
            menuVC.name = textFieldUser.text
            let nagVC = UINavigationController(rootViewController: menuVC)
            nagVC.modalPresentationStyle = .fullScreen
            present(nagVC, animated: true)
        }
    }
    
    func creatViews() {
        view.addSubview(self.container)
        container.addSubview(self.emojiView)
        container.addSubview(self.titleLabel)
        container.addSubview(self.textFieldUser)
        container.addSubview(self.buttonConfirmar)
        
    }
    
    func creatConstraints() {
        NSLayoutConstraint.activate([
            
            self.container.topAnchor.constraint(equalTo: view.topAnchor),
            self.container.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            self.container.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            self.container.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            
            //            self.emojiView.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: 0),
            //            self.emojiView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 0),
            self.emojiView.topAnchor.constraint(equalTo: container.topAnchor, constant: 126),
            self.emojiView.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            self.emojiView.widthAnchor.constraint(equalToConstant: 40),
            self.emojiView.heightAnchor.constraint(equalToConstant: 40),
            
            
            self.titleLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -50),
            self.titleLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 50),
            self.titleLabel.topAnchor.constraint(equalTo: emojiView.topAnchor, constant: 50),
            self.titleLabel.widthAnchor.constraint(equalToConstant: 64),
            
            
            self.textFieldUser.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -56),
            self.textFieldUser.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 56),
            self.textFieldUser.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 150),
            self.textFieldUser.widthAnchor.constraint(equalToConstant: 263),
            
            
            
            self.buttonConfirmar.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -72),
            self.buttonConfirmar.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 72),
            self.buttonConfirmar.topAnchor.constraint(equalTo: textFieldUser.topAnchor, constant: 40),
            self.buttonConfirmar.widthAnchor.constraint(equalToConstant: 232),
            self.buttonConfirmar.heightAnchor.constraint(equalToConstant: 56)
            
            
        ])
    }
}

extension RegisterUserViewController: RegisterUserPresenterDelegate {
    func didCreatedUser() {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    func didFailureCreatingUser(error: String) {
        print(error)
    }
    
}