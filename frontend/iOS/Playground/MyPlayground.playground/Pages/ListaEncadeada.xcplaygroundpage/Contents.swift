//: [Previous](@previous)

import Foundation

public class RepresentaCadaElementoDaLista {
    var armazenaOsValoresDaNossaLista: Int
    weak var ponteiroQueIformaOElementeAnterior: RepresentaCadaElementoDaLista?
    var ponteiroQueInformaOProximoElemento: RepresentaCadaElementoDaLista?
    
    init(armazenaOsValoresDaNossaLista: Int) {
        self.armazenaOsValoresDaNossaLista = armazenaOsValoresDaNossaLista
    }
}
