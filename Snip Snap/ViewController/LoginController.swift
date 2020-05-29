//
//  ViewController.swift
//  Snip Snap
//
//  Created by scarecode on 2/29/20.
//  Copyright © 2020 Snip Snap. All rights reserved.
//

import UIKit
import Apollo


class LoginController: UIViewController {
    
    @IBOutlet weak var userName: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.setGradientBackground(colorTop: "#5805D6", colorBottom: "#0468FC")
    }

    @IBAction func loginButton(_ sender: UIButton) {
        guard let username = userName.text, let password = password.text else { return }
        let empty = ""
        let input = Login(userName: username, password: password)
        if input.userName != empty, input.password != empty{
            NetworkManager.shared.apollo.perform(mutation: LoginMutation(login: input)) {[weak self] result in
                
                switch result{
                case .success(let gqlresult):
                    if let token = gqlresult.data?.login?.fragments.responseDetails.token{
                        print(token)
                        if token != ""{
                            UserDefaults.standard.setValue(username, forKey: "UserName")
                            UserDefaults.standard.synchronize()
                            self?.dismiss(animated: true, completion: {
                                self?.performSegue(withIdentifier: "Home", sender: self)
                            })
                        }
                    }else{
                        print(gqlresult.errors ?? "")
                    }
                case .failure(let error):
                    print("error \(error)")
                }
            }
            
        }
    }

}
