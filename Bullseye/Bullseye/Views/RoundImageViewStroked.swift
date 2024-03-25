//
//  roundedViews.swift
//  Bullseye
//
//  Created by Sofia Wong on 2/23/24.
//

import SwiftUI

struct RoundImageViewStroked: View {
  var systemName: String
    var body: some View {
      Image(systemName: systemName)
        .font(.title)
        .foregroundColor(Color("TextColor"))
        .frame(width: 56, height: 56)
        .overlay(
        Circle()
          .strokeBorder(Color.blue, lineWidth: Constants.General.strokeWidth))
    }
}

struct RoundImageViewFilled: View {
  var systemName: String
    var body: some View {
      Image(systemName: systemName)
        .font(.title)
        .foregroundColor(Color("TextColor"))
        .frame(width: 56, height: 56)
    }
}


//to make two views at once, one in dark mode:

struct PreviewView: View {
  var body: some View {
    VStack(spacing: 10){
      RoundImageViewStroked(systemName: "arrow.counterclockwise")
      RoundImageViewStroked(systemName: "list.dash")
    }
  }
}
struct roundedViews_Previews: PreviewProvider {
    static var previews: some View {
      PreviewView()
      PreviewView().preferredColorScheme(.dark)
    }
}
