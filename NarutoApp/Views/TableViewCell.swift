//
//  TableViewCell.swift
//  NarutoApp
//
//  Created by Никита on 13.03.2024.
//

import UIKit
import Kingfisher

final class TableViewCell: UITableViewCell {
    // MARK: - IBOutlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var characterImageView: UIImageView! {
        didSet {
            characterImageView.contentMode = .scaleAspectFill
            characterImageView.clipsToBounds = true
            characterImageView.layer.cornerRadius = characterImageView.frame.height / 2
            characterImageView.backgroundColor = .white
        }
    }
    
    //MARK: Private properties
    private let networkManager = NetworkManager.shared
 
    // MARK: - Public methods
    func configure(with character: Character) {
        nameLabel.text = character.name
        let placeholder = UIImage(named: "noImage")
        guard let characterImage = character.images?.first else { return }
        guard let url = URL(string: characterImage) else { return }
        characterImageView.kf.setImage(
            with: url,
            placeholder: placeholder,
            options: [ .transition(.fade(0.25)) ]
        )
    }
}
