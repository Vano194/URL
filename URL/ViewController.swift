//
//  ViewController.swift
//  URL
//   Надо бы написать что-то типо инструкци для чайников как работать с URL себе на будущее
//  Created by Иван Галиченко on 28.06.2024.
//

import UIKit

class ViewController: UIViewController {
    
    var imageWidth = ""
    var imageHeight = ""

    @IBOutlet weak var UIImageViewoutlet: UIImageView!
    @IBAction func actionButton(_ sender: Any) {
        
        // 1 шаг получить API
        let API = "https://loremflickr.com/" + imageWidth + "/" + imageHeight
        // 2 создаем URL
        guard let apiURL = URL(string: API) else {
            fatalError("Some error")
        }
        // 3 инициализировать сессию
        let session = URLSession(configuration: .default)
        // 4 создать datdaTask
        let task = session.dataTask(with: apiURL) {(data, response, error) in
            // 5 обработать полученные данные
            guard let data = data,  error == nil else { return }
            DispatchQueue.main.async {
                //data = jpg
                self.UIImageViewoutlet.image = UIImage( data: data)
            }
            
        }
        // запустить запрос
        task.resume()

  }
    

    override func viewDidLoad() {
        super.viewDidLoad()
      
        let height = UIImageViewoutlet.bounds.height
        self.imageHeight = String(format: "%.0f",Double(height))
        let width = UIImageViewoutlet.bounds.width
        self.imageWidth = String(format: "%.0f", Double(width))
    }
  
}

