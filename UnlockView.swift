//
//  UnlockView.swift
//  Bucket List
//
//  Created by Yash Poojary on 19/11/21.
//

import SwiftUI
import MapKit

struct UnlockView: View {
    
    @State private var centerCoordinate = CLLocationCoordinate2D()
    @State private var locations = [MkPointAnnotationCodable]()
    
    @State private var selectedPlace: MKPointAnnotation?
    @State private var showingPlaceDetails = false
    
    @State private var showEditMenu = false
    
  
    
    
    
    var body: some View {
        ZStack {
            MapView(centerCoordinate: $centerCoordinate, selectedPlace: $selectedPlace, showingPlaceDetails: $showingPlaceDetails, annotions: locations)
                .edgesIgnoringSafeArea(.all)
            
            CircleView()
            
            VStack {
                    Spacer()
                HStack {
                    Spacer()
                    ButtonView(selectedPlace: $selectedPlace, showEditMenu: $showEditMenu, centerCoordinate: $centerCoordinate, locations: $locations)
                    
                }
            }
        }
        .alert(isPresented: $showingPlaceDetails) {
            Alert(title: Text(selectedPlace?.title ?? "Unkown"), message: Text(selectedPlace?.subtitle ?? "Unkown"), primaryButton: .default(Text("Okay")), secondaryButton: .default(Text("Edit")) {
                    showEditMenu = true
            })
        }
        .sheet(isPresented: $showEditMenu, onDismiss: saveData) {
            if selectedPlace != nil {
                EditScreen(placemark: selectedPlace!)
            }
        }
        .onAppear(perform: loadData)
        
    }
    
    
    func loadData() {
        let fileName = getDocumentsDirecotory().appendingPathComponent("SavedPlaces")
        
        do {
            let data = try Data(contentsOf: fileName)
            
            locations = try JSONDecoder().decode([MkPointAnnotationCodable].self, from: data)
        } catch {
            print("Unable to load data")
        }
    }
    
    func getDocumentsDirecotory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        return paths[0]
    }
    
    func saveData() {
        let filename = getDocumentsDirecotory().appendingPathComponent("SavedPlaces")
        
            do {
                let data = try JSONEncoder().encode(locations)
                try data.write(to: filename, options: [.atomic, .completeFileProtection])
            }
           
         catch {
            print("Unable to save data")
        }
    }
    
}

struct UnlockView_Previews: PreviewProvider {
    static var previews: some View {
        UnlockView()
    }
}
