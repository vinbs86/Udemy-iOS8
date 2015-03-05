//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Simon Cronly-Dillon on 30/12/2014.
//  Copyright (c) 2014 dataclones. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var goNumber = 1
    
    var winner = 0
    
    // 0 = empty, 1 = nought, 2 = cross
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    // 0 1 2
    // 3 4 5
    // 6 7 8
    
    // Arrays within Arrays
    let winningCombinations = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    
    @IBOutlet weak var button0: UIButton!
    
    @IBOutlet weak var label: UILabel!
    
    
    @IBOutlet weak var playAgain: UIButton!
    
    @IBAction func playAgainPressed(sender: AnyObject) {
        
        // Reset the game
        
        goNumber = 1
        winner = 0
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        
        // re-Hide label & button
        label.alpha = 0
        playAgain.alpha = 0

      
        // Remove all 9 button images on the grid
        var button : UIButton
        for var i = 0; i < 9; i++ {
            
            button = view.viewWithTag(i) as UIButton
            button.setImage(nil, forState: .Normal)
            println(i)
            
        }
        
    }
    
    @IBAction func buttonPressed(sender: AnyObject) {
        // ALL 9 buttons are ctrl+dragged here
        // sender refers to the button pressed
        
        if (gameState[sender.tag]==0 && winner == 0) {
            // Check that the position isn't already taken
            // And the game hasn't been won already
            // Before posting x or o
        
        var image = UIImage ()
        
        if (goNumber%2 == 0) {
            
            image = UIImage (named: "cross.png")!
            
            gameState[sender.tag] = 2
            
        } else {
            
            image = UIImage (named: "nought.png")!
          
            gameState[sender.tag] = 1
        }
            // CHECK FOR A WIN:
            // Are all positions in winning combinations the same type
            
            for combination in winningCombinations{
                
                if (gameState[combination[0]]==gameState[combination[1]] && gameState[combination[1]]==gameState[combination[2]] && gameState[combination[0]] != 0) {
                
                winner = gameState[combination[0]]
                
                }
                
            }
            
            if (winner != 0) {
                
                if (winner == 1) {
                    
                    label.text = "Noughts Win"
                    label.backgroundColor = UIColor.blueColor().colorWithAlphaComponent(0.8)
                    //label.backgroundColor = (blue: 1, alpha: 0.5)
                } else {
                    
                    label.text = "Crosses Win"
                    label.backgroundColor = UIColor.redColor().colorWithAlphaComponent(0.8)

                }
                
                // Winning animations
                println("we have a winner")
                
                // Slide winner in from left
                label.alpha = 1
                UIView.animateWithDuration(0.4, animations: {
                    self.label.center = CGPointMake(self.label.center.x + 400, self.label.center.y)
                })
                
                // Fade in playAgain button
                self.playAgain.alpha = 1
            }
            
        goNumber++
        
        sender.setImage (image, forState: .Normal)
            
            if (goNumber > 9 && winner == 0) {
                
                // If no winner after 9 moves its a draw
                
                println("Draw")
                label.text = "It's a draw!"
                label.alpha = 1
                label.backgroundColor = UIColor.blackColor()
                label.textColor = UIColor.whiteColor()
                UIView.animateWithDuration(0.8, animations: {
                    self.label.center = CGPointMake(self.label.center.x + 400, self.label.center.y)
                })
                
                // Fade in playAgain button
                self.playAgain.alpha = 1
            }

        
        
    }
}


    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        
        // Called after everything is created but before it appears on screen
        
        //label.text = ""
        // Move label off to left so it can slide in
        label.center = CGPointMake(label.center.x - 400, label.center.y)
        
        // Fade out playAgain so it's invisible normally
        playAgain.alpha = 0
        
        
    }


}

