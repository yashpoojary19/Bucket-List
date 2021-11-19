//
//  CircleView.swift
//  Bucket List
//
//  Created by Yash Poojary on 19/11/21.
//

import SwiftUI

struct CircleView: View {
    var body: some View {
        Circle()
            .frame(width: 32, height: 32)
            .foregroundColor(Color.blue.opacity(0.5))
    }
}

struct CircleView_Previews: PreviewProvider {
    static var previews: some View {
        CircleView()
    }
}
