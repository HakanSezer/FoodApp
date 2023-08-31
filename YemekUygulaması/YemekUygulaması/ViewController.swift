//
//  ViewController.swift
//  YemekUygulaması
//
//  Created by Hakan Sezer on 31.08.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var kullaniciAdiTextField: UITextField!
    @IBOutlet weak var sifreTextField: UITextField!
    
    // Kayıt için kullanacağım.
    let saveUserDefault = UserDefaults.standard
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let kullaniciUD = saveUserDefault.string(forKey: "kullaniciAdi") ?? "bos"
        let sifreUD = saveUserDefault.string(forKey: "sifre") ?? "bos"
        
        // Boş olup olmadığını kontrol ediyoruz.
        // Boş değilse ikinci sayfa gitmesini sağlıyoruz.
        if kullaniciUD != "bos" && sifreUD != "bos" {
            performSegue(withIdentifier: "girisToAnasayfa", sender: nil)
        }
    }
    
    //Uygulama başladığında çalıştırır.
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    // Uygulama sayfası kapandığında kullanılmaya başlanır.
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }
    
    // MARK: - Action
    @IBAction func loginTappedButton(_ sender: Any) {
        // Burada Kullanıcı Adı ve Şifre kontrol yapılmaktadır. Doğru mu yanlış mı diye
        if let kullanciUD = kullaniciAdiTextField.text , let sifreUD = sifreTextField.text {
            
            // Kullanıcıların doğru olup olmadığını görmüş oluyoruz.
            if kullanciUD == "admin" && sifreUD == "123456" {
                saveUserDefault.set(kullanciUD, forKey: "kullaniciAdi")
                saveUserDefault.set(sifreUD, forKey: "sifre")
                
                performSegue(withIdentifier: "girisToAnasayfa", sender: nil)
            }else {
                // Yanlış Şifre veya Kullanıcı Adi girilince otomatik Alert vermesini sağladım.
                let alertController = UIAlertController(title: "Hatalı", message: "Kullanıcı Adı veya Şifre yanlış.", preferredStyle: .alert)
                
                let iptalAction = UIAlertAction(title: "Tamam", style: .cancel)
                
                alertController.addAction(iptalAction)
                
                self.present(alertController,animated: true)
            }
        }
        
    }
    

}

