//
//  CurrencyViewController.swift
//  TextCapture
//
//  Created by Natalie Yip on 5/3/17.
//  Copyright © 2017 Findo Inc. All rights reserved.
//

import UIKit
import SwiftCarousel
import Alamofire
import SwiftyJSON

class CurrencyViewController: UIViewController {
    
    @IBOutlet weak internal var carousel: SwiftCarousel!
    
    var items: [String]?
    var itemsViews: [UILabel]?
    
    @IBOutlet weak var priceLabel: UILabel!

    @IBOutlet weak var inputCurrency: UITextField!
    
    @IBAction func tapSubmitButton(_ sender: AnyObject) {
        inputCurrency.resignFirstResponder()
        let currency = inputCurrency.text!
        let priceBingo = priceLabel.text!

        
        currencyParse(priceBingo: priceBingo, completion: {
            rate in
            let conversion = Double(currency)! * rate
            DispatchQueue.main.async {
                print(conversion)
                self.priceLabel.text = "\(currency) dollars converts to \(conversion) \(priceBingo)"
            }
        })
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        items = [
            "Australia Dollar: AUD",
            "Bulgaria Lev: BGN",
            "Brazil Real: BRL",
            "Canada Dollar: CAD",
            "Switzerland Franc: CHF",
            "China Yuan or Renminbi: CNY",
            "Czech Koruna: CZK",
            "Denmark Krone: DKK",
            "Great Britain Pound: GBP",
            "Hong Kong Dollar: HKD",
            "Croatia Kuna: HRK",
            "Hungary Forint: HUF",
            "Indonesia Rupiah: IDR",
            "Israel New Shekel: ILS",
            "India Rupee: INR",
            "Japan Yen: JPY",
            "South Korea Won: KRW",
            "Malaysia Ringgit: MYR",
            "Mexico Peso: MXN",
            "Norway Kroner: NOK",
            "New Zealand Dollar: NZD",
            "Poland Zloty: PLN",
            "Philippines Peso: PHP",
            "Romanian Leu: RON",
            "Russia Rouble: RUB",
            "Sweden Krona: SEK",
            "Singapore Dollar: SGD",
            "Thailand Baht: THB",
            "Turkish New Lira: TRY",
            "USA Dollar: USD",
            "South Africa Rand: ZAR"]
        
        itemsViews = items!.map { labelForString($0) }
        carousel.items = itemsViews!
        carousel.resizeType = .visibleItemsPerPage(2)
        carousel.defaultSelectedIndex = 3
        carousel.delegate = self
        carousel.scrollType = .default
    }
    
    func labelForString(_ string: String) -> UILabel {
        let text = UILabel()
        text.text = string
        text.textColor = .white
        text.textAlignment = .center
        text.font = .systemFont(ofSize: 19.5)
        text.numberOfLines = 0
        
        return text
    }

}


extension CurrencyViewController: SwiftCarouselDelegate {
    
    func didSelectItem(item: UIView, index: Int, tapped: Bool) -> UIView? {
        if let language = item as? UILabel {
            language.textColor = UIColor(red: 0.93, green: 0.88, blue:0.30, alpha:1.0)
            priceLabel.text = "\(language.text!.substring(from:language.text!.index(language.text!.endIndex, offsetBy: -3)))"
            
            let priceBingo = priceLabel.text

            
            return language
        }

        return item
    }
    
    func currencyParse(priceBingo: String, completion: @escaping (Double) -> ()) {
        
        Alamofire.request("http://api.fixer.io/latest").responseJSON { response in
            guard let data = response.result.value else { return }
            guard let result = data as? [String: Any] else { return }
            guard let currencyList = result["rates"] as? [String:AnyObject] else { return }
            guard let rate = currencyList[priceBingo] as? NSNumber else { return }
            completion(rate.doubleValue)
        }
        
        
    }
    
    
    
    
    func didDeselectItem(item: UIView, index: Int) -> UIView? {
        if let language = item as? UILabel {
            language.textColor = .white
            
            return language
        }
        
        return item
    }
    
    
    
 
}


