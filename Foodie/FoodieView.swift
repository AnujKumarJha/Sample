//
//  FoodieView.swift
//  Foodie
//
//  Created by ANUJ KUMAR on 28/04/24.
//

import SwiftUI

struct FoodieView: View {

    @StateObject var vm = FoodieViewModel()
    @State var NametextField:String = ""
    @State var RestextField:String = ""
    var body: some View {
        NavigationStack {
            VStack(spacing:20) {
                TextField("Name", text:$NametextField)
                    .font(.headline)
                    .frame(height: 55)
                    .background(Color(.white))
                    .cornerRadius(10)
                    .padding(.horizontal)
                TextField("Restaurant Type", text:$RestextField)
                    .font(.headline)
                    .frame(height: 55)
                    .background(Color(.white))
                    .cornerRadius(10)
                    .padding(.horizontal)

                Button(action: {
                    guard !NametextField.isEmpty else { return }
                    vm.addFruit(text:NametextField)
                    NametextField = ""

                    guard !RestextField.isEmpty else { return }
                    vm.addFruit(text:RestextField)
                    RestextField = ""
                }, label: {
                         Text("ADD")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height:55)
                        .frame(maxWidth:.infinity)
                        .background(Color(.systemPink))
                        .cornerRadius(10)
                })
                .padding(.horizontal)
            }
           
        }

    }
    }


#Preview {
    FoodieView()
}
