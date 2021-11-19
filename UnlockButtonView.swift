//
//  UnlockButtonView.swift
//  Bucket List
//
//  Created by Yash Poojary on 19/11/21.
//

import SwiftUI
import LocalAuthentication

struct UnlockButtonView: View {
    
    
    @Binding var isUnlocked: Bool
    @State private var showErrorAlert = false
    
    var body: some View {
        Button("Unlock Me") {
            authenticate()
        }
        .padding()
        .background(Color.blue)
        .foregroundColor(Color.white)
        .clipShape(Capsule())
        .alert(isPresented: $showErrorAlert) {
            Alert(title: Text("Error with auth"), message: Text("Try again"), dismissButton: .default(Text("Okay")))
        }
    }
    
    func authenticate() {
        var error: NSError?
        let context = LAContext()
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "We need to write data"
            
            context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason) { success, authenticationError in
                
                DispatchQueue.main.async {
                    if success {
                        isUnlocked = true
                    } else {
                        
                    }
                    
                }
                
            }
        } else {
            //no bio
        }
    }
}
//
//struct UnlockButtonView_Previews: PreviewProvider {
//    static var previews: some View {
//        UnlockButtonView()
//    }
//}
