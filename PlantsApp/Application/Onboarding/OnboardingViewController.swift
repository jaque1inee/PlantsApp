//
//  ViewController.swift
//  SecundProjectViewCode
//
//  Created by Jaqueline Oliveira on 25/11/22.
//

import UIKit

class OnboardingViewController: UIViewController {

    lazy var container: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Gerencie suas plantas de forma fácil"
        label.textAlignment = .center
        label.font = UIFont(name:"HelveticaNeue-Bold", size: 32)
        label.textColor = .gray
        label.numberOfLines = 0
        return label
        
    }()
    
    lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "ilustraplantas")
        return image
        
    }()
    
    lazy var labelsubtitle: UILabel = {
        let labelsubtitle = UILabel()
        labelsubtitle.translatesAutoresizingMaskIntoConstraints = false
        labelsubtitle.text = "Não esqueça mais de regar suas plantas. Nós cuidamos de lembrar você sempre que precisar."
        labelsubtitle.textAlignment = .center
        labelsubtitle.font = UIFont(name:"HelveticaNeue", size: 14)
        labelsubtitle.textColor = .gray
        labelsubtitle.numberOfLines = 0
        return labelsubtitle
    }()
    
    lazy var buttonNext: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
//        button.backgroundColor = .green
        button.backgroundColor = UIColor(hex: "#32B768")

        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button.setTitle(">", for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createViews()
        createConstraints()
    }
    @objc private func buttonAction() {
        
        let menuVC = RegisterUserViewController()
        self.navigationController?.pushViewController(menuVC, animated: true)
    }
    
    func createViews() {
        view.addSubview(self.container)
        container.addSubview(self.label)
        container.addSubview(self.imageView)
        container.addSubview(self.labelsubtitle)
        container.addSubview(self.buttonNext)
    }
    

    func createConstraints() {
        NSLayoutConstraint.activate([
            self.container.topAnchor.constraint(equalTo: view.topAnchor),
            self.container.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            self.container.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            self.container.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            
            
            self.label.topAnchor.constraint(equalTo: container.topAnchor, constant: 80),
            self.label.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -77),
            self.label.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 77),

            self.imageView.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            self.imageView.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            self.imageView.widthAnchor.constraint(equalToConstant: 280),
            self.imageView.heightAnchor.constraint(equalToConstant: 280),
            
            
            self.labelsubtitle.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -77),
            self.labelsubtitle.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 77),
            self.labelsubtitle.topAnchor.constraint(equalTo: buttonNext.topAnchor, constant: -100),

           
            self.buttonNext.widthAnchor.constraint(equalToConstant: 56),
            self.buttonNext.heightAnchor.constraint(equalToConstant: 56),
            self.buttonNext.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            self.buttonNext.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -56),
        
        ])
    }
}

