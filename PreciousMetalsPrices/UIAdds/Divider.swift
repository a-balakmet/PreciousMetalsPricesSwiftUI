//
//  Divider.swift
//  PreciousMetalsPrices
//
//  Created by Admin on 20.09.2021.
//

import SwiftUI

struct Divider: View {
    
    var body: some View {
        HStack {
            Rectangle()
                .fill(Color("PrimaryColor"))
                .frame(width: 0.5, height: 17)
                .edgesIgnoringSafeArea(.vertical)
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
        }
        
    }
}

struct Divider_Previews: PreviewProvider {
    static var previews: some View {
        Divider()
    }
}
