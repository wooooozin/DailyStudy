//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Btn: UIButton!
    @IBOutlet weak var Choice2Btn: UIButton!
    
    var storyBrain = StoryBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        
    
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        storyBrain.nextStory(userChoice: sender.currentTitle!)
        updateUI()

    }
    
    func updateUI() {
        storyLabel.text = storyBrain.getStoryTitle()
        choice1Btn.setTitle(storyBrain.getChoice1(), for: .normal)
        Choice2Btn.setTitle(storyBrain.getChoice2(), for: .normal)
    }
    
}

