//
//  ButtonView.swift
//  Bucket List
//
//  Created by Yash Poojary on 19/11/21.
//
import MapKit
import SwiftUI

struct ButtonView: View {
    @Binding var selectedPlace: MKPointAnnotation?
    @Binding var showEditMenu: Bool
    @Binding var centerCoordinate: CLLocationCoordinate2D
    @Binding var locations: [MkPointAnnotationCodable]
    
    
    
    var body: some View {
                Button(action: {
                    let newLocation = MkPointAnnotationCodable()
                    newLocation.title = "Yash"
                    newLocation.subtitle = "Poojary"
                    newLocation.coordinate = centerCoordinate
                    locations.append(newLocation)
                    
                    
                    selectedPlace = newLocation
                    showEditMenu = true
                    
                }) {
                        Image(systemName: "plus")
                      
                }
                    .padding()
                    .background(Color.black.opacity(0.7))
                    .foregroundColor(Color.white)
                    .clipShape(Circle())
                    .padding(.trailing)
                    .font(.title)
        
             
                }
    }


//struct ButtonView_Previews: PreviewProvider {
//    static var previews: some View {
//        ButtonView(placemark: <#MKPointAnnotation#>, centerCoordinate: <#CLLocationCoordinate2D#>, locations: <#[MkPointAnnotationCodable]#>)
//    }
//}
