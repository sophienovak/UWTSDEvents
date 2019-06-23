//
//  MapViewController.swift
//  UWTSDEvents
//
//  Created by Sophie Novak on 09/05/2018.
//  Copyright © 2018 Sophie Novak. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        map.mapType=MKMapType.hybrid
        map.isZoomEnabled=true
        
        let lat:CLLocationDegrees = 51.6240336
        let long:CLLocationDegrees = -3.9490575
        let lat2:CLLocationDegrees = 51.6218658
        let long2:CLLocationDegrees = -3.9467149
        let lat3:CLLocationDegrees = 51.6266475
        let long3:CLLocationDegrees = -3.9413939
        let lat4:CLLocationDegrees = 51.6235404
        let long4:CLLocationDegrees = -3.9445933
        let latzoom: CLLocationDegrees=0.005
        let longzoom: CLLocationDegrees=0.005
        
        let location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(lat,long)
        let location2: CLLocationCoordinate2D=CLLocationCoordinate2DMake(lat2, long2)
        let location3:CLLocationCoordinate2D=CLLocationCoordinate2DMake(lat3, long3)
        let location4:CLLocationCoordinate2D=CLLocationCoordinate2DMake(lat4, long4)
        let span: MKCoordinateSpan = MKCoordinateSpanMake(latzoom, longzoom)
        let region: MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        map.setRegion(region, animated: true)
        let annotation=MKPointAnnotation()
        let annotation2=MKPointAnnotation()
        let annotation3=MKPointAnnotation()
        let annotation4=MKPointAnnotation()
        annotation.coordinate=location
        annotation.title="Mount Pleasant Campus"
        annotation2.coordinate=location2
        annotation2.title="Dynevor Campus"
        annotation3.coordinate=location3
        annotation3.title="Swansea Business Campus"
        annotation4.coordinate=location4
        annotation4.title="Alex Design Exchange"
        map.addAnnotation(annotation)
        map.addAnnotation(annotation2)
        map.addAnnotation(annotation3)
        map.addAnnotation(annotation4)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
