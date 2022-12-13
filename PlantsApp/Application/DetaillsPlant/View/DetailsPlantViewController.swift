//
//  PlantDetailsViewControler.swift
//  PlantsApp
//
//  Created by Jaqueline Oliveira on 05/12/22.
//

import Foundation
import UIKit

class DetailsPlantViewController: UIViewController {
    
    var presenter: RegisterPlantPresenter = RegisterPlantPresenter()
    
    var plant: Plant?

    var namePlant: [ MyPlants ] = []
    
    
    lazy var container: UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = .white
        return container
    }()
    lazy var plantImage: UIImageView = {
        let plantImage =  UIImageView()
        plantImage.translatesAutoresizingMaskIntoConstraints = false
        plantImage.contentMode = .scaleAspectFit
        plantImage.layer.shadowColor = UIColor.lightGray.cgColor
        plantImage.layer.shadowOpacity = 10
        plantImage.layer.shadowOffset = CGSize.zero
        plantImage.layer.shadowRadius = 5
        
        self.view.addSubview(plantImage)
        return plantImage
    }()
    
    lazy var plantNameLabel: UILabel = {
        let plantNameLabel = UILabel()
        plantNameLabel.translatesAutoresizingMaskIntoConstraints = false
//        plantNameLabel.text = "Name Plant"
        plantNameLabel.font = UIFont(name:"HelveticaNeue-Bold", size: 22)
        plantNameLabel.numberOfLines = 0
        plantNameLabel.textColor = .darkGray
        
        return plantNameLabel
    }()
    
    lazy var descriptionPlant: UILabel = {
        let descriptionPlant = UILabel()
        descriptionPlant.translatesAutoresizingMaskIntoConstraints = false
        descriptionPlant.numberOfLines =  0
        descriptionPlant.font = UIFont(name:"HelveticaNeue", size: 16)
        descriptionPlant.textAlignment = .justified
        descriptionPlant.adjustsFontSizeToFitWidth = true
        descriptionPlant.textColor = .lightGray
        return descriptionPlant
    }()
    
    
    lazy var cadastrarPlantaButton: UIButton = {
        let cadastrarPlantaButton = UIButton()
        cadastrarPlantaButton.translatesAutoresizingMaskIntoConstraints = false
        cadastrarPlantaButton.backgroundColor = UIColor(hex: "#32B768")
        cadastrarPlantaButton.layer.cornerRadius = 20
        cadastrarPlantaButton.addTarget(self, action: #selector(cadastrarPlant), for: .touchUpInside)
        cadastrarPlantaButton.setTitle("Cadastrar Planta", for: .normal)
        cadastrarPlantaButton.tag = 1
        return cadastrarPlantaButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createViews()
        createConstraints()
        plantImage.image = plant?.plantImage
        plantNameLabel.text = plant?.name
        descriptionPlant.text = plant?.description
    }

    @objc private func cadastrarPlant() {
        if cadastrarPlantaButton.tag == 1 {
            
            guard let plant = plant else { return }
            
            presenter.register(plant: plant)
            let menuVC = ConfirmationViewController()
            self.navigationController?.pushViewController(menuVC, animated: true)
            
        } else {
            print("error")
        }
    }

    func createViews() {
        view.addSubview(self.container)
        container.addSubview(self.plantImage)
        container.addSubview(self.plantNameLabel)
        container.addSubview(self.descriptionPlant)
        container.addSubview(self.cadastrarPlantaButton)
    }
    
    func createConstraints() {
        NSLayoutConstraint.activate([
            
            container.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            container.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            container.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            container.topAnchor.constraint(equalTo: view.topAnchor),
            
            plantImage.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 60),
            plantImage.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -60),
            plantImage.topAnchor.constraint(equalTo: container.topAnchor, constant: 80),
            plantImage.heightAnchor.constraint(equalToConstant: 400),
            plantImage.centerXAnchor.constraint(equalTo: container.centerXAnchor),
//            plantImage.priority = UILayoutPriority(rawValue: 750),

            plantNameLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 32),
            plantNameLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -32),
            plantNameLabel.topAnchor.constraint(equalTo: plantImage.bottomAnchor, constant: 10),
            
            descriptionPlant.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 32),
            descriptionPlant.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -32),
            descriptionPlant.topAnchor.constraint(equalTo: plantNameLabel.bottomAnchor, constant: 10),

            cadastrarPlantaButton.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 32),
            cadastrarPlantaButton.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -32),
            cadastrarPlantaButton.topAnchor.constraint(equalTo: descriptionPlant.bottomAnchor, constant: 10),
            cadastrarPlantaButton.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -50),
            self.cadastrarPlantaButton.widthAnchor.constraint(equalToConstant: 232),
            self.cadastrarPlantaButton.heightAnchor.constraint(equalToConstant: 56)

        ])
    }
}
