//
//  ContentView.swift
//  Courses
//
//  Created by Esther Alcoceba Gutiérrez de León on 2/2/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedCourse: Course?
    
    var body: some View {
        NavigationView{
            VStack{
                List{
                    ForEach(CourseFactory.courses){ Course in
                        ZStack{
                            CourseRoundImageRow(course:  Course)
                            
                                .contextMenu{
                                    
                                    // Favorito
                                    Button {
                                        self.setFeatured(item: Course)
                                    } label: {
                                        HStack{
                                            Text("Destacar")
                                            Image(systemName: "star")
                                        }
                                    }
                                    
                                    //Comprado
                                    Button {
                                        self.setPurchased(item: Course)
                                    } label: {
                                        HStack{
                                            Text("Comprado")
                                            Image(systemName: "checkmark.circle")
                                        }
                                    }

                                    //Eliminado
                                    Button {
                                        self.delete(item: Course)
                                    } label: {
                                        HStack{
                                            Text("Eliminar")
                                            Image(systemName: "trsh")
                                        }
                                    }
                                }
                                .onTapGesture{
                                    self.selectedCourse = Course
                                }
                        }
                    }
                    .onDelete{ (indexSet) in
                        CourseFactory.courses.remove(atOffsets: indexSet)
                    }
                }
                .navigationBarTitle("Cursos formativos")
                
                .sheet(item: self.$selectedCourse){ courses in
                    DetailViewCourse(courses: courses)
                }
            }
        }
    }
    
    // Función de cambiar favoritoa
    private func setFeatured(item course: Course){
        if let idx = CourseFactory.courses.firstIndex(where: {$0.id == course.id}){
            CourseFactory.courses[idx].featured.toggle()
        }
    }
    
    // Función de comprar o no
    private func setPurchased(item course: Course){
        if let idx = CourseFactory.courses.firstIndex(where: {$0.id == course.id}){
            CourseFactory.courses[idx].purchased.toggle()
        }
    }
    
    // Función de eliminar curso
    private func delete(item course: Course){
        if let idx = CourseFactory.courses.firstIndex(where: {$0.id == course.id}){
            CourseFactory.courses.remove(at: idx)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CourseRoundImageRow: View{
    
    var course: Course
    var body: some View{
        HStack{
            Image(course.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 60, height: 60)
                .clipped()
                .cornerRadius(30)

            HStack{
                Text(course.name)
                    .font(.system(.subheadline, design: .rounded))
                Spacer().layoutPriority(-10)
                Text(String(course.pricelevel))
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            //definimos los boolean
            
            if course.featured{
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
            Spacer()
            
            if course.purchased{
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.green)
            }
        }
    }
}
