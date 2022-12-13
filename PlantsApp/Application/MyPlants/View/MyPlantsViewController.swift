//
//  MyPlantsViewController.swift
//  PlantsApp
//
//  Created by Jaqueline Oliveira on 01/12/22.
//

import UIKit

class MyPlantsViewController: UIViewController, MyPlantsPresenterDelegate {
    
    var presenter: MyPlantsPresenter = MyPlantsPresenter()
    
    lazy var container: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        
        return view
    }()
    
    lazy var titleMyPlants: UILabel  = {
        let titleMyPlants = UILabel()
        titleMyPlants.translatesAutoresizingMaskIntoConstraints = false
        titleMyPlants.textAlignment = .left
        titleMyPlants.font = UIFont(name:"HelveticaNeue-Bold", size: 28)
        titleMyPlants.textColor = .white
        titleMyPlants.numberOfLines = 0
        titleMyPlants.text = "Minhas \nPlantinhas"
        
        return titleMyPlants
    }()
    
    lazy var imageUser: UIImageView = {
        let imageUser = UIImageView()
        imageUser.translatesAutoresizingMaskIntoConstraints = false
        imageUser.backgroundColor = .gray
        imageUser.layer.cornerRadius = 30
        imageUser.layer.masksToBounds = true
        imageUser.contentMode = .scaleAspectFill
        imageUser.image = UIImage(named: "user")
        self.view.addSubview(imageUser)

        return imageUser
    }()
    
    lazy var myPlantsTableView: UITableView = {
        let myPlantsTableView = UITableView(frame: .zero)
        myPlantsTableView.translatesAutoresizingMaskIntoConstraints = false
        myPlantsTableView.register(MyPlantsTableViewCell.self, forCellReuseIdentifier: "MyPlantsTableViewCell")
        
        return myPlantsTableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        createViews()
        createConstraints()
        myPlantsTableView.delegate = self
        myPlantsTableView.dataSource = self
        presenter.delegate = self
        presenter.getMyPlantList()
        
    }

    
    func createViews() {
        view.addSubview(self.container)
        container.addSubview(self.titleMyPlants)
        container.addSubview(self.imageUser)
        container.addSubview(self.myPlantsTableView)
    }
    
    func createConstraints() {
        NSLayoutConstraint.activate([
            
            
            self.container.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            self.container.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            self.container.topAnchor.constraint(equalTo: view.topAnchor),
            self.container.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            self.titleMyPlants.topAnchor.constraint(equalTo: container.topAnchor, constant: 100),
            self.titleMyPlants.trailingAnchor.constraint(equalTo: imageUser.trailingAnchor, constant: -100),
            self.titleMyPlants.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20),
            
            
            self.imageUser.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -33),
            self.imageUser.topAnchor.constraint(equalTo: container.topAnchor, constant: 100),
            self.imageUser.widthAnchor.constraint(equalToConstant: 60),
            self.imageUser.heightAnchor.constraint(equalToConstant: 60),
            
            self.myPlantsTableView.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            self.myPlantsTableView.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            self.myPlantsTableView.topAnchor.constraint(equalTo: imageUser.topAnchor, constant: 80),
            self.myPlantsTableView.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: 50)
        ])
    }
    
    func didGetMyPlants() {
        
        myPlantsTableView.reloadData()
    }
}

extension MyPlantsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return presenter.plantList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyPlantsTableViewCell", for: indexPath) as! MyPlantsTableViewCell
        let plant = presenter.plantList[indexPath.row]
        
        cell.setupViewCell(plant: plant)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
