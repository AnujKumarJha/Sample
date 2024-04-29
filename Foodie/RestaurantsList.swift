//
//  RestaurantsList.swift
//  Foodie
//
//  Created by ANUJ KUMAR on 28/04/24.
//

import SwiftUI

struct RestaurantsList: View {
    @StateObject var vm = FoodieViewModel()
    @State private var filter = 0

    var body: some View {
        NavigationStack() {
            VStack {
                Picker("What is your favorite color?", selection: $filter) {
                    Text("Avg Rating").tag(0)
                    Text("Name").tag(1)
                    Text("Most Recent Review").tag(2)
                }
                .pickerStyle(.segmented)


            }
            List{
                ForEach(vm.savedEntities) {
                    entity in
                    Text(entity.name ?? "NO NAME")
                        .onTapGesture {
                            vm.updateFruit(entity: entity)
                        }
                }
                .onDelete(perform:vm.deleteFruit)
            }

            .listStyle(PlainListStyle())
            .navigationTitle("Foodie")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing:NavigationLink(destination:FoodieView(), label: { 
                Image(systemName:"plus")
            }))
        }



    }


}

#Preview {
    RestaurantsList()
}
