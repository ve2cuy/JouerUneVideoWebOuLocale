//  ===================================================================================
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
//
//  Référence sur 'xcode_markup'
//  https://developer.apple.com/library/content/documentation/Xcode/Reference/xcode_markup_formatting_ref/index.html#//apple_ref/doc/uid/TP40016497-CH2-SW1
//  ===================================================================================
//
//  Extrait:
//
//     Ceci vient d'où?
/*
      GOOD FOOD
      At the
      Peoples Grill (both)
      SHORT ORDER &
      REGULAR MEALS
*/

// Importation des librairies
import UIKit
import AVKit

// ****************************************************
class ViewController: UIViewController {

    // Définition des constantes
    let urlVideoWeb     = URL(string:"http://jplayer.org/video/m4v/Big_Buck_Bunny_Trailer.m4v")!
    let urlVideoLocale  = Bundle.main.url(forResource: "piano", withExtension: "m4v")!  // Utiliser: Bundle.main.url pour un fichier local.
    
    // Définition des liens MVC
    @IBOutlet weak var viewStreamDuNet: UIView!
    @IBOutlet weak var viewStreamLocal: UIView!
    
    // ****************************************************
    override func viewDidLoad() {
        super.viewDidLoad()
        // Jouer une vidéo à partir du web
        chargerVideo(uneURL: urlVideoWeb, uneView: viewStreamDuNet)
        // Jouer une vidéo locale
        chargerVideo(uneURL: urlVideoLocale, uneView: viewStreamLocal)
    } // viewDidLoad()
 
    // Voici un exemple de documentation en ligne:
    /**
    Cette méthode a la mauvaise habitude de soliciter le web
    ou le bundle local pour localiser une vidéo dans le
    but de la présenter dans une des UIViews du projet.
    - Author:
    Alain Boudreault
     
     - parameters:
        - uneURL:  lien vers la vidéo
        - uneView: lien vers la UIView qui présentera la vidéo
    */
    func chargerVideo(uneURL:URL, uneView:UIView) {
        // Initialiser un lecteur de vidéo à partir d'une URL
        let player = AVPlayer(url: uneURL)
        // Créer une palette de contrôle vidéo
        let playerViewController = AVPlayerViewController()
        // Associer la palette de contrôle vidéo au lecteur vidéo
        playerViewController.player = player
        
        // Ajuster la taille de la vidéo à celle de la view de présentation
        playerViewController.view.frame = uneView.bounds
        // Présenter le vidéo player à l'écran
        uneView.addSubview(playerViewController.view)
        
        // Facultatif, Ajouter le panneau de control de la vidéo
        self.addChildViewController(playerViewController)
        
        // Démarrer la vidéo
        player.play()
    } // chargerVideoÀPartirDuWeb

} // ViewController

