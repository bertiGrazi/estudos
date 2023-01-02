//
//  ContentView.swift
//  Phone
//
//  Created by Grazi  Berti on 14/12/22.
//

import SwiftUI

struct ContentView: View {

    var phoneNumber = "718-555-5555"

    var body: some View {
        Button(action: {

            // validation of phone number not included
            let dash = CharacterSet(charactersIn: "-")

            let cleanString =
            phoneNumber.trimmingCharacters(in: dash)

            let tel = "tel://"
            var formattedString = tel + cleanString
            let url: NSURL = URL(string: formattedString)! as NSURL

            UIApplication.shared.open(url as URL)

        }) {
        Text(verbatim: phoneNumber)
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
