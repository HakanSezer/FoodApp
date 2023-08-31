//
//  YemekTableViewController.swift
//  YemekUygulaması
//
//  Created by Hakan Sezer on 31.08.2023.
//

import UIKit

class YemekTableViewController: UITableViewController, YemekTableCellProtocol {
    
    // MARK: - Properties
    // Veriyi kayıt ediyor.
    let saveUserDefault = UserDefaults.standard
    
    // Yemekleri aktardır.
    var yemek: [Yemekler] = [
        Yemekler(yemekId: 1, yemekAdi: "Ayran", yemekResimAdi: "ayran", yemekFiyat: 3.0),
        Yemekler(yemekId: 2, yemekAdi: "Baklava", yemekResimAdi: "baklava", yemekFiyat: 20.0),
        Yemekler(yemekId: 3, yemekAdi: "Fanta", yemekResimAdi: "fanta", yemekFiyat: 5.0),
        Yemekler(yemekId: 4, yemekAdi: "Izgara Somon", yemekResimAdi: "izgarasomon", yemekFiyat: 25.0),
        Yemekler(yemekId: 5, yemekAdi: "Izgara Tavuk", yemekResimAdi: "izgaratavuk", yemekFiyat: 15.0),
        Yemekler(yemekId: 6, yemekAdi: "Kadayif", yemekResimAdi: "kadayif", yemekFiyat: 16.0),
        Yemekler(yemekId: 7, yemekAdi: "Kahve", yemekResimAdi: "kahve", yemekFiyat: 6.0),
        Yemekler(yemekId: 8, yemekAdi: "Köfte", yemekResimAdi: "kofte", yemekFiyat: 15.0),
        Yemekler(yemekId: 9, yemekAdi: "Lazanya", yemekResimAdi: "lazanya", yemekFiyat: 21.0),
        Yemekler(yemekId: 10, yemekAdi: "Makarna", yemekResimAdi: "makarna", yemekFiyat: 13.0),
        Yemekler(yemekId: 11, yemekAdi: "Pizza", yemekResimAdi: "pizza", yemekFiyat: 18.0),
        Yemekler(yemekId: 12, yemekAdi: "Su", yemekResimAdi: "su", yemekFiyat: 1.0),
        Yemekler(yemekId: 13, yemekAdi: "Sütlaç", yemekResimAdi: "sutlac", yemekFiyat: 10.0),
        Yemekler(yemekId: 14, yemekAdi: "Tiramisu", yemekResimAdi: "tiramisu", yemekFiyat: 16.0)
    ]

    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Anasayfadaki Back buttonunu de aktif ediyor.
        navigationItem.hidesBackButton = true
    }

    // MARK: - Table view data source
    func siparis(indexPath: IndexPath) {
        // Basic Alert
        let alertController = UIAlertController(title: "Tebrikler", message: "Siparişiniz Verilmiştir.", preferredStyle: .alert)
        let tamamAction = UIAlertAction(title: "Tamam", style: .destructive) {
            action in
            print("tamam tıklandı.")
        }
        
        alertController.addAction(tamamAction)
        
        self.present(alertController, animated: true)
        
    }
    
    // kaç sections oluşacağını iletmiştir.
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    // Yemek kadar, ekranda görünecek.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return yemek.count
    }
    
    // seçmek için kullanılıyor.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let yemek = yemek[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "yemekCell") as! YemekTableViewCell
        // Cell'den çektiği verileri buraya aktarıyor.
        cell.update(with: yemek)
        
        
        cell.hucreProtocol = self
        cell.indexPath = indexPath
        
        return cell
    }
    
    // MARK: - Action
    @IBAction func cancelButton(_ sender: Any) {
        // Verilerin silinmesini sağlıyor.
        saveUserDefault.removeObject(forKey: "kullaniciAdi")
        saveUserDefault.removeObject(forKey: "sifre")
        
        // MARK: Soru
        // daha farklı bir şekilde çıkış yapılır mı? Zor olmayacak şekilde :)
        exit(-1)
        
    }

}
