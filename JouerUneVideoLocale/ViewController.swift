//  Fichier:    ViewController.swift
//  Projet:     JouerUneVideoLocale
//  Auteur:     Alain Boudreault
//  Copyright:  17-11-24 © ve2cuy, All rights reserved.
//  ===================================================================================
//  NOTE: À l'usage exclusif des étudiants et étudiantes de
//  Techniques d'Intégration Multimédia
//  du cégep de Saint-Jérôme.
//  ----------------------------------------------------------------------------------
//  Il est interdit de reproduire, en tout ou en partie, à des fins commerciales,
//  le code source, les scènes, les éléments graphiques, les classes et
//  tout autre contenu du présent projet sans l’autorisation écrite de l'auteur.
//
//  Pour obtenir l’autorisation de reproduire ou d’utiliser, en tout ou en partie,
//  le présent projet, veuillez communiquer avec:
//
//  Alain Boudreault, aboudrea@cstj.qc.ca, ve2cuy.wordpress.com, ve2cuy @ github
//
//  ===================================================================================

// Importation des librairies
import UIKit
import AVKit

// ****************************************************
class ViewController: UIViewController {

    // Définition des liens MVC
    @IBOutlet weak var viewStreamDuNet: UIView!
    @IBOutlet weak var viewStreamLocal: UIView!
    
    // ****************************************************
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        chargerVideoÀPartirDuWeb()
        chargerVideoLocale()
    } // viewDidLoad()
 
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
    } // chargerVideoLocale()

} // ViewController

