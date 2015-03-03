//
//  ViewController.swift
//  swift_webview
//
//  Created by EnvyChoi on 2015. 3. 3..
//  Copyright (c) 2015년 Buzzni Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {
    
    var webview : UIWebView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "Envy"
        
        //웹뷰 생성
        webview = UIWebView(frame: self.view.bounds);
        //오토리사이즈마스크 사용시
        //webview?.autoresizingMask = UIViewAutoresizing.FlexibleRightMargin | UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleHeight | UIViewAutoresizing.FlexibleBottomMargin |   UIViewAutoresizing.FlexibleTopMargin | UIViewAutoresizing.FlexibleLeftMargin
        webview?.loadRequest(NSURLRequest(URL: NSURL(string: "http://google.com/")!))
        webview?.scrollView.bounces = true
        webview?.delegate = self
        
        self.view.addSubview(webview!)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: WEBVIEW
    
    //웹뷰 로딩 실패
    func webView(webView: UIWebView, didFailLoadWithError error: NSError) {
        print("LOAD FAILED : \(error.localizedDescription)\n")
    }
    
    //웹류 로딩 끝
    func webViewDidFinishLoad(webView: UIWebView) {
        print("LOAD FIN\n")
    }
    
    //웹뷰 로딩 시작
    func webViewDidStartLoad(webView: UIWebView) {
        print("LOAD START\n")
    }
    
    //웹뷰 클릭시 이동
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
}

