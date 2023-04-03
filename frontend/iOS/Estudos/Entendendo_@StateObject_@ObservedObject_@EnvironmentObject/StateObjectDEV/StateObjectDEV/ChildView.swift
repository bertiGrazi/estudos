//
//  ChildView.swift
//  StateObjectDEV
//
//  Created by Grazi  Berti on 21/03/23.
//

import SwiftUI

struct ChildView: View {
    @State var text = ""
    
    var body: some View {
        VStack {
            Text("Texto: \(text)")
                .foregroundColor(Color.red)
            TextField("ChildView", text: $text)
                .foregroundColor(Color.red)
                .padding()
                .overlay(<#T##style: ShapeStyle##ShapeStyle#>)
        }
    }
}

struct ChildView_Previews: PreviewProvider {
    static var previews: some View {
        ChildView()
    }
}
