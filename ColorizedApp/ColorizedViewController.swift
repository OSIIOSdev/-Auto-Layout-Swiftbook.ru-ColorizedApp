//
//  ViewController.swift
//  ColorizedApp
//
//  Created by OSIIOSdev on 08.03.2025.
//

import UIKit

class ColorizedViewController: UIViewController {
    
    // MARK: - Private properties
    
    
    // MARK: - View LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.4331257503, green: 0.5673388105, blue: 0.4240058524, alpha: 1)
        
        displayedColorView()
        displayedStackView()
    }
    
    
    // MARK: - Private methods

    private func displayedColorView() {
        view.addSubview(colorView)
        
        NSLayoutConstraint.activate([
            colorView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            colorView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            colorView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            colorView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    private func displayedStackView() {
        [settingsStackView, colorLabelStackView, colorValueStackView, colorSliderStackView].forEach {
            view.addSubview( $0 )
        }
        
        [colorLabelStackView, colorValueStackView, colorSliderStackView].forEach {
            settingsStackView.addArrangedSubview( $0 )
        }
        
        NSLayoutConstraint.activate([
            settingsStackView.topAnchor.constraint(equalTo: colorView.bottomAnchor, constant: 40),
            settingsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            settingsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    private lazy var settingsStackView = {
        let settingsStackView = UIStackView()
        
        settingsStackView.axis = .horizontal
        settingsStackView.distribution = .fill
        settingsStackView.alignment = .center
        settingsStackView.spacing = 5
        
        settingsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        return settingsStackView
    }()
    
    private lazy var colorLabelStackView = {
        let colorLabelStackView = UIStackView()
        
        colorLabelStackView.axis = .vertical
        colorLabelStackView.distribution = .fill
        colorLabelStackView.alignment = .leading
        colorLabelStackView.spacing = 25
        
        colorLabelStackView.translatesAutoresizingMaskIntoConstraints = false
        colorLabelStackView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        [getColorLabel(textLabel: "Red:"),
         getColorLabel(textLabel: "Green:"),
         getColorLabel(textLabel: "Blue:")].forEach {
            colorLabelStackView.addArrangedSubview( $0 )
        }
        
        return colorLabelStackView
    }()
    
    private lazy var colorValueStackView = {
        let colorValueStackView = UIStackView()
        
        colorValueStackView.axis = .vertical
        colorValueStackView.distribution = .fill
        colorValueStackView.alignment = .fill
        colorValueStackView.spacing = 25
        
        colorValueStackView.translatesAutoresizingMaskIntoConstraints = false
        colorValueStackView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        for _ in 0..<3 {
            colorValueStackView.addArrangedSubview(getColorLabel(textLabel: "0"))
        }
        
        return colorValueStackView
    }()
    
    private lazy var colorSliderStackView = {
        let colorSliderStackView = UIStackView()
        
        colorSliderStackView.axis = .vertical
        colorSliderStackView.distribution = .fill
        colorSliderStackView.alignment = .fill
        colorSliderStackView.spacing = 12
        
        colorSliderStackView.translatesAutoresizingMaskIntoConstraints = false
        
        // Как теперь добраться до свойства value каждого слайдера, и как передать значение свойства value в colorValueLabel для каждого цвета?
        
        [getColorSlider(tumbleColor: .systemRed, minTrackColor: #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)),
         getColorSlider(tumbleColor: .systemGreen, minTrackColor: #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)),
         getColorSlider(tumbleColor: .systemBlue, minTrackColor: #colorLiteral(red: 0.5369998813, green: 0.5776420236, blue: 0.9568473697, alpha: 1))].forEach {
            colorSliderStackView.addArrangedSubview( $0 )
        }
        
        return colorSliderStackView
    }()
    
    private lazy var colorView = {
        let colorView = UIView()
        
        colorView.backgroundColor = .systemBackground
        colorView.layer.cornerRadius = 20
        colorView.layer.borderWidth = 2.5
        colorView.layer.borderColor = UIColor.systemBackground.cgColor
        
        colorView.translatesAutoresizingMaskIntoConstraints = false
        
        return colorView
    }()
    
    private func getColorLabel(textLabel: String) -> UILabel {
        let colorLabel = UILabel()
        
        colorLabel.textColor = .white
        colorLabel.font = .boldSystemFont(ofSize: 14)
        colorLabel.text = textLabel
        
        colorLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return colorLabel
    }
    
    private func getColorSlider(tumbleColor: UIColor, minTrackColor: UIColor) -> UISlider {
        let colorSlider = UISlider()
        
        colorSlider.minimumValue = 0
        colorSlider.maximumValue = 1
        colorSlider.value = Float.random(in: colorSlider.minimumValue...colorSlider.maximumValue)
        colorSlider.maximumTrackTintColor = .systemBackground
        colorSlider.minimumTrackTintColor = minTrackColor
        colorSlider.thumbTintColor = tumbleColor
        
        colorSlider.translatesAutoresizingMaskIntoConstraints = false
        
        return colorSlider
    }
}

