//
//  WebPDFViewController.swift
//  FBTest
//
//  Created by Ashwin Rajesh on 4/20/19.
//  Copyright © 2019 Ashwin Rajesh. All rights reserved.
//

import WebKit
import UIKit
import TPPDF

class WebPDFViewController: UIViewController, WKUIDelegate {

    
    @IBOutlet weak var web: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
        let document = PDFDocument(format: .a4)
        
        let attributedTitle = NSMutableAttributedString(string: "Awesome attributed title!", attributes: [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 40.0)
            ])
        let textElement = PDFAttributedText(text: attributedTitle)
        document.addAttributedText(.contentCenter, textObject: textElement)
        
        
        document.addText(.contentCenter, text: "[Insert text here]")
        
        document.createNewPage()
        
        document.addText(.contentCenter, text: "Create PDF documents easily.")
        
        
        do {
            let myURL = try PDFGenerator.generateURL(document: document, filename: "Example.pdf")
            
            let myRequest = URLRequest(url: myURL)
            web.load(myRequest)
            
        } catch {
            // Handle error
        }
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
