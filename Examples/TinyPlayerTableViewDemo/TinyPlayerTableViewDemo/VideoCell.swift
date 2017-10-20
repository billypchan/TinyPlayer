//
//  VideoCell.swift
//  TinyPlayerTableViewDemo
//
//  Created by chan bill on 19/10/2017.
//  Copyright © 2017 chan bill. All rights reserved.
//

import UIKit
import TinyPlayer

class VideoCell: UITableViewCell {

    internal var viewModel: VideoPlayerViewModel!
    internal var projectionView: TinyVideoProjectionView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewModel = VideoPlayerViewModel()

        projectionView = viewModel.tinyPlayer.generateVideoProjectionView()
        self.contentView.addSubview(projectionView)
        

        /*
         Setup player view constrains.
         */
        projectionView.translatesAutoresizingMaskIntoConstraints = false
        
        projectionView.topAnchor
            .constraint(equalTo: self.contentView.topAnchor, constant: 0.0).isActive = true
        projectionView.bottomAnchor
            .constraint(equalTo: self.contentView.bottomAnchor, constant: 0.0).isActive = true
        projectionView.leftAnchor
            .constraint(equalTo: self.contentView.leftAnchor, constant: 0.0).isActive = true
        projectionView.rightAnchor
            .constraint(equalTo: self.contentView.rightAnchor, constant: 0.0).isActive = true

//        viewModel.tinyPlayer.play()
    }

    func togglePlay() {
        if viewModel.tinyPlayer.playbackState == .playing {
            viewModel.tinyPlayer.pause()
        }
        else {
            viewModel.tinyPlayer.play()
        }
    }
    
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//
//        // Configure the view for the selected state
//    }

    deinit {
        viewModel = nil
        print("VideoCell is dealloced.")
    }

}
