//
//  SplashViewController.swift
//  Places
//
//  Created by NARA on 4/9/18.
//  Copyright © 2018 Ministerio de Transportes y Comunicaciones. All rights reserved.
//

import UIKit
import Player
protocol SplashViewControllerDelegate {
    func goToLogIn()
    func getVideo()
}
class SplashViewController: UIViewController {
    var delegate:SplashViewControllerDelegate?
    //para reproducir el video
    fileprivate var player = Player()
    // MARK: object lifecycle
    deinit {
        self.player.willMove(toParentViewController: self)
        self.player.view.removeFromSuperview()
        self.player.removeFromParentViewController()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        for family in UIFont.familyNames {
//            print("\(family)")
//            
//            for name in UIFont.fontNames(forFamilyName: family) {
//                print("   \(name)")
//            }
//        }
        view.backgroundColor = .white
        let img:UIImageView = UIImageView()
        img.image = #imageLiteral(resourceName: "logo")
        img.frame = CGRect(x: (self.view.frame.size.width - 100)/2, y:  (self.view.frame.size.height - 100)/2, width: 100, height: 100)
        self.view.addSubview(img)
        
        
        self.player.playerDelegate = self
        self.player.playbackDelegate = self
        self.player.view.frame = self.view.bounds
        
        self.addChildViewController(self.player)
        self.view.addSubview(self.player.view)
        self.player.didMove(toParentViewController: self)
    
        self.delegate?.getVideo()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func showVideo(url: String){
        //reproducir el video
        let videoUrl = URL(string: url)!
        self.player.url = videoUrl
        self.player.playbackLoops = false
        self.player.playFromBeginning()
//         // para manejar las llamados con gestos para pausar o reproducir
//        let tapGestureRecognizer: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapGestureRecognizer(_:)))
//        tapGestureRecognizer.numberOfTapsRequired = 1
//        self.player.view.addGestureRecognizer(tapGestureRecognizer)
    }
    func showLogInView(){
        let viewLogIn:LogInViewController = LogInViewController()
        let model:AuthenticateModel = AuthenticateModel()
        let presenter:LogInPresenter = LogInPresenter(view: viewLogIn, model: model)
        presenter.loadProtocols()
        self.navigationController?.pushViewController(viewLogIn, animated: false)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
// MARK: - PlayerDelegate

extension SplashViewController:PlayerDelegate {
    
    func playerReady(_ player: Player) {
    }
    
    func playerPlaybackStateDidChange(_ player: Player) {
    }
    
    func playerBufferingStateDidChange(_ player: Player) {
    }
    func playerBufferTimeDidChange(_ bufferTime: Double) {
        
    }
    
}

// MARK: - PlayerPlaybackDelegate

extension SplashViewController:PlayerPlaybackDelegate {
    
    func playerCurrentTimeDidChange(_ player: Player) {
    }
    
    func playerPlaybackWillStartFromBeginning(_ player: Player) {
    }
    
    func playerPlaybackDidEnd(_ player: Player) {
        self.showLogInView()
    }
    
    func playerPlaybackWillLoop(_ player: Player) {
    }
    
}
// MARK: - UIGestureRecognizer

extension SplashViewController {
    
    @objc func handleTapGestureRecognizer(_ gestureRecognizer: UITapGestureRecognizer) {
        switch (self.player.playbackState.rawValue) {
        case PlaybackState.stopped.rawValue:
            self.player.playFromBeginning()
            break
        case PlaybackState.paused.rawValue:
            self.player.playFromCurrentTime()
            break
        case PlaybackState.playing.rawValue:
            self.player.pause()
            break
        case PlaybackState.failed.rawValue:
            self.player.pause()
            break
        default:
            self.player.pause()
            break
        }
    }
    
}
