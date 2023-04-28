//
//  HomeViewController.swift
//  Verregular
//
//  Created by Miroslav Deryuga on 22.04.2023.
//

import UIKit

class HomeViewController: UIViewController {
    // MARK: - GUI Variables for elements of graphic interface (Buttons)
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Verregular".uppercased()
        label.font = .boldSystemFont(ofSize: 28)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        
        return label
    }()
    
    private lazy var firstButton: UIButton = {
        let button = UIButton()
        // можно передать экшн в кач-ве параметра в функцию и она будет вызываться каждый раз при нажатии
        button.addTarget(self, action: #selector(goToSelectViewController), for: .touchUpInside)
        button.setTitleColor(UIColor.black, for: .normal)
        button.setTitle("Select Verbs".localized, for: .normal)
        button.backgroundColor = .systemMint
        button.layer.cornerRadius = cornerRadius
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private lazy var secondButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(goToTrainViewController), for: .touchUpInside)
        button.setTitleColor(UIColor.black, for: .normal)
        button.setTitle("Train Verbs".localized, for: .normal)
        button.backgroundColor = .systemMint
        button.layer.cornerRadius = cornerRadius
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    // MARK: - Properties
    private let cornerRadius: CGFloat = 20
    private let buttonHeigh: CGFloat = 80
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // добавить графич элементы на экран
        configureUI()
    }
    
    // MARK: - Private Methods
    @objc // для того чтобы реализовать селектор функция должна быть совместима с обжектив си
    // чтобы передать экшн в функцию
    private func goToSelectViewController() {
        // методы перехода на др экран
        navigationController?.pushViewController(SelectVerbsViewController(), animated: true)
        //navigationController?.present(SelectVerbsViewController(), animated: true) // контроллер отображается модально, частично
    }
    
    @objc
    private func goToTrainViewController() {
        // методы перехода на др экран
        navigationController?.pushViewController(TrainViewController(), animated: true)
        //navigationController?.present(SelectVerbsViewController(), animated: true) // контроллер отображается модально, частично
    }
    
    private func configureUI() {
        // добавить графич элементы на экран
        view.addSubview(titleLabel)
        view.addSubview(firstButton)
        view.addSubview(secondButton)
        view.backgroundColor = .white
        
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        firstButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        firstButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        firstButton.heightAnchor.constraint(equalToConstant: buttonHeigh).isActive = true
        firstButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: firstButton.topAnchor, constant: -80).isActive = true
        secondButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        secondButton.topAnchor.constraint(equalTo: firstButton.bottomAnchor, constant: 40).isActive = true
        secondButton.heightAnchor.constraint(equalToConstant: buttonHeigh).isActive = true
        secondButton.widthAnchor.constraint(equalTo: firstButton.widthAnchor).isActive = true
    }
}

