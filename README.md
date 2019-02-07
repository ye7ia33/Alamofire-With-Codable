# Alamofire-With-Codable
using Alamofire 4 With Codable


init pod 
then add cocopoads repositry 
pod 'Alamofire', '~> 4.7'
pod 'SwiftyJSON', '~> 4.2'
installing pods
then drag and two files into project 

then if you need to calling 


// Example to use 
// Create contact model
// Inject phone model into Contact class 

    struct Contact: Codable {
        var id : String
        var name : String
        var email : String
        var address : String
        var gender : String
        var phone : Phone
    }

    struct Phone: Codable {
        var mobile : String
        var home : String
        var office : String
    }


    import SwiftyJSON

    class ViewController: UIViewController {

    
    var contactArray = [Contact]()
    override func viewDidLoad() {
        super.viewDidLoad()
     
        AF.request(request_url: "http://www.mocky.io/v2/5c5af29d3200007b274ec88a") {
            (result , erroCode, errorMessage) in
            
            let responseObject = JSON(result ?? "")
            let contactJsonArray =  responseObject["contacts"]
            for aContact in contactJsonArray{

                let contactModel =  CodableJson.decode(Contact.self, from:aContact.1)
              
                if contactModel != nil { self.contactArray.append(contactModel as! Contact) }
             }

            print(self.contactArray)
        }
    }
    
    }

