//
//  MenuTableViewCell.swift
//  SecundProjectViewCode
//
//  Created by Jaqueline Oliveira on 26/11/22.
//

import UIKit

class MenuCollectionViewCell: UICollectionViewCell {
    
    
    let localPlant = ["Quarto", "Cozinha", "Sala", "Banheiro", "Varanda"]
    
    lazy var container: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(hex: "DAF2E4")
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Local"
        label.font = UIFont(name:"HelveticaNeue", size: 12)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textColor = UIColor(hex: "2B7A4B")
        label.numberOfLines = 0
    
        return label
        
    }()
    
    func setupViewCell(){
        createViews()
        createConstraints()
        titleLabel.text = localPlant.last
    }
    
    func createViews() {
        contentView.addSubview(container)
        container.addSubview(titleLabel)
    }
    
    func createConstraints() {
        NSLayoutConstraint.activate([
            
            self.container.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            self.container.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            self.container.topAnchor.constraint(equalTo: contentView.topAnchor),
            self.container.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            self.container.widthAnchor.constraint(equalToConstant: 30),
            self.container.heightAnchor.constraint(equalToConstant: 30),
            
            self.titleLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: 5),
            self.titleLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: -5),
            self.titleLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: 5),
            self.titleLabel.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -5)

        ])
    }
}
