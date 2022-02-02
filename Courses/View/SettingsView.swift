//
//  SettingsView.swift
//  Courses
//
//  Created by Esther Alcoceba Gutiérrez de León on 2/2/22.
//

import SwiftUI

struct SettingsView: View {
    
    private var sortingOrders = ["Alfabéticamente", "Los favoritos al inicio", "Los comprados al inicio"]
    
    @State private var selectedOrder = 0
    @State private var showPurchasedOnly = false
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
                        Text("Mostrar cursos comprados")
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
        }.navigationTitle("Configuración")
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
