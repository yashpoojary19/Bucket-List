
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
    
    public var wrappedSubTitle: String {
        get {
            subtitle ?? "Unkown Value"
        }
        
        set {
            subtitle = newValue
        }
    }
}
