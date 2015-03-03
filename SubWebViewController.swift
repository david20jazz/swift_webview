//
//  SubWebViewController.swift
//  Hoot
//
//  Created by EnvyChoi on 2015. 2. 26..
//  Copyright (c) 2015년 CHOISUNHO. All rights reserved.
//

import Foundation
import UIKit

class SubWebViewController : UIViewController, UIWebViewDelegate{
    
    var webview : UIWebView?
    var strUrl : String?
    
    override func viewDidLoad() {
        
        webview = UIWebView(frame: CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height));
        webview?.autoresizingMask = UIViewAutoresizing.FlexibleRightMargin | UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleHeight | UIViewAutoresizing.FlexibleBottomMargin | UIViewAutoresizing.FlexibleTopMargin | UIViewAutoresizing.FlexibleLeftMargin
        webview?.loadRequest(NSURLRequest(URL: NSURL(string: strUrl!)!))
        webview?.scrollView.bounces = false
        webview?.delegate = self
        
        self.view.addSubview(webview!)
        
    }
    
    //MARK: WEBVIEW
    //TODO: START
    //FIXME: FIX
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError) {
        
        print("FAILED : \(error.localizedDescription)\n")
        //webView.loadRequest(NSURLRequest(URL: NSURL(string: "http://hsmoa.com")!))
    }
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        print("LOAD : \(request.URL.absoluteString)\n")
        
        if navigationType == UIWebViewNavigationType.LinkClicked
        {
            var v = SubWebViewController();
            v.strUrl = request.URL.absoluteString
            v.title = request.URL.host
            self.navigationController?.pushViewController(v, animated: true)

            
            return false;
        }
        
        return true;
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        
        print("FIN\n")
    }
    
    func webViewDidStartLoad(webView: UIWebView) {
        
        print("START\n")
    }
}
