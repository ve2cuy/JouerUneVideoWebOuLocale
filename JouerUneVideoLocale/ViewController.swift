//
//  ViewController.swift
//  JouerUneVideoLocale
//
//  Created by Alain on 17-11-24.
//  Copyright © 2017 Alain. All rights reserved.
//

import UIKit
import AVKit

class ViewController: UIViewController {

    @IBOutlet weak var viewStreamDuNet: UIView!
    
    @IBOutlet weak var viewStreamLocal: UIView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        chargerVideoÀPartirDuWeb()
        chargerVideoLocale()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // ****************************************************
    func chargerVideoÀPartirDuWeb() {
        let url = URL(string: "http://jplayer.org/video/m4v/Big_Buck_Bunny_Trailer.m4v")
        let player = AVPlayer(url: url!)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player

        // Ajuster la taille de la vidéo à celle de la view de présentation
        playerViewController.view.frame = viewStreamDuNet.bounds
        viewStreamDuNet.addSubview(playerViewController.view)

        // Facultatif, Ajouter le panneau de control de la vidéo
        self.addChildViewController(playerViewController)
        player.play()
    } // chargerVideoÀPartirDuWeb

    // ****************************************************
    func chargerVideoLocale() {
        let url = Bundle.main.url(forResource: "piano", withExtension: "m4v")!
        let player = AVPlayer(url: url)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        
        playerViewController.view.frame = viewStreamLocal.bounds
        viewStreamLocal.addSubview(playerViewController.view)
        
        // Facultatif, Ajouter le panneau de control de la vidéo
        self.addChildViewController(playerViewController)
        player.play()
    }
}

