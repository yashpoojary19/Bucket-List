////
////  MapView.swift
////  Bucket List
////
////  Created by Yash Poojary on 15/11/21.
////
//
//







import SwiftUI
import MapKit


struct MapView: UIViewRepresentable {
    
    @Binding var centerCoordinate: CLLocationCoordinate2D
    var annotations: [MKPointAnnotation]
    @Binding var selectedPlace: MKPointAnnotation?
    @Binding var showPlaceDetails: Bool
    
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        
        return mapView
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
        if view.annotations.count != annotations.count {
            view.removeAnnotations(view.annotations)
            view.addAnnotations(annotations)
        }
    }
    
    
    
    
    
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView
        
        init(_ parent: MapView) {
            self.parent = parent
        }
        
        func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
            parent.centerCoordinate = mapView.centerCoordinate
        }
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
           let identifier = "Placemark"
            
            var view = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
            
            if view == nil {
                view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                view?.canShowCallout = true
                view?.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
                    }
                        else {
                        view?.annotation = annotation
                }
            
                return view
                
            }
        
        
//        func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
//            guard let placemark = view.annotation as? MKPointAnnotation else {
//                return
//            }
//
//            parent.selectedPlace = placemark
//            parent.showPlaceDetails = true
//            }
        
        func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
            guard let placemark = view.annotation as? MKPointAnnotation else { return }

            parent.selectedPlace = placemark
            parent.showPlaceDetails = true
            }
        }
    
    
  
    
}
































//
//
//import SwiftUI
//import MapKit
//
//
//
//struct MapView: UIViewRepresentable {
//    
//    @Binding var centerCoordinate: CLLocationCoordinate2D
//    @Binding var selectedPlace: MKPointAnnotation?
//    @Binding var showingPlaceDetails: Bool
//    var annotations: [MKPointAnnotation]
//    
//
//    
//    func makeCoordinator() -> Coordinator {
//        Coordinator(self)
//    }
//    
//    func makeUIView(context: Context) -> MKMapView {
//        let mapView = MKMapView()
//        mapView.delegate = context.coordinator
//        return mapView
//    }
//    
//    func updateUIView(_ view: MKMapView, context: Context) {
//        if annotations.count != view.annotations.count {
//            view.removeAnnotations(view.annotations)
//            view.addAnnotations(annotations)
//            
//        }
//        
//    }
//    
//    class Coordinator: NSObject, MKMapViewDelegate {
//        var parent: MapView
//        
//        init(_ parent: MapView) {
//            self.parent = parent
//        }
//        
//        func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
//            parent.centerCoordinate = mapView.centerCoordinate
//        }
//        
//        
//        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//            let identifer = "Placemark"
//            
//            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifer)
//            
//            if annotationView == nil {
//                annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifer)
//                annotationView?.canShowCallout = true
//                annotationView?.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
//            } else {
//                annotationView?.annotation = annotation
//            }
//            
//            return annotationView
//            
//        }
//        
//        func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
//            guard let placemark = view.annotation as? MKPointAnnotation else {
//                return
//            }
//            
//            parent.selectedPlace = placemark
//            parent.showingPlaceDetails = true
//        }
//        
//    }
//    
//    
//}
//    
//
//    
//    
//    
//
//
//
//
//
////
////
////
////
////struct MapView_Previews: PreviewProvider {
////    static var previews: some View {
////        MapView()
////    }
////}
