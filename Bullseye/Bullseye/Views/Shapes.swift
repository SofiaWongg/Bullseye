//
//  Shapes.swift
//  Bullseye
//
//  Created by Sofia Wong on 2/23/24.
//

import SwiftUI

struct Shapes: View {
  
  @State private var wideShapes = true
  var body: some View {
    VStack {
      Circle()
//        .fill(.blue)
        .strokeBorder(Color.red, lineWidth: Constants.General.strokeWidth)
        .background(Color.green)
        .frame(width: wideShapes ? 300: 100, height: 100)
//        .animation(.easeInOut, value: wideShapes)
      Button("Animate") {
        withAnimation{
          wideShapes.toggle()
        }
        
      }
    }
    
  }
}

struct Shapes_Previews: PreviewProvider {
  static var previews: some View {
    Shapes()
  }
}
