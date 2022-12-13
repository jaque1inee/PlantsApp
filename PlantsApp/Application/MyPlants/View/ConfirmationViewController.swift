//
//  PlantCadastradaViewController.swift
//  PlantsApp
//
//  Created by Jaqueline Oliveira on 01/12/22.
//

import UIKit

class ConfirmationViewController: UIViewController {
    
    lazy var container: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        
        return view
    }()
    
    lazy var emojiView: UIImageView = {
        let emojiView = UIImageView()
        emojiView.translatesAutoresizingMaskIntoConstraints = false
        emojiView.image =  UIImage(named: "emoji")
        
        return emojiView
    }()
    
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Tudo certo"
        titleLabel.font = UIFont(name:"HelveticaNeue-Bold", size: 22)
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        titleLabel.textColor = .darkGray
        
        return titleLabel
    }()
    
    lazy var subtitleLabel: UILabel = {
        let subtitleLabel = UILabel()
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.text = "Fique tranquilo que sempre vamos lembrar você de cuidar da sua plantinha com bastante amor."
        subtitleLabel.textAlignment = .center
        subtitleLabel.font = UIFont(name:"HelveticaNeue", size: 16)
        subtitleLabel.numberOfLines = 0
        subtitleLabel.textColor = .darkGray
        
        return subtitleLabel
    }()
    
    lazy var confirmarButton: UIButton = {
        let confirmarButton = UIButton()
        confirmarButton.translatesAutoresizingMaskIntoConstraints = false
        confirmarButton.backgroundColor = UIColor(hex: "#32B768")
        confirmarButton.layer.cornerRadius = 20
        confirmarButton.addTarget(self, action: #selector(goMyplants), for: .touchUpInside)
        confirmarButton.setTitle("Muito obrigado!", for: .normal)
        confirmarButton.tag = 1
        return confirmarButton
    }()
    
    lazy var backMenuButton: UIButton = {
        let backMenuButton = UIButton()
        backMenuButton.translatesAutoresizingMaskIntoConstraints = false
        backMenuButton.backgroundColor = .gray
        backMenuButton.layer.cornerRadius = 20
        backMenuButton.addTarget(self, action: #selector(backMenu), for: .touchUpInside)
        backMenuButton.setTitle("Menu Principal", for: .normal)
        backMenuButton.tag = 1
        return backMenuButton
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createViews()
        createConstraints()

    }
    
    
    @objc private func goMyplants() {
        let menuVC = MyPlantsViewController()
        let nagVC = UINavigationController(rootViewController: menuVC)
        nagVC.modalPresentationStyle = .automatic
        present(nagVC, animated: true)
    }
      
    @objc private func backMenu() {
        let menuVC = MenuViewController()
        let nagVC = UINavigationController(rootViewController: menuVC)
        nagVC.modalPresentationStyle = .fullScreen
        present(nagVC, animated: true)
    }

    func createViews() {
        view.addSubview(self.container)
        container.addSubview(self.emojiView)
        container.addSubview(self.titleLabel)
        container.addSubview(self.subtitleLabel)
        container.addSubview(self.confirmarButton)
        container.addSubview(self.backMenuButton)
    }
    
    func createConstraints(){
        NSLayoutConstraint.activate([
            
            self.container.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            self.container.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            self.container.topAnchor.constraint(equalTo: view.topAnchor),
            self.container.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            self.emojiView.topAnchor.constraint(equalTo: container.topAnchor, constant: 209),
            self.emojiView.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            self.emojiView.widthAnchor.constraint(equalToConstant: 40),
            self.emojiView.heightAnchor.constraint(equalToConstant: 40),
            
            self.titleLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -20),
            self.titleLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20),
            self.titleLabel.topAnchor.constraint(equalTo: emojiView.topAnchor, constant: 60),
            
            self.subtitleLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -40),
            self.subtitleLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 40),
            self.subtitleLabel.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 40),
            
            self.confirmarButton.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -72),
            self.confirmarButton.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 72),
            self.confirmarButton.topAnchor.constraint(equalTo: subtitleLabel.topAnchor, constant: 100),
            self.confirmarButton.widthAnchor.constraint(equalToConstant: 232),
            self.confirmarButton.heightAnchor.constraint(equalToConstant: 56),
            
            self.backMenuButton.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -72),
            self.backMenuButton.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 72),
            self.backMenuButton.topAnchor.constraint(equalTo: confirmarButton.topAnchor, constant: 80),
            self.backMenuButton.widthAnchor.constraint(equalToConstant: 232),
            self.backMenuButton.heightAnchor.constraint(equalToConstant: 56),
            
        
        ])
    }
}
