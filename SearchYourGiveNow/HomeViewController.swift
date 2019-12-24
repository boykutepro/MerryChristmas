//
//  HomeViewController.swift
//  SearchYourGiveNow
//
//  Created by Thiện Tùng on 12/23/19.
//  Copyright © 2019 tung. All rights reserved.
//

import UIKit

import AVFoundation

class HomeViewController: UIViewController {

    let background: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "background")
        view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        view.contentMode = .scaleAspectFill
        
        return view
    }()
    
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    } ()
    
    let titleTop: UIImageView = {
        let image = UIImageView ()
        image.image = UIImage(named: "titleCM")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    let imageBor: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "avtbor")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        
        return image
    } ()
    
    let avt: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "avt")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .black
        image.clipsToBounds = true
        return image
    }()
    let button: UIButton = {
        let button = UIButton()
        button.setTitle("Touch here :'>", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.red, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    } ()
    
    var soundPlayer: AVAudioPlayer?
    var isRunning: Bool = false
    var timer: Timer!
    var trans:Float = 0
    
    var label: UILabel = {
        var label = UILabel()
        label.text = "HAPPY NEW YEAR"
        label.font = UIFont(name: "DancingScript-Bold", size: 32)
        
        return label
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view.addSubview(background)
        view.addSubview(containerView)
        containerView.addSubview(imageBor)
        containerView.addSubview(titleTop)
        containerView.addSubview(avt)
        containerView.addSubview(button)
        view.addSubview(label)
        
        setup()
        
        button.addTarget(self, action: #selector(touchButton), for: .touchUpInside)
        
        
    }
    @objc func touchButton(){
        
        UIView.animate(withDuration: 2) {
            self.label.center.y = self.view.center.y - 50
        }
        
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(runTimer), userInfo: nil, repeats: true)
        playSound()
//        isRunning = !isRunning
//        pause()
//        if isRunning {
//            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(runTimer), userInfo: nil, repeats: true)
//            playSound()
//        } else {
//            timer.invalidate()
//            pause()
//        }

    }
    func playSound()
    {
        let path = Bundle.main.path(forResource: "JingleBells.mp3", ofType: nil)!
        let url = URL(fileURLWithPath: path)
        
        do{
            soundPlayer = try AVAudioPlayer(contentsOf: url)
            soundPlayer?.play()
            //Đặt numberOfLoops = -1 để nó chạy lại khi chạy hết
            soundPlayer?.numberOfLoops = -1
        }catch{
            print("error")
            //coundn't load file :(
        }
    }
    
    @objc func runTimer(){
        
        trans += 0.05
        var rads = .pi/30 * CGFloat(trans)
        
        self.avt.transform = CGAffineTransform(rotationAngle: rads)
        
    }
    
    func setup(){
        containerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        containerView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        containerView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        //MARK: TITLE
        titleTop.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10).isActive = true
        titleTop.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 54).isActive = true
        titleTop.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -54).isActive = true
        titleTop.heightAnchor.constraint(equalTo: titleTop.widthAnchor, multiplier: 1.2).isActive = true
        //MARK: Image Border
        imageBor.centerXAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 0).isActive = true
        imageBor.topAnchor.constraint(equalTo: titleTop.bottomAnchor, constant: 0).isActive = true
        imageBor.heightAnchor.constraint(equalToConstant: 200).isActive = true
        imageBor.widthAnchor.constraint(equalToConstant: 200).isActive = true
        imageBor.alpha = 0.8
        //MARK:  AVT
        avt.centerXAnchor.constraint(equalTo: imageBor.centerXAnchor, constant: 0).isActive = true
        avt.centerYAnchor.constraint(equalTo: imageBor.centerYAnchor, constant: -5).isActive = true
        avt.heightAnchor.constraint(equalToConstant: 180).isActive = true
        avt.widthAnchor.constraint(equalToConstant: 180).isActive = true
        avt.layer.cornerRadius = 90
        //MARK: Button
        button.centerXAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 0).isActive = true
        button.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20).isActive = true
        button.heightAnchor.constraint(equalToConstant: 60).isActive = true
        button.widthAnchor.constraint(equalToConstant: 200).isActive = true
        button.layer.cornerRadius = 20
        button.layer.shadowColor = UIColor.red.cgColor
        button.layer.shadowOffset = CGSize(width: button.bounds.width+3, height: button.bounds.height+3)
        button.layer.shadowOpacity = 0.5
        //Label
               
        label.frame = CGRect(x: 0, y: view.bounds.height, width: 270, height: 100)
               label.center.x = view.center.x
        
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
