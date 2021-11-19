
import SwiftUI
import MapKit


struct Loading: View {
    var body: some View {
        Text("Loading")
    }
}


struct Loaded: View {
    var body: some View {
        Text("Loaded")
    }
}

struct Failed: View {
    var body: some View {
        Text("Failed")
    }
}

struct EditScreen: View {
    
    enum LoadingState {
        case loaded, loading, failed
    }
    
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var placemark: MKPointAnnotation
    @State private var loadinState = LoadingState.loading
    @State private var pages = [Page]()
    
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Enter a title", text: $placemark.wrappedTitle)
                    TextField("Enter a title", text: $placemark.wrappedSubTitle)
                }
                
                Section(header: Text("Nearby")) {
                    if loadinState == .loaded {
                        List(pages, id: \.pageid) { page in
                            Text(page.title)
                                .font(.headline)
                            + Text(": ") +
                            Text(page.description)
                                .italic()
                            }
                        } else if loadinState == .loading {
                            Loading()
                        } else if loadinState == .failed {
                            Failed()
                        }
                    }
                    
                }
            .navigationBarTitle("Edit place")
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
                    loadinState = .loaded
                    return
                }
                
                loadinState = .failed
            }
        }
        .resume()
    }
}

