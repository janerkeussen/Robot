//
//  ViewController.swift
//  Robot
//
//  Created by Zhanerke Ussen on 04/07/2023.
//

import UIKit

class ViewController: UIViewController {
    private let head = UIView()
    private let antenna = UIView()
    private let antennaBall = UIView()
    private let eye = UIView()
    private let eyeBall = UIView()
    private let eye2 = UIView()
    private let eyeBall2 = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setSubviews()
        setConstraints()
        drawHead()
        drawEyes()
        setEyeConstraints()
        drawMouth()
    }
    
    private func setSubviews() {
        [head, antenna, antennaBall].forEach { view.addSubview($0) }
        [eye, eye2].forEach { head.addSubview($0) }
        eye.addSubview(eyeBall)
        eye2.addSubview(eyeBall2)
    }
    
    private func setConstraints() {
        var constraints = [NSLayoutConstraint]()
        
        head.translatesAutoresizingMaskIntoConstraints = false
        antenna.translatesAutoresizingMaskIntoConstraints = false
        antennaBall.translatesAutoresizingMaskIntoConstraints = false
        
        constraints += [head.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                        head.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                        head.heightAnchor.constraint(equalToConstant: 200),
                        head.widthAnchor.constraint(equalToConstant: 300)
        ]
        
        constraints += [antenna.bottomAnchor.constraint(equalTo: head.topAnchor),
                        antenna.centerXAnchor.constraint(equalTo: head.centerXAnchor),
                        antenna.heightAnchor.constraint(equalToConstant: 100),
                        antenna.widthAnchor.constraint(equalToConstant: 6)
        ]
        
        constraints += [antennaBall.centerXAnchor.constraint(equalTo: antenna.centerXAnchor),
                        antennaBall.bottomAnchor.constraint(equalTo: antenna.topAnchor),
                        antennaBall.heightAnchor.constraint(equalToConstant: 24),
                        antennaBall.widthAnchor.constraint(equalToConstant: 24),
         ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func drawHead() {
        head.backgroundColor = .systemTeal.withAlphaComponent(0.9)
        head.layer.cornerRadius = 30
        head.layer.borderColor = UIColor.black.cgColor
        head.layer.borderWidth = 3
        
        antenna.backgroundColor = .black
        
        antennaBall.layer.borderColor = UIColor.black.cgColor
        antennaBall.layer.borderWidth = 2
        antennaBall.layer.cornerRadius = 12
        antennaBall.backgroundColor = .red
    }
    
    private func drawEyes() {
        eye.layer.borderWidth = 2
        eye.backgroundColor = UIColor.orange
        eye.layer.cornerRadius = 30
        
        eye2.layer.borderWidth = 2
        eye2.backgroundColor = UIColor.orange
        eye2.layer.cornerRadius = 30
        
        eyeBall.backgroundColor = UIColor.white
        eyeBall.layer.cornerRadius = 10
        
        eyeBall2.backgroundColor = UIColor.white
        eyeBall2.layer.cornerRadius = 10
    }
    
    private func setEyeConstraints() {
        var constraints = [NSLayoutConstraint]()
        
        eye.translatesAutoresizingMaskIntoConstraints = false
        eye2.translatesAutoresizingMaskIntoConstraints = false
        eyeBall.translatesAutoresizingMaskIntoConstraints = false
        eyeBall2.translatesAutoresizingMaskIntoConstraints = false
        
        constraints += [eye.leadingAnchor.constraint(equalTo: head.leadingAnchor, constant: 20),
                        eye.topAnchor.constraint(equalTo: head.topAnchor, constant: 20),
                        eye.heightAnchor.constraint(equalToConstant: 60),
                        eye.widthAnchor.constraint(equalToConstant: 60)
        ]
        
        constraints += [eye2.trailingAnchor.constraint(equalTo: head.trailingAnchor, constant: -20),
                        eye2.centerYAnchor.constraint(equalTo: eye.centerYAnchor),eye2.heightAnchor.constraint(equalToConstant: 60),
                        eye2.widthAnchor.constraint(equalToConstant: 60)
        ]
        
        constraints += [eyeBall.bottomAnchor.constraint(equalTo: eye.bottomAnchor, constant: -10),
                        eyeBall.trailingAnchor.constraint(equalTo: eye.trailingAnchor, constant: -10),
                        eyeBall.heightAnchor.constraint(equalToConstant: 20),
                        eyeBall.widthAnchor.constraint(equalToConstant: 20)
        ]
        
        constraints += [eyeBall2.bottomAnchor.constraint(equalTo: eye2.bottomAnchor, constant: -10),
                        eyeBall2.leadingAnchor.constraint(equalTo: eye2.leadingAnchor, constant: 10),
                        eyeBall2.heightAnchor.constraint(equalToConstant: 20),
                        eyeBall2.widthAnchor.constraint(equalToConstant: 20),
         ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func drawMouth() {
        for num in 0...6 {
            let tooth = UIView()
            tooth.layer.cornerRadius = 13
            tooth.layer.borderWidth = 2
            tooth.layer.borderColor = UIColor.black.cgColor
            tooth.backgroundColor = .white
            head.addSubview(tooth)
            setConstraints(tooth: tooth, number: num)
            
        }
    }
    
    private func setConstraints(tooth: UIView, number: Int) {
        var constraints = [NSLayoutConstraint]()
        
        
        tooth.translatesAutoresizingMaskIntoConstraints = false
        
        constraints += [tooth.leadingAnchor.constraint(equalTo: head.leadingAnchor, constant: CGFloat(number*25) + 55),
                        tooth.bottomAnchor.constraint(equalTo: head.bottomAnchor, constant: number % 2 == 0 ? -10 : -12),
                        tooth.heightAnchor.constraint(equalToConstant: 80),
                        tooth.widthAnchor.constraint(equalToConstant: 26)
        ]
        
        
        NSLayoutConstraint.activate(constraints)
    }
}
