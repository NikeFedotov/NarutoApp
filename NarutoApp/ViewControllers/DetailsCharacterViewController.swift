//
//  DetailsCharacterViewController.swift
//  NarutoApp
//
//  Created by Никита on 16.03.2024.
//

import UIKit

final class DetailsCharacterViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var characterImageView: UIImageView! {
        didSet {
            characterImageView.contentMode = .scaleAspectFill
            characterImageView.clipsToBounds = true
            characterImageView.layer.cornerRadius = characterImageView.frame.height / 2
            characterImageView.backgroundColor = .white
        }
    }
    @IBOutlet weak var characterDescriprionLabel: UILabel!
    
    // MARK: - Public properties
    var character: Character!
    
    // MARK: - Private Properties
    private let networkManager = NetworkManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        characterDescriprionLabel.text = character.description
        fetchImage()
    }
    
    private func fetchImage() {
        guard let imageURL = character.images?.first else { return }
        networkManager.fetchImage(from: imageURL) { result in
            switch result {
            case .success(let image):
                self.characterImageView.image = UIImage(data: image)
            case .failure(let error):
                print(error)
            }
        }
    }
}
