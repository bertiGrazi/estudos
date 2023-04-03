//
//  ContentView.swift
//  StateObjectDEV
//
//  Created by Grazi  Berti on 21/03/23.
//

import SwiftUI

struct ParentView: View {
    // armazenar as variáveis e suas mudanças
    //armazenas os conteudos, valores das variaveis de um tipo especifico.
    @State var text = ""
    
    var body: some View {
        VStack {
            TextField("Digite o teste", text: $text)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(style: .init(lineWidth: 1))
                )
        }
    }
}

struct ParentView_Previews: PreviewProvider {
    static var previews: some View {
        ParentView()
    }
}
