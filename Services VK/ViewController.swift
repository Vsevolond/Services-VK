//
//  ViewController.swift
//  Services VK
//
//  Created by Всеволод on 15.07.2022.
//

import UIKit



class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var services = [Service]() // сервисы
    var body : Body? // body в json
    //var appNames : [String] = ["вконтакте-музыка-и-видео", "my-games-app", "сферум-учитесь-и-общайтесь",
    //                           "юла-объявления-рядом-с-вами", "самокат-доставка-еды-продуктов", "каршеринг-ситидрайв",
    //                           "облако-mail-ru-диск-для-фото", "все-аптеки-поиск-лекарств", "календарь"]
    var appNames : [String] = ["vk", "com.googleusercontent.apps.117353666226-gvgjmski73lmhvn0876u01se7rih9qpp", "vk7677811",
                               "ok1150887424", "fb2193274957616391", "fb1017601158663132",
                               "fb1465013457142919", "vseapteki", "calshow"]
    
    override func viewDidLoad() { // настройка tableview
        super.viewDidLoad()
        
        downloadJSON {
            self.tableView.reloadData()
        }
        
        tableView.backgroundColor = UIColor.black
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    func downloadJSON(completed: @escaping () -> ()) { // загрузка данных через json
        let url = URL(string: "https://publicstorage.hb.bizmrg.com/sirius/result.json")
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error == nil {
                do {
                    
                    self.body = try JSONDecoder().decode(Body.self, from: data!)
                    self.services = (self.body?.body.services)!
                    DispatchQueue.main.async {
                        completed()
                    }
                } catch {
                    print("JSON error")
                }
            }
        }.resume()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return services.count // количество приложений
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        func imageWithImage(image: UIImage, scaledToSize newSize: CGSize) -> UIImage { // функция для выравнивания
            // фото приложений
            UIGraphicsBeginImageContext(newSize)
            image.draw(in: CGRect(x: 0 ,y: 0 ,width: newSize.width ,height: newSize.height))
            let newImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return newImage!.withRenderingMode(.alwaysOriginal)
        }
        
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell") // для памяти
        }
        
        cell!.backgroundColor = UIColor.black
        // название приложения
        cell!.textLabel?.textColor = UIColor.white
        cell!.textLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        cell!.textLabel?.text = services[indexPath.row].name
        // описание
        cell!.detailTextLabel?.textColor = UIColor.white
        cell!.detailTextLabel?.numberOfLines = 2
        cell!.detailTextLabel?.text = services[indexPath.row].description
        // фото
        let icon = services[indexPath.row].icon_url
        let ind = icon.index(icon.lastIndex(of: "/")!, offsetBy: 1)
        let imgName = String(icon.suffix(from: ind))
        //cell!.imageView?.image = UIImage(named: imgName)
        cell!.imageView?.image = imageWithImage(image: UIImage(named: imgName)!, scaledToSize: CGSize(width: 70, height: 70))


        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0 // размер ячейки
    }
    
    @IBAction func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { // отслеживание нажатия
        tableView.deselectRow(at: indexPath, animated: true)
        //print("Select cell № \(indexPath.row)")
//        let icon = services[indexPath.row].icon_url
//        let ind1 = icon.index(icon.lastIndex(of: "/")!, offsetBy: 1)
//        let ind2 = icon.lastIndex(of: ".")!
//        let appName = String(icon[ind1..<ind2])
        let appName = appNames[indexPath.row]

        let appScheme = "\(appName)://" // название приложения в системе
        //let path = services[indexPath.row].link
        //let url = URL(string: path)!
        //UIApplication.shared.open(url, options: [:], completionHandler: nil)
        let appUrl = URL(string: appScheme)!
        let app = UIApplication.shared

        //guard let appUrl = URL(string: appScheme) else { return }

        if app.canOpenURL(appUrl) {
            UIApplication.shared.open(appUrl)

        } else {

            let url = URL(string: services[indexPath.row].link)!
            UIApplication.shared.open(url, options: [ : ] , completionHandler: nil)

        }
        //print("\(services[indexPath.row].name)")
    }
    
}


