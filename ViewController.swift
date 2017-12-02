//
//  ViewController.swift
//  GoogleSignInDemo
//
//  Created by APPLE MAC MINI on 28/11/17.
//  Copyright © 2017 APPLE MAC MINI. All rights reserved.
//

import UIKit

//AppDelegate should implement the GIDSignInUIDelegate Protocol Of Google SDK

class ViewController: UIViewController,GIDSignInUIDelegate {

    
    @IBOutlet weak var signInButton: GIDSignInButton!
    
    @IBOutlet weak var profilePic: UIImageView!
    
    @IBOutlet weak var lblName: UILabel!
    
   
    @IBOutlet weak var lblEmail: UILabel!
    
    @IBOutlet weak var lblToken: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        GIDSignIn.sharedInstance().uiDelegate = self
      
        //GIDSignIn.sharedInstance().signInSilently()
        
        loadDetails()
       
        
    }
    
    func loadDetails()
    {
            if(ProfileImg == nil)
            {
                profilePic.backgroundColor = UIColor.gray
            }
            else{
                
                let imgData = NSData(contentsOf: ProfileImg!)
                profilePic.image = UIImage(data: imgData! as Data)
            }
        
            if(UserName == nil)
            {
                lblName.text = "Please sign in first"
            }
            else{
                lblName.text = UserName
            }
        
            if(Email == nil)
            {
                lblEmail.text = "Please sign in first"
            }
            else
            {
                lblEmail.text = Email
            }
            if(Token == nil)
            {
                lblToken.text = nil
            }
            else
            {
                lblToken.text = Token
            }
    }

    @IBAction func btnLogout(_ sender: Any) {
        
        GIDSignIn.sharedInstance().signOut()
        
        profilePic.image = nil
        profilePic.backgroundColor = UIColor.gray
        lblName.text = "Please sign in first"
        lblEmail.text = "Please sign in first"
        lblToken.text = nil
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

