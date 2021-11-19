

import SwiftUI
import MapKit


struct MapView: UIViewRepresentable {
    
    @Binding var centerCoordinate: CLLocationCoordinate2D
    @Binding var selectedPlace: MKPointAnnotation?
    @Binding var showingPlaceDetails: Bool
    var annotions: [MKPointAnnotation]


    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        return mapView
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
        if annotions.count != view.annotations.count {
            view.removeAnnotations(view.annotations)
            view.addAnnotations(annotions)
            
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
        
        // customises the annotation
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            let identifier = "Placemark"
            
            var resusableView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
            
            if resusableView == nil {
                resusableView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                resusableView?.canShowCallout = true
                resusableView?.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            } else {
                resusableView?.annotation = annotation
            }
            
            return resusableView
        }
        
        // shows the button and what to do when button is tapped
        
        func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
            guard let placemark = view.annotation as? MKPointAnnotation else {
                return
            }
            
            parent.selectedPlace = placemark
            parent.showingPlaceDetails = true
            
        }
        
    }
    

}

