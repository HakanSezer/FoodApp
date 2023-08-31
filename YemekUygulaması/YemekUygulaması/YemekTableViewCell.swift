//
//  YemekTableViewCell.swift
//  YemekUygulaması
//
//  Created by Hakan Sezer on 31.08.2023.
//

import UIKit

// MARK: Soru?
// Bunu protocol olmadan yazamaz mıyız?
protocol YemekTableCellProtocol {
    func siparis(indexPath: IndexPath)
}

class YemekTableViewCell: UITableViewCell {
    
    // MARK: - UI Elements
    
    @IBOutlet weak var resimImageView: UIImageView!
    @IBOutlet weak var fiyatLabel: UILabel!
    @IBOutlet weak var yemekAdıLabel: UILabel!
    
    var hucreProtocol: YemekTableCellProtocol?
    var indexPath: IndexPath?

    
    // MARK: - Function
    // Oluşturduğumuz değerleri otomatikman içine atıyoruz.
    func update(with yemek:Yemekler) {
        resimImageView.image = UIImage(named: "\(yemek.yemekResimAdi)")
        fiyatLabel.text = String("\(yemek.yemekFiyat)")
        yemekAdıLabel.text = yemek.yemekAdi
        
            }
    
    // MARK: - Action
    
    @IBAction func siparisButton(_ sender: Any) {
        
        // MARK: Soru?
        // Neden bunu yazdığımızı pek anlamadım? Bu bizim karşı tarafta bu buttonu kullanabilmemize mi yarıyor.
        hucreProtocol?.siparis(indexPath: indexPath!)
        
    }
}
