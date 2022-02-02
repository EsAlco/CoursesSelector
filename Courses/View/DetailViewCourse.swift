//
//  DetailViewCourse.swift
//  Courses
//
//  Created by Esther Alcoceba Gutiérrez de León on 2/2/22.
//

import SwiftUI

struct DetailViewCourse: View {
    
    @Environment (\.presentationMode) var presentationMode
    var courses: Course
    
    var body: some View {
        NavigationView{
            VStack{
                Text(courses.name)
                    .multilineTextAlignment(.center)
                    .font(.system(.title, design: .rounded))
              
                Image(courses.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.horizontal)

                Spacer()
            }
            .overlay(
                VStack{
                    HStack{
                        Spacer()
                        Button (action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }, label: {
                            Image(systemName: "xmark")
                                .font(.headline)
                                .foregroundColor(.black)
                        })
                            .padding(.leading, 20)
                    }
                    .frame(width: 350, height: -20)
                    Spacer()
                }
            )
        }
    }
}

struct DetailViewCourse_Previews: PreviewProvider {
    static var previews: some View {
        DetailViewCourse(courses: Course(name: "Curso de fotografía para principiantes", image: "cursoFotografia", pricelevel: 2, featured: false, purchased: true))
    }
}
