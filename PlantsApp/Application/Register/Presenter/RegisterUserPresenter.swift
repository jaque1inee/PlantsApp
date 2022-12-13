//
//  RegisterUserPresent.swift
//  SecundProjectViewCode
//
//  Created by Jaqueline Oliveira on 29/11/22.
//

import Foundation
import CoreData

protocol RegisterUserPresenterDelegate: AnyObject {
    func didCreatedUser()
    func didFailureCreatingUser(error: String)
}

class RegisterUserPresenter {
    
    weak var delegate: RegisterUserPresenterDelegate?
    var dataManager = DataManager()
    
    func createUser(name: String) {
        let managedContext = dataManager.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "User", in: managedContext)!
        let user = NSManagedObject(entity: entity, insertInto: managedContext)
        
        user.setValue(name, forKey: "name")
        
//        user.setValue(name, forKey: "name")
//        user.setValue(password, forKey: "password")
        
        do {
            try managedContext.save()
            self.delegate?.didCreatedUser()
            print("Nome salvo")
            
        } catch let error as NSError {
            
            self.delegate?.didFailureCreatingUser(error: "Erro ao criar usuário. \(error), \(error.userInfo)")
        }
    }
    
    
}


