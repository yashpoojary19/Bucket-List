//
//  EditScreen.swift
//  Bucket List
//
//  Created by Yash Poojary on 18/11/21.
//

import SwiftUI
import MapKit

struct EditScreen: View {
    
    enum LoadinState {
        case loading, loaded, failed
    }
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var placemark: MKPointAnnotation
    @State private var pages = [Page]()
    @State private var loadingState = LoadinState.loading
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Title", text: $placemark.wrappedTitle)
                    TextField("Subtitle", text: $placemark.wrappedSubtitle)
                }
                
                Section(header: Text("Nearby...")) {
                    if loadingState == .loaded {
                        List(pages, id: \.pageid) { page in
                            Text(page.title)
                                .font(.headline)
                            + Text(": ") +
                            Text(page.description)
                                .italic()
                            
                        }
                    } else if loadingState == .loading {
                        Text("Loading")
                    } else {
                        Text("Please try again later")
                    }
                }
            }
            .navigationTitle("Edit Placemark")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
            .onAppear(perform: fetchNearbyPlaces)
        }
    }
    
    func fetchNearbyPlaces() {
        let urlString = "https://en.wikipedia.org/w/api.php?ggscoord=\(placemark.coordinate.latitude)%7C\(placemark.coordinate.longitude)&action=query&prop=coordinates%7Cpageimages%7Cpageterms&colimit=50&piprop=thumbnail&pithumbsize=500&pilimit=50&wbptterms=description&generator=geosearch&ggsradius=10000&ggslimit=50&format=json"
        
        guard let url = URL(string: urlString) else {
            print("bad url: \(urlString)")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, error, response in
            if let data = data {
                let decoder = JSONDecoder()
                
                if let items = try? decoder.decode(Result.self, from: data) {
                    pages = Array(items.query.pages.values).sorted()
                    loadingState = .loaded
                    return
                }
                
                loadingState = .failed
            }
        }
        .resume()
    }
}

//struct EditScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        EditScreen(, placemark: <#MKPointAnnotation#>)
//    }
//}
