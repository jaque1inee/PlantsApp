//
//  PlantasCollectionViewCell.swift
//  SecundProjectViewCode
//
//  Created by Jaqueline Oliveira on 27/11/22.
//

import UIKit

class PlantasCollectionViewCell: UICollectionViewCell {
    
    lazy var container: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(hex: "F0F0F0")
        view.layer.cornerRadius = 10
        return view
    }()
    
    lazy var imagePlanta: UIImageView = {
        let imagePlanta = UIImageView()
        imagePlanta.translatesAutoresizingMaskIntoConstraints = false
        return imagePlanta
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Planta"
        label.font = UIFont(name:"HelveticaNeue", size: 12)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(hex: "52665A")
        label.numberOfLines = 0
        return label
    }()
    
    lazy var blur: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .light)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        return blurView
        
    }()
    
    func setupViewCell(with imageMenu : Plant){
        createViews()
        createConstraints()
        imagePlanta.image = imageMenu.plantImage
        titleLabel.text = imageMenu.name
    }

    
    func createViews() {
        contentView.addSubview(container)
        container.addSubview(blur)
        container.addSubview(imagePlanta)
        container.addSubview(titleLabel)
    }
    
    func createConstraints() {
        NSLayoutConstraint.activate([
            
            self.container.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            self.container.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            self.container.topAnchor.constraint(equalTo: contentView.topAnchor),
            self.container.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            self.container.widthAnchor.constraint(equalToConstant: 200),
            self.container.heightAnchor.constraint(equalToConstant: 250),
            
            
            self.imagePlanta.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -15),
            self.imagePlanta.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 15),
            self.imagePlanta.topAnchor.constraint(equalTo: container.topAnchor, constant: 10),
            self.imagePlanta.bottomAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: -20),
            
            self.titleLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            self.titleLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            self.titleLabel.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -10),
            
            self.blur.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            self.blur.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            self.blur.topAnchor.constraint(equalTo: container.topAnchor),
            self.blur.bottomAnchor.constraint(equalTo: container.topAnchor)
        ])
    }
}
