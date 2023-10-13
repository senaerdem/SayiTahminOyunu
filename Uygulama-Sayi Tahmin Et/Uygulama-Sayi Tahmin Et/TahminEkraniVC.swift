//
//  TahminEkraniVC.swift
//  Uygulama-Sayi Tahmin Et
//
//  Created by Sena Nur Erdem on 19.02.2023.
//

import UIKit

class TahminEkraniVC: UIViewController {
    
    @IBOutlet weak var labelKalanHak: UILabel!
    
    @IBOutlet weak var labelYardim: UILabel!
    
    @IBOutlet weak var textfieldGirdi: UITextField!
    
    var rastgeleSayi:Int?
    var kalanHak = 5
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rastgeleSayi = Int.random(in: 0...100)
        
        print("Rastgele Sayı: \(rastgeleSayi!)")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let gelenVeri = sender as? Bool {
            let gidilecekVC = segue.destination as! SonucEkraniVC
            
            gidilecekVC.sonuc = gelenVeri
        }
        
    }
    
    @IBAction func tahminet(_ sender: Any) {
        labelYardim.isHidden = false
        kalanHak = kalanHak-1 // Her tahminde bir azalacak
        
        if let veri = textfieldGirdi.text { // Textfield üzerinden veri kontrol edilerek alınır
            
            if let tahmin = Int(veri) { // String ifadeyi kontrol ederek Int ifadeye dönüştürürüz.
                
                if tahmin == rastgeleSayi! { // Tahmin rastgele sayıya eşitse kazanılır.
                    let sonuc = true
                    performSegue(withIdentifier: "tahminToSonuc", sender: sonuc) // Kazanılırsa sayfa geçişi ve veri transferi
                    return // Kazandıktan sonra işlem yapmaması için return kullandık.
                    // return buttonun çalışmasını durdurur ve return ifadesinin yer aldığı satırdan sonraki kodlamalar çalışmaz.
                }
                if tahmin > rastgeleSayi! { // Tahmin edilen sayı büyük ise
                    labelYardim.text = "AZALT"
                    labelKalanHak.text = "Kalan Hak: \(kalanHak)"
                }
                if tahmin < rastgeleSayi! { // Tahmin edilen sayı küçük ise
                    labelYardim.text = "ARTTIR"
                    labelKalanHak.text = "Kalan Hak: \(kalanHak)"
                }
                if (kalanHak == 0){ // Tahmin hakkı kalmaz ise
                    let sonuc = false
                    performSegue(withIdentifier: "tahminToSonuc", sender: sonuc)
                    // Haklar bitince sayfa geçişi ve veri transferi
                }
                textfieldGirdi.text = ""
            }
            
        }
        
    }
}
