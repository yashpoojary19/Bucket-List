//
//  ContentView.swift
//  Bucket List
//
//  Created by Yash Poojary on 15/11/21.
//


import MapKit
import SwiftUI
import LocalAuthentication

struct ContentView: View {
    
    @State private var isUnlocked = false

    
    
    
    var body: some View {
        ZStack {
                if isUnlocked {
                    
                    UnlockView()
                } else {
                    UnlockButtonView(isUnlocked: $isUnlocked)
                        
                }
        }
      
    }


    
 

    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}






//struct User: Identifiable, Comparable {
//
//
//    var id = UUID()
//    var firstName: String
//    var lastName: String
//
//    static func < (lhs: User, rhs: User) -> Bool {
//        lhs.firstName < rhs.firstName
//    }
//}
//
//
//struct ContentView: View {
//    var users = [
//        User(firstName: "Yash", lastName: "Poojary"),
//        User(firstName: "Khushmi", lastName: "Poojary"),
//        User(firstName: "Wow", lastName: "YUW")
//    ].sorted()
//
//
//
//
//
//
//
//    var body: some View {
//        VStack {
//            List(users) { user in
//                Text("\(user.firstName) \(user.lastName)")
//
//            }
//        }
//    }
//}


// struct ContentView: View {
//    @State private var centerCoordinate = CLLocationCoordinate2D()
//
//
//    var body: some View {
//        ZStack {
//            MapView(centerCoordinate: $centerCoordinate)
//                .edgesIgnoringSafeArea(.all)
//            Circle()
//                .fill(Color.blue)
//                .opacity(0.3)
//                .frame(width: 32, height: 32)
//
//            VStack {
//                Spacer()
//                HStack {
//                    Spacer()
//                    Button(action: {
//
//                    }) {
//                        Image(systemName: "plus")
//                    }
//                    .padding()
//                    .background(Color.black.opacity(0.75))
//                    .foregroundColor(.white)
//                    .font(.title)
//                    .clipShape(Circle())
//                    .padding(.trailing)
//                }
//            }
//        }
//    }
//}






//import LocalAuthentication
//
//struct ContentView: View {
//    @State private var isUnlocked = false
//
//
//
//    var body: some View {
//        VStack {
//            if isUnlocked {
//                Text("Unlocked")
//            } else {
//                Text("Locked")
//            }
//        }
//        .onAppear(perform: authenticate)
//    }
//
//    func authenticate() {
//        let context = LAContext()
//        var error: NSError?
//
//        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
//            let reason = "We need to unlock your data."
//
//            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) {
//                success, authenticationError in
//                DispatchQueue.main.async {
//                    if success {
//                        isUnlocked = true
//                    } else {
//                        //
//                    }
//                }
//            }
//        } else {
//            // doesn't have biometrics
//        }
//
//    }
//}


//
//struct ContentView: View {
//    var body: some View {
//        MapView()
//            .edgesIgnoringSafeArea(.all)
//    }
//}
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
//



//struct LoadingView: View {
//    var body: some View {
//        Text("Loading")
//    }
//}
//
//struct SuccessView: View {
//    var body: some View {
//        Text("Success")
//    }
//}
//
//struct FailedView: View {
//    var body: some View {
//        Text("Failed")
//    }
//}
//
//
//
//struct ContentView: View {
//
//    enum loadState {
//        case loading, success, failed
//    }
//
//    var loadingState = loadState.loading
//
//    var body: some View {
//        if loadingState == .loading {
//            LoadingView()
//        } else if loadingState == .success {
//            SuccessView()
//        } else if loadingState == .failed {
//            FailedView()
//        }
//    }
//}














//
//struct ContentView: View {
//
//    func getDocumentsDirectory() -> URL {
//        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
//
//        return paths[0]
//    }
//
//
//    var body: some View {
//        Text("Hello World!")
//            .onTapGesture {
//                let str = "Test Message"
//                let url = getDocumentsDirectory().appendingPathComponent("message.txt")
//
//                do {
//                    try str.write(to: url, atomically: true, encoding: .utf8)
//                    let input = try String(contentsOf: url)
//                    print(input)
//                } catch {
//                    print(error.localizedDescription)
//                }
//            }
//    }
//}











//struct User: Identifiable, Comparable {
//    let id = UUID()
//    let firstName: String
//    let lastName: String
//
//    static func < (lhs: User, rhs: User) -> Bool {
//        lhs.lastName < rhs.lastName
//    }
//}
//
//struct ContentView: View {
//
//    let users = [
//        User(firstName: "Arnold", lastName: "Rimmer"),
//        User(firstName: "Kristene", lastName: "Kochanski"),
//        User(firstName: "David", lastName: "Lister")
//    ].sorted()
//
//
//
//    var body: some View {
//        List(users) { user in
//            Text("\(user.firstName), \(user.lastName)")
//        }
//    }
//}
