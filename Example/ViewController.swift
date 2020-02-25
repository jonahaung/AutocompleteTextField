//
//  ViewController.swift
//  BalarSarYwat
//
//  Created by Aung Ko Min on 25/2/20.
//  Copyright © 2020 Aung Ko Min. All rights reserved.
//

import UIKit
import AutocompleteTextField

class ViewController: UIViewController {
    let domainCompletionSource = DomainCompletionSource()
    let textField = AutocompleteTextField()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Autocomplete"
        navigationItem.largeTitleDisplayMode = .always
        
        textField.layer.borderColor = UIColor.separator.cgColor
//        textField.layer.borderWidth = 0.5
        textField.keyboardType = .webSearch
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.completionSource = domainCompletionSource
        textField.accessibilityLabel = "Domain"
        textField.font = UIFont.preferredFont(forTextStyle: .title1)
//        textField.textColor = UIColor.blue
        view.addSubview(textField)

        let line = UIView()
        line.translatesAutoresizingMaskIntoConstraints = false
        line.backgroundColor = UIColor.label
        view.addSubview(line)
        textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            line.trailingAnchor.constraint(equalTo: textField.trailingAnchor),
            line.leadingAnchor.constraint(equalTo: textField.leadingAnchor),
            line.bottomAnchor.constraint(equalTo: textField.bottomAnchor),
            line.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        textField.becomeFirstResponder()
    }
}
