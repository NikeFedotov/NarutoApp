//
//  TableViewCell.swift
//  NarutoApp
//
//  Created by Никита on 13.03.2024.
//

import UIKit

final class TableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var characterImageView: UIImageView! {
        didSet {
            characterImageView.contentMode = .scaleAspectFill
            characterImageView.clipsToBounds = true
            characterImageView.layer.cornerRadius = characterImageView.frame.height / 2
            characterImageView.backgroundColor = .white
        }
    }
    
    private let networkManager = NetworkManager.shared
 
    // MARK: - Public methods
    func configure(with character: Character?) {
        guard let character else { return }
        guard let characterImage = character.images?.first else { return }
        nameLabel.text = character.name
            networkManager.fetchImage(from: characterImage) { result in
                switch result {
                case .success(let data):
                    self.characterImageView.image = UIImage(data: data)
                case .failure(_):
                    self.characterImageView.image = UIImage(named: "noImage")
                }
        }
    }

}
