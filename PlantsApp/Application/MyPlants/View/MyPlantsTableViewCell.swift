//
//  MyPlantsTableViewCell.swift
//  PlantsApp
//
//  Created by Jaqueline Oliveira on 01/12/22.
//

import UIKit

class MyPlantsTableViewCell: UITableViewCell {
    
    lazy var container: UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    lazy var myImagePlant: UIImageView = {
        let imagePlant = UIImageView()
        imagePlant.translatesAutoresizingMaskIntoConstraints = false
        imagePlant.contentMode = .scaleAspectFit
        imagePlant.layer.shadowColor = UIColor.lightGray.cgColor
        imagePlant.layer.shadowOpacity = 10
        imagePlant.layer.shadowOffset = CGSize.zero
        imagePlant.layer.shadowRadius = 5
        
        return imagePlant
    }()
    
    lazy var myNamePlant: UILabel = {
        let mynamePlant = UILabel()
        mynamePlant.translatesAutoresizingMaskIntoConstraints = false
        mynamePlant.textColor = .lightGray
        return mynamePlant
    }()
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupViewCell(plant: Plant){
        createViews()
        createConstraints()
        myImagePlant.image = plant.plantImage
        myNamePlant.text = plant.name
    }
    
    
    func createViews() {
        contentView.addSubview(self.container)
        container.addSubview(self.myImagePlant)
        container.addSubview(self.myNamePlant)
    }
    
    func createConstraints() {
        NSLayoutConstraint.activate([
            
            self.container.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            self.container.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            self.container.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            self.container.topAnchor.constraint(equalTo: contentView.topAnchor),
            
            self.myImagePlant.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20),
            self.myImagePlant.widthAnchor.constraint(equalToConstant: 80),
            self.myImagePlant.heightAnchor.constraint(equalToConstant: 80),
            self.myImagePlant.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            
            self.myNamePlant.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -40),
            self.myNamePlant.topAnchor.constraint(equalTo: container.topAnchor, constant: 10),
            self.myNamePlant.centerYAnchor.constraint(equalTo: container.centerYAnchor)
        ])
    }
}
