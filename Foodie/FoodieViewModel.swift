//
//  FoodieViewModel.swift
//  Foodie
//
//  Created by ANUJ KUMAR on 28/04/24.
//

import Foundation
import CoreData
// View - UI
// Model - data point
// ViewModel - manages the data for view


class FoodieViewModel:ObservableObject {

    let container:NSPersistentContainer
    @Published var savedEntities : [Foodie] = []

      init() {
        container = NSPersistentContainer(name:"FoodieModel")
        container.loadPersistentStores { (description,error) in
            if let error = error {
                print("ERROR LOADING CORE DATA.\(error)")
            }
        }
        fetchFruits()
    }
    func fetchFruits() {
        let request = NSFetchRequest<Foodie>(entityName:"Foodie")

        do {
         savedEntities =  try container.viewContext.fetch(request)
        }
        catch let error {
            print("Error fetching.\(error)")
        }
    }

    func addFruit(text:String){
        let newFruit = Foodie(context:container.viewContext)
        newFruit.name = text
        saveData()
    }

    func deleteFruit(indexSet:IndexSet) {
        guard let index = indexSet.first else { return }
        let entity = savedEntities[index]
        container.viewContext.delete(entity)
        saveData()
    }

    func updateFruit(entity:Foodie){
        let currentName = entity.name ?? ""
        let newName = currentName + "!"
        entity.name = newName
        saveData()
    }

    func saveData() {
        do {
            try  container.viewContext.save()
            fetchFruits()
        }
        catch let error {
            print("Error saving.\(error)")
        }

    }
}
