//
//  MyPlantsPresenter.swift
//  PlantsApp
//
//  Created by Jaqueline Oliveira on 12/12/22.
//

import Foundation

protocol MyPlantsPresenterDelegate: AnyObject {
    
    func didGetMyPlants()
}

class MyPlantsPresenter {
    
    private var database = DataBase.shared
    weak var delegate: MyPlantsPresenterDelegate?
    var plantList: [Plant] = []
    
    func getMyPlantList() {
        
        plantList = database.myPlants
        delegate?.didGetMyPlants()
    }
    
    func removePlantFromList(at index: Int) {
        
        database.myPlants.remove(at: index)
        plantList.remove(at: index)
    }
}
