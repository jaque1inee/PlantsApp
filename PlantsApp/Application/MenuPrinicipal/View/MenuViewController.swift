//
//  MenuViewController.swift
//  SecundProjectViewCode
//
//  Created by Jaqueline Oliveira on 26/11/22.
//

import UIKit

class MenuViewController: UIViewController {

    var database = DataBase.shared
    
    let localPlant = ["Quarto", "Cozinha", "Sala", "Banheiro", "Varanda"]

    lazy var container: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
        
    }()
    
    lazy var userNameLabel: UILabel  = {
        let userNameLabel = UILabel()
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        userNameLabel.textAlignment = .left
        userNameLabel.font = UIFont(name:"HelveticaNeue-Bold", size: 22)
        userNameLabel.textColor = .gray
        userNameLabel.numberOfLines = 0
        print(userNameLabel)
        return userNameLabel
        
    }()
    
    lazy var imageUser: UIImageView = {
        let imageUser = UIImageView()
        imageUser.translatesAutoresizingMaskIntoConstraints = false
        imageUser.backgroundColor = .gray
        imageUser.layer.cornerRadius = 30
        imageUser.layer.masksToBounds = true
        imageUser.contentMode = .scaleAspectFill
        imageUser.image = UIImage(named: "user")

        return imageUser
        
    }()
    
    lazy var subtitleLabel: UILabel  = {
        let subtitleLabel = UILabel()
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.text = "Em qual ambiente você quer colocar sua planta?"
        subtitleLabel.textAlignment = .left
        subtitleLabel.font = UIFont(name:"HelveticaNeue", size: 18)
        subtitleLabel.textColor = .gray
        subtitleLabel.numberOfLines = 0
        return subtitleLabel
        
    }()
    
    lazy var containerMenuCollectionView: UIView = {
        let containerMenuCollectionView = UIView()
        containerMenuCollectionView.translatesAutoresizingMaskIntoConstraints = false
        containerMenuCollectionView.backgroundColor = .white
        return containerMenuCollectionView
        
    }()
    
    lazy var menuCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let menuCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        menuCollectionView.translatesAutoresizingMaskIntoConstraints = false
        menuCollectionView.register(MenuCollectionViewCell.self, forCellWithReuseIdentifier: "MenuCollectionViewCell")
        menuCollectionView.backgroundColor = .white
        menuCollectionView.showsVerticalScrollIndicator = false
        
        return menuCollectionView
    }()
    
    lazy var containerPlantasCollectionView: UIView = {
        let containerPlantasCollectionView = UIView()
        containerPlantasCollectionView.translatesAutoresizingMaskIntoConstraints = false
        containerPlantasCollectionView.backgroundColor = .white
        return containerPlantasCollectionView
        
    }()
    
    lazy var plantasCollecctionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let plantasCollecctionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        plantasCollecctionView.translatesAutoresizingMaskIntoConstraints = false
        plantasCollecctionView.register(PlantasCollectionViewCell.self, forCellWithReuseIdentifier: "PlantasCollectionViewCell")
        plantasCollecctionView.backgroundColor = .white
        plantasCollecctionView.backgroundColor = .white
        
        return plantasCollecctionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createViews()
        createConstraints()
        menuCollectionView.dataSource = self
        menuCollectionView.delegate = self
        plantasCollecctionView.dataSource = self
        plantasCollecctionView.delegate = self
        userNameLabel.text = "Olá,\n\(database.userName )"
       
        
    }
    
    func createViews() {
        view.addSubview(container)
        container.addSubview(self.userNameLabel)
        container.addSubview(self.imageUser)
        container.addSubview(self.subtitleLabel)
        container.addSubview(self.containerMenuCollectionView)
        containerMenuCollectionView.addSubview(self.menuCollectionView)
        container.addSubview(self.containerPlantasCollectionView)
        containerPlantasCollectionView.addSubview(self.plantasCollecctionView)
    }
    
    func createConstraints() {
        NSLayoutConstraint.activate([
            
            self.container.topAnchor.constraint(equalTo: view.topAnchor ),
            self.container.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            self.container.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            self.container.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            
            self.userNameLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: 80),
            self.userNameLabel.trailingAnchor.constraint(equalTo: imageUser.trailingAnchor, constant: -100),
            self.userNameLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 33),
            
            
            
            self.subtitleLabel.topAnchor.constraint(equalTo: userNameLabel.topAnchor, constant: 70),
            self.subtitleLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -125),
            self.subtitleLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 33),
            
            
            
            self.imageUser.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -33),
            self.imageUser.topAnchor.constraint(equalTo: container.topAnchor, constant: 85),
            self.imageUser.widthAnchor.constraint(equalToConstant: 60),
            self.imageUser.heightAnchor.constraint(equalToConstant: 60),
            
            self.containerMenuCollectionView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 32),
            self.containerMenuCollectionView.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -32),
            self.containerMenuCollectionView.topAnchor.constraint(equalTo: subtitleLabel.topAnchor, constant: 60),
            self.containerMenuCollectionView.heightAnchor.constraint(equalToConstant: 30),
            
            self.menuCollectionView.leadingAnchor.constraint(equalTo: containerMenuCollectionView.leadingAnchor),
            self.menuCollectionView.trailingAnchor.constraint(equalTo: containerMenuCollectionView.trailingAnchor),
            self.menuCollectionView.topAnchor.constraint(equalTo: containerMenuCollectionView.topAnchor),
            self.menuCollectionView.bottomAnchor.constraint(equalTo: containerMenuCollectionView.bottomAnchor),
            self.menuCollectionView.heightAnchor.constraint(equalToConstant: 10),
            
            self.containerPlantasCollectionView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 32),
            self.containerPlantasCollectionView.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -32),
            self.containerPlantasCollectionView.topAnchor.constraint(equalTo: containerMenuCollectionView.topAnchor, constant: 50),
            self.containerPlantasCollectionView.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: 15),
            
            self.plantasCollecctionView.leadingAnchor.constraint(equalTo: containerPlantasCollectionView.leadingAnchor, constant: 0),
            self.plantasCollecctionView.trailingAnchor.constraint(equalTo: containerPlantasCollectionView.trailingAnchor, constant: 0),
            self.plantasCollecctionView.topAnchor.constraint(equalTo: containerPlantasCollectionView.topAnchor, constant: 10),
            self.plantasCollecctionView.bottomAnchor.constraint(equalTo: containerPlantasCollectionView.bottomAnchor, constant: 10)
            
        ])
    }
}

extension MenuViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == menuCollectionView {
            return localPlant.count
        }
        else {
            return database.imageMenu.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == menuCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuCollectionViewCell", for: indexPath) as? MenuCollectionViewCell else {return UICollectionViewCell()}
            cell.setupViewCell()
            cell.titleLabel.text = (localPlant[indexPath.row])
            return cell
            
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlantasCollectionViewCell", for: indexPath) as? PlantasCollectionViewCell else  {return UICollectionViewCell()}
            cell.setupViewCell(with: database.imageMenu [indexPath.row])
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == menuCollectionView {
            collectionView.deselectItem(at: indexPath, animated: true)
    

        } else {
            let menuVC = DetailsPlantViewController()
            menuVC.modalPresentationStyle = .fullScreen
            menuVC.plant = database.imageMenu[indexPath.row]
            self.navigationController?.pushViewController(menuVC, animated: true)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == menuCollectionView {
            
            return CGSize(width: 80.0, height: 40)
            
        } else {

            return CGSize(width: 148, height: 154)
        }
    }
}

