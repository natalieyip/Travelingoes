//
//  CurrencyViewController.swift
//  TextCapture
//
//  Created by Natalie Yip on 5/3/17.
//  Copyright © 2017 Findo Inc. All rights reserved.
//

import UIKit
import SwiftCarousel

class CurrencyViewController: UIViewController {
    
    @IBOutlet weak internal var carousel: SwiftCarousel!

    @IBOutlet weak internal var selectedTextLabel: UILabel!
    
    var items: [String]?
    var itemsViews: [UILabel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        items = [
            "Australia Dollar (AUD)",
            "Bulgaria Lev (BGN)",
            "Brazil Real (BRL)",
            "Canada Dollar (CAD)",
            "Switzerland Franc (CHF)",
            "China Yuan or Renminbi (CNY)",
            "Czech Koruna (CZK)",
            "Denmark Krone (DKK)",
            "Great Britain Pound (GBP)",
            "Hong Kong Dollar (HKD)",
            "Croatia Kuna (HRK)",
            "Hungary Forint (HUF)",
            "Indonesia Rupiah (IDR)",
            "Israel New Shekel (ILS)",
            "India Rupee (INR)",
            "Japan Yen (JPY)",
            "South Korea Won (KRW)",
            "Malaysia Ringgit (MYR)",
            "Mexico Peso (MXN)",
            "Norway Kroner (NOK)",
            "New Zealand Dollar (NZD)",
            "Poland Zloty (PLN)",
            "Philippines Peso (PHP)",
            "Romanian Leu (RON)",
            "Russia Rouble (RUB)",
            "Sweden Krona (SEK)",
            "Singapore Dollar (SGD)",
            "Thailand Baht (THB)",
            "Turkish New Lira (TRY)",
            "USA Dollar (USD)",
            "South Africa Rand (ZAR)"]
        
        itemsViews = items!.map { labelForString($0) }
        carousel.items = itemsViews!
        carousel.resizeType = .visibleItemsPerPage(3)
        carousel.defaultSelectedIndex = 3
        carousel.delegate = self
        carousel.scrollType = .default
    }
    
    func labelForString(_ string: String) -> UILabel {
        let text = UILabel()
        text.text = string
        text.textColor = .black
        text.textAlignment = .center
        text.font = .systemFont(ofSize: 24.0)
        text.numberOfLines = 0
        
        return text
    }
    
    //    @IBAction func selectTigers(_ sender: AnyObject) {
    //        carousel.selectItem(1, animated: true)
    //    }
}


extension CurrencyViewController: SwiftCarouselDelegate {
    
    func didSelectItem(item: UIView, index: Int, tapped: Bool) -> UIView? {
        if let language = item as? UILabel {
            language.textColor = UIColor.red
            selectedTextLabel.text = "\(language.text!) selected"
            
            return language
        }
        
        return item
    }
    
    func didDeselectItem(item: UIView, index: Int) -> UIView? {
        if let language = item as? UILabel {
            language.textColor = .black
            
            return language
        }
        
        return item
    }
    
    func didScroll(toOffset offset: CGPoint) {
        selectedTextLabel.text = "Spinning up!"
    }
    
    func willBeginDragging(withOffset offset: CGPoint) {
        selectedTextLabel.text = "On the wheel! "
    }
    
    func didEndDragging(withOffset offset: CGPoint) {
        selectedTextLabel.text = "Oh, here we go!"
    }
}


