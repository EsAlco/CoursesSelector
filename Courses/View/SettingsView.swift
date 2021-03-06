//
//  SettingsView.swift
//  Courses
//
//  Created by Esther Alcoceba Gutiérrez de León on 2/2/22.
//

import SwiftUI

struct SettingsView: View {
    
    private var sortingOrders = ["Alfabéticamente", "Los favoritos al inicio", "Los comprados al inicio"]
    
    @Environment (\.presentationMode) var presentationMode
    
    @State private var selectedOrder = 0
    @State private var showPurchasedOnly = false
    @State private var showFeaturedOnly = false
    @State private var maxPrice = 5{
        didSet{
            if maxPrice > 5{
                maxPrice = 5
            }
            if maxPrice < 1{
                maxPrice = 1
            }
        }
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("ORDENAR LOS CURSOS")){
                    Picker(selection: $selectedOrder, label: Text("Tipos de ordenación")){
                        ForEach(0..<sortingOrders.count, id:\.self){
                            Text(self.sortingOrders[$0])
                        }
                    }
                }
                Section(header: Text("FILTRAR LOS CURSOS")){
                    Toggle(isOn:$showPurchasedOnly){
                        Text("Mostrar sólo comprados")
                        Image(systemName: "checkmark")
                    }
                    Toggle(isOn:$showFeaturedOnly){
                        Text("Mostrar sólo favoritos")
                        Image(systemName: "star")
                    }
                    Stepper(onIncrement: {
                        self.maxPrice += 1
                    }, onDecrement: {
                        self.maxPrice -= 1
                    }){
                        Text("Mostrar \(String(repeating: "€", count: maxPrice)) o menos")
                    }
                }
            }
            .navigationTitle("Configuración")
            .navigationBarItems(
                leading:
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }, label:{
                        Image(systemName: "xmark.shield")
                            .font(.title)
                            .foregroundColor(.red)
                    }),
                trailing:
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                }, label:{
                    Image(systemName: "checkmark.shield")
                        .font(.title)
                        .foregroundColor(.green)
                })
                    
            )
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
