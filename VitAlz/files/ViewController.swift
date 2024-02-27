//
//  ViewController.swift
//  Tilez
//
//  Created by Aster Li on 2/17/24.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    @IBOutlet weak var startGameButton: UIButton!
    @IBOutlet var soundButton: [UIButton]!
    @IBOutlet weak var levelLabel: UILabel!
        
    var sound1Player:AVAudioPlayer!
    var sound2Player:AVAudioPlayer!
    var sound3Player:AVAudioPlayer!
    var sound4Player:AVAudioPlayer!
    
    var playlist = [Int]()
    var currentItem = 0
    var numberOfTaps = 0
    var readyForUser = false
    
    var level = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        levelLabel.text = "Al Says...\nPress play to start!"
        
        setupAudioFiles()
        
    }

    func setupAudioFiles() {
        do {
            if let soundFilePath = Bundle.main.url(forResource: "1", withExtension: "wav") {
                sound1Player = try AVAudioPlayer(contentsOf: soundFilePath)
                sound1Player.delegate = self
                sound1Player.numberOfLoops = 0
            } else {
                print("Error: Could not find sound file '1.wav'")
            }
            
            if let soundFilePath2 = Bundle.main.url(forResource: "2", withExtension: "wav") {
                sound2Player = try AVAudioPlayer(contentsOf: soundFilePath2)
                sound2Player.delegate = self
                sound2Player.numberOfLoops = 0
            } else {
                print("Error: Could not find sound file '2.wav'")
            }
            
            if let soundFilePath3 = Bundle.main.url(forResource: "3", withExtension: "wav") {
                sound3Player = try AVAudioPlayer(contentsOf: soundFilePath3)
                sound3Player.delegate = self
                sound3Player.numberOfLoops = 0
            } else {
                print("Error: Could not find sound file '3.wav'")
            }
            
            if let soundFilePath4 = Bundle.main.url(forResource: "4", withExtension: "wav") {
                sound4Player = try AVAudioPlayer(contentsOf: soundFilePath4)
                sound4Player.delegate = self
                sound4Player.numberOfLoops = 0
            } else {
                print("Error: Could not find sound file '4.wav'")
            }
        } catch {
            print("Error initializing AVAudioPlayer: \(error)")
        }
    }

    @IBAction func soundButtonPressed(_ sender: Any) {
        if readyForUser {
            let button = sender as! UIButton
            button.alpha = 0.5
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                button.alpha = 1.0
            }
            switch button.tag {
            case 1:
                sound1Player.play();
                checkIfCorrect(buttonPressed: 1)
                break
            case 2:
                sound2Player.play();
                checkIfCorrect(buttonPressed: 2)
                break
            case 3:
                sound3Player.play();
                checkIfCorrect(buttonPressed: 3)
                break
            case 4:
                sound4Player.play();
                checkIfCorrect(buttonPressed: 4)
                break
            default:
                break
            }
        }
    }
    
    func checkIfCorrect (buttonPressed:Int) {
        if buttonPressed == playlist[numberOfTaps] {
            if numberOfTaps == playlist.count - 1 {
                let time = DispatchTime.now() + DispatchTimeInterval.nanoseconds(Int(NSEC_PER_SEC))
                DispatchQueue.main.asyncAfter(deadline: time) {
                    self.nextRound()
                }
                return
            }
            numberOfTaps += 1
        } else { // GAME OVER
            resetGame()
        }
    }
    
    func resetGame() {
        level = 1
        readyForUser = false
        numberOfTaps = 0
        currentItem = 0
        playlist = []
        levelLabel.text = """
            Wrong color.
            Al Says...
            Let's try again!
        """
        startGameButton.isHidden = false
        disableButtons()
    }
    
    func nextRound() {
        level += 1
        levelLabel.text = "Level \(level)\nAl says..."
        readyForUser = false
        numberOfTaps = 0
        currentItem = 0
        disableButtons()
        
        let randomNumber = Int(arc4random_uniform(4) + 1)
        playlist.append(randomNumber)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.playNextItem()
        }
    }

    @IBAction func startGame(_ sender: Any) {
        levelLabel.text = "Level 1\nAl Says..."
        disableButtons()
        let randomNumber = Int(arc4random_uniform(4) + 1)
        playlist.append(randomNumber)
        startGameButton.isHidden = true
        playNextItem()
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        if currentItem <= playlist.count - 1 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                self.playNextItem()
            }
        } else {
            readyForUser = true
            resetButtonHighlights()
            enableButtons()
        }
    }
    
    func playNextItem () {
        let selectedItem = playlist[currentItem]
        
        switch selectedItem {
        case 1:
            highlightButtonWithTag(tag:1)
            sound1Player.play()
            break
        case 2:
            highlightButtonWithTag(tag:2)
            sound2Player.play()
            break
        case 3:
            highlightButtonWithTag(tag:3)
            sound3Player.play()
            break
        case 4:
            highlightButtonWithTag(tag:4)
            sound4Player.play()
            break
        default:
            break
        }
        currentItem += 1
    }
    
    func highlightButtonWithTag (tag:Int) {
        switch tag {
        case 1:
            resetButtonHighlights()
            soundButton[tag - 1].setImage(UIImage(named: "redPressed"), for: .normal)
        case 2:
            resetButtonHighlights()
            soundButton[tag - 1].setImage(UIImage(named: "yellowPressed"), for: .normal)
        case 3:
            resetButtonHighlights()
            soundButton[tag - 1].setImage(UIImage(named: "bluePressed"), for: .normal)
        case 4:
            resetButtonHighlights()
            soundButton[tag - 1].setImage(UIImage(named: "greenPressed"), for: .normal)
        default:
            break
        }
    }
    
    func resetButtonHighlights () {
        soundButton[0].setImage(UIImage(named: "red"), for: .normal)
        soundButton[1].setImage(UIImage(named: "yellow"), for: .normal)
        soundButton[2].setImage(UIImage(named: "blue"), for: .normal)
        soundButton[3].setImage(UIImage(named: "green"), for: .normal)
    }
    
    func disableButtons () {
        for button in soundButton {
            button.isUserInteractionEnabled = false
        }
    }
    
    func enableButtons () {
        for button in soundButton {
            button.isUserInteractionEnabled = true
        }
    }
    
}

