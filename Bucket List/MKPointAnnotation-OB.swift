//
//  MKPointAnnotation-OB.swift
//  Bucket List
//
//  Created by Yash Poojary on 18/11/21.
//


import MapKit


extension MKPointAnnotation: ObservableObject {
    
    public var wrappedTitle: String {
        get {
            title ?? "Unkown Value"
        }
        
        set {
            title = newValue
        }
    }
    
    public var wrappedSubtitle: String {
        get {
            subtitle ?? "Unkown Value"
        }
        
        set {
            subtitle = newValue
        }
    }
}
