import UIKit

struct Post: Decodable{
    let name: String
    let body: String
}


class Web: UIViewController{
    
    @IBOutlet weak var titulo: UILabel!
    @IBOutlet weak var contenido: UITextView!
    var posts:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let url = "https://jsonplaceholder.typicode.com/comments"
        let urlObj = URL(string: url)
        
        URLSession.shared.dataTask(with: urlObj!) { (data, response, error) in
            
            do {
                let posts = try JSONDecoder().decode([Post].self, from: data!)

                DispatchQueue.main.async {
                    self.titulo.text = posts[0].name
                    self.contenido.text = "Contenido de relleno obtenido mediante JSON" + "\n\n" + posts[0].body + posts[1].body
                }

            }catch{
                print(error)
            }
            
            }.resume()
        
        

    }
    
    
    
    
}


