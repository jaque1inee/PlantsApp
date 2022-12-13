//
//  RegisterPlant.swift
//  PlantsApp
//
//  Created by Jaqueline Oliveira on 04/12/22.
//

import Foundation

class RegisterPlantPresenter {

    var database = DataBase.shared
    
    func register(plant: Plant) {

        database.myPlants.append(plant)
    }
}

