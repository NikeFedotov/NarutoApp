//
//  DetailsCharacterViewController.swift
//  NarutoApp
//
//  Created by Никита on 16.03.2024.
//

import UIKit
import Kingfisher

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
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        characterDescriprionLabel.text = character.description
        fetchImage()
    }
    // MARK: - Private methods
    private func fetchImage() {
        let processor = DownsamplingImageProcessor(size: characterImageView.bounds.size)
        guard let imageURL = URL(string: character.images?.first ?? "") else { return }
        characterImageView.kf.setImage(
            with: imageURL,
            options: [ .processor(processor), .transition(.fade(0.25)) ])
    }
}
