//
//  LoginScreenViewController.swift
//  SearchYourGiveNow
//
//  Created by Thiện Tùng on 12/23/19.
//  Copyright © 2019 tung. All rights reserved.
//

import UIKit

class LoginScreenViewController: UIViewController, UIScrollViewDelegate {
    let topLabel: UILabel = {
        let label = UILabel ()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont(name: "DancingScript-Bold", size: 32)
        label.textColor = .black
        label.numberOfLines = 3
        
        return label
    } ()
    
    let fbLogin: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = #colorLiteral(red: 0.09913571501, green: 0.1597997774, blue: 0.3629776554, alpha: 1)
        button.setTitle("      Connect with Facebook", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 20
        button.titleLabel?.textAlignment = .center
        
        return button
    }()
    
    let gmLogin: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .red
        button.setTitle("        Login with Gmail", for: .normal)
        button.layer.cornerRadius = 20
        button.setTitleColor(.white, for: .normal)
        
        return button
    } ()
    
    let iconFb: UIImageView = {
        let icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.image = UIImage(named: "iconFB")
        icon.contentMode = .scaleAspectFit
        
        return icon
    } ()
    let iconGm: UIImageView = {
        let icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.image = UIImage(named: "iconGM")
        icon.contentMode = .scaleAspectFit
        
        return icon
    } ()
    
    var scrollView: UIScrollView = {
        var scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return scrollView
    }()
    let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.pageIndicatorTintColor = .white
        pageControl.currentPageIndicatorTintColor = .red
        
        return pageControl
    }()
    let containerView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        return view
    } ()
    let imageBackground: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Christmas")
        image.contentMode = .scaleAspectFill
        image.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        image.alpha = 0.8
        
        return image
    }()
    var timer: Timer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        setupLayout()
        scrollViewDidScroll(scrollView)
        timer = Timer.scheduledTimer(timeInterval: 2.4, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        
        fbLogin.addTarget(self, action: #selector(login), for: .touchUpInside)
        gmLogin.addTarget(self, action: #selector(login), for: .touchUpInside)
        
    }
    
    @objc func login(){
        let seconVC = HomeViewController()
        seconVC.title = ""
        let navigation = UINavigationController(rootViewController: seconVC)
        navigation.modalPresentationStyle = .fullScreen
        navigation.isNavigationBarHidden = true
        present(navigation, animated: true, completion: nil)
    }
    var xOffset: CGFloat = 0
    
    @objc func timerAction() {
        
        if xOffset > (containerView.bounds.width - 88) {
            xOffset = 0
            DispatchQueue.main.async {
                UIView.animate(withDuration: 1) {
                    self.scrollView.contentOffset.x = self.xOffset
                }
            }
            
        }else{
            xOffset += containerView.bounds.width - 88
            DispatchQueue.main.async {
                UIView.animate(withDuration: 0.7) {
                    self.scrollView.contentOffset.x = self.xOffset
                }
            }
        }
    }
    
    
    
    
    func setupLayout() {
        //MARK: ADD View
        
        view.addSubview(imageBackground)
        view.addSubview(containerView)
        containerView.addSubview(topLabel)
        containerView.addSubview(scrollView)
        containerView.addSubview(pageControl)
        containerView.addSubview(fbLogin)
        fbLogin.addSubview(iconFb)
        containerView.addSubview(gmLogin)
        gmLogin.addSubview(iconFb)
        
        //MARK: Setup Label
        topLabel.text = "MERRY CHRISTMAS                       AND                   HAPPY NEW YEAR"
        topLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        topLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 32).isActive = true
        topLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -32).isActive = true
        topLabel.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        //MARK: ScrollView
        scrollView.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 0).isActive = true
        scrollView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 44).isActive = true
        scrollView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -44).isActive = true
        scrollView.heightAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 1).isActive = true
        scrollView.bounces = false
        scrollView.showsHorizontalScrollIndicator = false
        // Set image scroll view
        let width = containerView.bounds.width - 88
        let height = width
        let images: [UIImage] = [UIImage(named: "Gift1")!, UIImage(named: "Gift2")!, UIImage(named: "Gift3")!]
        for i in 0..<images.count{
            let imageView = UIImageView()
            imageView.image = images[i]
            imageView.contentMode = .scaleAspectFill
            imageView.frame = CGRect(x: width*CGFloat(i), y: 0, width: width, height: width)
            
            scrollView.addSubview(imageView)
            
        }
        
        scrollView.contentSize = CGSize(width: width * 3, height: height)
        scrollView.isPagingEnabled = true
        
        //Page number
        
        pageControl.topAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0).isActive = true
        pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        pageControl.heightAnchor.constraint(equalToConstant: 20).isActive = true
        pageControl.numberOfPages = images.count
        pageControl.currentPage = 0
        scrollView.delegate = self
        //MARK: Login FB
        fbLogin.topAnchor.constraint(equalTo: pageControl.bottomAnchor, constant: 45).isActive = true
        fbLogin.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 32).isActive = true
        fbLogin.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant:
            -32).isActive = true
        fbLogin.heightAnchor.constraint(equalToConstant: 55).isActive = true
        
        fbLogin.addSubview(iconFb)
        iconFb.topAnchor.constraint(equalTo: fbLogin.topAnchor, constant: 5).isActive = true
        iconFb.leftAnchor.constraint(equalTo: fbLogin.leftAnchor, constant: 10).isActive = true
        iconFb.bottomAnchor.constraint(equalTo: fbLogin.bottomAnchor, constant: -5).isActive = true
        iconFb.heightAnchor.constraint(equalTo: iconFb.widthAnchor, multiplier: 1).isActive = true
        //MARK: Login GM
        gmLogin.topAnchor.constraint(equalTo: fbLogin.bottomAnchor, constant: 15).isActive = true
        gmLogin.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 32).isActive = true
        gmLogin.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant:
            -32).isActive = true
        gmLogin.heightAnchor.constraint(equalToConstant: 55).isActive = true
        
        gmLogin.addSubview(iconGm)
        iconGm.topAnchor.constraint(equalTo: gmLogin.topAnchor, constant: 5).isActive = true
        iconGm.leftAnchor.constraint(equalTo: gmLogin.leftAnchor, constant: 10).isActive = true
        iconGm.bottomAnchor.constraint(equalTo: gmLogin.bottomAnchor, constant: -5).isActive = true
        iconGm.heightAnchor.constraint(equalTo: iconGm.widthAnchor, multiplier: 1).isActive = true
       
        
        
        
        
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let pageIndex = round(scrollView.contentOffset.x/(containerView.bounds.width - 88))
        pageControl.currentPage = Int(pageIndex)
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
