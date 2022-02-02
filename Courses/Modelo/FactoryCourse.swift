//
//  FactoryCourse.swift
//  Courses
//
//  Created by Esther Alcoceba Gutiérrez de León on 2/2/22.
//

import Foundation

struct CourseFactory{
    static var courses = [
    
        Course(name: "Curso de fotografía para principiantes", image: "cursoFotografia", pricelevel: 2, featured: false, purchased: true),
        Course(name: "Curso de video para principiantes", image: "cursoVideo", pricelevel: 1, featured: false, purchased: false),
        Course(name: "Curso de sonido para principiantes", image: "cursoSonido", pricelevel: 4, featured: false, purchased: false),
        Course(name: "Curso de fauna marina", image: "cursoMar", pricelevel: 3, featured: false, purchased: true),
        Course(name: "Curso de fauna selvática", image: "cursoSelva", pricelevel: 2, featured: true, purchased: true),
        Course(name: "Curso de fauna sabánica", image: "cursoSabana", pricelevel: 1, featured: false, purchased: false)
    ]
}
