import UIKit
import CoreLocation

class ViewController: UIViewController {
    @IBOutlet weak var lon: UITextField!

    @IBOutlet weak var lat: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func Reverse(_ sender: UIButton) {
        
        let lati = Double(lat.text!)
        let longi = Double(lon.text!)
        
        
        let location = CLLocation(latitude: lati!, longitude: longi!)
        
      
        CLGeocoder().reverseGeocodeLocation(location) { (placemarks, error) in
            // Process Response
            self.processResponse(withPlacemarks: placemarks, error: error)
        }
        
        
    }
    
    private func processResponse(withPlacemarks placemarks: [CLPlacemark]?, error: Error?) {
        // Update View
        
        if let error = error {
            print("Unable to Reverse Geocode Location (\(error))")
            
        } else {
            
            if (placemarks?.count)! > 0
            {
                print(placemarks?[0].country)
                print(placemarks?[0].locality)
                print(placemarks?[0].areasOfInterest)
            }
        }
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

