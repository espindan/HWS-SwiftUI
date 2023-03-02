//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Danny Espinoza Sanchez on 2/21/23.
//

import SwiftUI

struct ContentView: View {
    
    let motto1 = Text("Draco dormiens")
    let motto2 = Text("nunquam titillandus")
    
    var motto3: some View {
        VStack{
            motto1.foregroundColor(.red)
            motto2.foregroundColor(.blue)
        }
    }
    
    var body: some View {
        GridStack(rows: 4, columns: 4) { row, col in
//            HStack{
           
                Image(systemName: "\(row * 4 + col).circle")
                Text("R\(row) C\(col)")
          
                
//            }.padding(5)
           
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    @ViewBuilder let content: (Int, Int) -> Content
    
    var body: some View {
        VStack {
            ForEach(0..<rows, id: \.self) { row in // \.self
                HStack {
                    ForEach(0..<columns, id: \.self) { column in
                        content(row, column)
                    }
                }
            }
        }
    }
}


