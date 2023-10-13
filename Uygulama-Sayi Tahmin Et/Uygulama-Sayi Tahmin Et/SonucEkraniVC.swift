//
//  SonucEkraniVC.swift
//  Uygulama-Sayi Tahmin Et
//
//  Created by Sena Nur Erdem on 19.02.2023.
//

import UIKit

class SonucEkraniVC: UIViewController {

    @IBOutlet weak var imageViewSonuc: UIImageView!
    
    @IBOutlet weak var labelSonuc: UILabel!
    
    var sonuc:Bool?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true
        self.navigationItem.title = "Sonuç Ekranı"
        
        print(sonuc!)
        
        if sonuc! {
            labelSonuc.text = "KAZANDINIZ"
            imageViewSonuc.image = UIImage(named: "mutlu_resim")
        }
        else {
            labelSonuc.text = "KAYBETTİNİZ"
            imageViewSonuc.image = UIImage(named: "uzgun_resim")
        }
    }

    @IBAction func tekrarOyna(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true) // ilk sayfaya döndürür
    }
}
