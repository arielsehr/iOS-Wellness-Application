//
//  Map_ViewController.swift
//  wellness
//
//  Created by Ariel Sehr on 5/5/21.
//

import UIKit
import MapKit

class Map_ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    //create a class to inherit from MKPointAnnotation class to hold points
    class MyAnnotation: MKPointAnnotation{ }
    
    var locationManager = CLLocationManager()
    
    var annotationArray = [MyAnnotation]()
    
    var allObjectsTupleArray:[(objLat: CLLocationDegrees, objLong: CLLocationDegrees, objName: String, objDesc: String)] =
        [(objLat: 41.878114, objLong: -87.629798, objName: "Nuveen Blvd.", objDesc: "333 W Wacker, Chicago"),
         (objLat: 41.888969, objLong: -87.633924, objName: "Merch. Mart Bld.", objDesc: "222 W Merchandise Mart Plaza, Chicago"),
         (objLat: 41.885295, objLong: -87.621490, objName: "AON Building", objDesc: "200 E Randolph St, Chicago"),
         (objLat: 41.885124, objLong: -87.6316836, objName: "State of IL Center", objDesc: "100 W Randolph St, Chicago"),
         (objLat: 41.8763089, objLong: -87.6281983, objName: "Harold Washington Library", objDesc: "400 S State St, Chicago")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        
        //set current head office of Dr. Feelgood
        let currentLatitude = 41.885598
        let currentLongitude = -87.625001
        
        //set map span
        let latDelta = 0.10
        let longDelta = 0.10
        
        let currentLocationSpan: MKCoordinateSpan =
            MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: longDelta)
        let currentLocation: CLLocationCoordinate2D =
        CLLocationCoordinate2DMake(currentLatitude, currentLongitude)
        let currentRegion: MKCoordinateRegion =
            MKCoordinateRegion(center: currentLocation, span: currentLocationSpan)
        self.mapView.setRegion(currentRegion, animated: true)
        
        var indx = 0;
        
        for oneObject in allObjectsTupleArray {
            let oneAnnotation = MyAnnotation()
            let oneObjLoc: CLLocationCoordinate2D =
                CLLocationCoordinate2DMake(oneObject.objLat, oneObject.objLong)
            print("Latitude: \(oneObject.objLat) Longitude: \(oneObject.objLong)")
            oneAnnotation.coordinate = oneObjLoc
            
            oneAnnotation.title = oneObject.objName
            print("ObjectName: \(oneObject.objName)")
            
            oneAnnotation.subtitle = oneObject.objDesc
            print("ObjectDescription: \(oneObject.objDesc)")

            if (indx < allObjectsTupleArray.count-1) {
                let vlat1:Double = allObjectsTupleArray[indx].0
                let vlong1:Double = allObjectsTupleArray[indx].1
                let vlat2:Double = allObjectsTupleArray[indx+1].0
                let vlong2:Double = allObjectsTupleArray[indx+1].1
                
                let d:Double = distance(lat1:vlat1, lon1:vlong1, lat2:vlat2, lon2:vlong2)
                
                print(d);
                
                if (d > 0.7) {
                    annotationArray.append(oneAnnotation);
                }
            }
            indx = indx+1;
            print(0)
            
        }
        self.mapView.addAnnotations(annotationArray)
        // Do any additional setup after loading the view.
    }
    
    func distance(lat1: Double, lon1: Double, lat2: Double, lon2: Double) -> Double {
        
        let radlat1 = .pi*lat1/180
        let radlat2 = .pi*lat2/180
        let theta = lon1-lon2
        let radtheta = .pi*theta/180
        var dist = sin(radlat1) * sin(radlat2) + cos(radlat1) * cos(radlat2) * cos(radtheta);
        dist = acos(dist)
        dist = dist*180/Double.pi
        dist = dist*60*1.1515
        return dist
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
