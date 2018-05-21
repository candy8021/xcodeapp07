//
//  GameViewController.swift
//  xcodeapp07
//
//  Created by stoller on 2018/5/15.
//  Copyright © 2018年 hung. All rights reserved.
//

import UIKit
import GameplayKit

class GameViewController: UIViewController {
    
    
    @IBOutlet var player1CardsView: [UIImageView]!
    @IBOutlet var player2CardsView: [UIImageView]!
    
    @IBOutlet weak var player1turn: UIImageView!
    @IBOutlet weak var player2turn: UIImageView!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var showButton: UIButton!
    @IBOutlet weak var NextButton: UIButton!
    
    @IBOutlet var Player1CardsChoice: [UILabel]!
    
    @IBOutlet var Player2CardsChoice: [UILabel]!
    
    @IBOutlet weak var Points: UILabel!
    
    var player1CardsShow1 = player1cardsShow1
    var player1CardsShow2 = player1cardsShow2
    var player1CardsShow3 = player1cardsShow3
    var player1CardsShow4 = player1cardsShow4
    var player1CardsShow5 = player1cardsShow5
    var player2CardsShow1 = player2cardsShow1
    var player2CardsShow2 = player2cardsShow2
    var player2CardsShow3 = player2cardsShow3
    var player2CardsShow4 = player2cardsShow4
    var player2CardsShow5 = player2cardsShow5
    
    var currentPoints = 0
    
    // 洗牌
    let distribution = GKShuffledDistribution(lowestValue: 0, highestValue: cards.count - 1)
    
    // 遊戲開始
    @IBAction func StartGame(_ sender: Any) {
        
        Points.text=""
        
        player1CardsView[0].isHidden = false
        player1CardsView[1].isHidden = false
        player1CardsView[2].isHidden = false
        player1CardsView[3].isHidden = false
        player1CardsView[4].isHidden = false
        player2CardsView[0].isHidden = false
        player2CardsView[1].isHidden = false
        player2CardsView[2].isHidden = false
        player2CardsView[3].isHidden = false
        player2CardsView[4].isHidden = false
        
        // 按鈕狀態
        startButton.isEnabled = false
        showButton.isEnabled = true
        NextButton.isEnabled = false
        
        Points.text = "\(currentPoints)"
        
        player1turn.isHidden = false
        player2turn.isHidden = true
        
        //牌上花色點數
        Player1CardsChoice[0].text=player1CardsShow1
        Player1CardsChoice[1].text=player1CardsShow2
        Player1CardsChoice[2].text=player1CardsShow3
        Player1CardsChoice[3].text=player1CardsShow4
        Player1CardsChoice[4].text=player1CardsShow5
        
        Player2CardsChoice[0].text=player2CardsShow1
        Player2CardsChoice[1].text=player2CardsShow2
        Player2CardsChoice[2].text=player2CardsShow3
        Player2CardsChoice[3].text=player2CardsShow4
        Player2CardsChoice[4].text=player2CardsShow5
    }
    
    //顯示手牌
    @IBAction func ShowCards(_ sender: Any) {
        print("seeCard")
        
        if player2turn.isHidden == true {
            player1CardsView[0].isHidden = true
            player1CardsView[1].isHidden = true
            player1CardsView[2].isHidden = true
            player1CardsView[3].isHidden = true
            player1CardsView[4].isHidden = true
        }else{
            player2CardsView[0].isHidden = true
            player2CardsView[1].isHidden = true
            player2CardsView[2].isHidden = true
            player2CardsView[3].isHidden = true
            player2CardsView[4].isHidden = true
        }
        NextButton.isEnabled = true
    }
    
    var point = 0
    
    //玩家點擊手中五張牌之一
    @IBAction func player1CardsPressed(_ sender: UIButton) {
        
        let number = sender.tag
        print (number)
        
        var count = number
        Player1CardsChoice[count].text = cards[distribution.nextInt()]
        currentPoints += pointsJudgment(card: Player1CardsChoice[count].text!)
        if Player1CardsChoice[count].text!.contains("K") {
            currentPoints=99
        }
        else if Player1CardsChoice[count].text!.contains("♠︎A") {
            currentPoints=0
        }
        else if Player2CardsChoice[count].text!.contains("10") {
            addminus10()
        }
        else if Player2CardsChoice[count].text!.contains("Q") {
            addminus20 ()
        }
        Points.text = "\(currentPoints)"
        
        if currentPoints > 99 {
            bust()
        }
        showButton.isEnabled = true
        NextButton.isEnabled = true
    }
    @IBAction func player2CardsPressed(_ sender: UIButton) {
        let number = sender.tag
        print (number)
        
        var count = number
        Player2CardsChoice[count].text = cards[distribution.nextInt()]
        currentPoints += pointsJudgment(card: Player2CardsChoice[count].text!)
        if Player2CardsChoice[count].text!.contains("K") {
            currentPoints=99
        }
        else if Player2CardsChoice[count].text!.contains("♠︎A") {
            currentPoints=0
        }
        else if Player2CardsChoice[count].text!.contains("10") {
            addminus10()
        }
        else if Player2CardsChoice[count].text!.contains("Q") {
            addminus20 ()
        }
        Points.text = "\(currentPoints)"
        
        if currentPoints > 99 {
            bust()
        }
        showButton.isEnabled = true
        NextButton.isEnabled = true
    }
    
    //換玩家
    @IBAction func NextButtonPressed(_ sender: Any) {
        print("nextPlayer")
        player1CardsView[0].isHidden = false
        player1CardsView[1].isHidden = false
        player1CardsView[2].isHidden = false
        player1CardsView[3].isHidden = false
        player1CardsView[4].isHidden = false
        player2CardsView[0].isHidden = false
        player2CardsView[1].isHidden = false
        player2CardsView[2].isHidden = false
        player2CardsView[3].isHidden = false
        player2CardsView[4].isHidden = false
        
        if player2turn.isHidden == true {
            
            player1turn.isHidden = true
            player2turn.isHidden = false
        }else{
            
            player1turn.isHidden = false
            player2turn.isHidden = true
        }
        
    }
    
    //  判斷數字
    func pointsJudgment ( card: String) -> Int {
        
        if card.contains("A") {
            point = 1
        } else if card.contains("♠︎A") {
            point = 0
        } else if card.contains("2") {
            point = 2
        } else if card.contains("3") {
            point = 3
        } else if card.contains("4") {
            point = 0
        } else if card.contains("5") {
            point = 0
        } else if card.contains("6") {
            point = 6
        } else if card.contains("7") {
            point = 7
        } else if card.contains("8") {
            point = 8
        } else if card.contains("9") {
            point = 9
        } else if card.contains("10") {
            point = 0
        } else if card.contains("J") {
            point = 0
        } else if card.contains("Q") {
            point = 0
        } else if card.contains("K") {
            point = 0
        }
        return point
    }
    
    //超過99失敗
    func bust () {
        let controller = UIAlertController(title: "爆了！", message: "點數： \(currentPoints)", preferredStyle: UIAlertControllerStyle.alert)
        let action = UIAlertAction(title: "OK", style: UIAlertActionStyle.default)
        controller.addAction(action)
        show(controller, sender: nil)
    }
    
    //判斷加減選項
    func addminus10 () {
        let actionSheet=UIAlertController(title:"加or減",message:"選擇你想要增加或減少點數",preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title:"Add",style: .default))
        actionSheet.addAction(UIAlertAction(title:"Minus",style: .default))
        self.present(actionSheet,animated: true)
        
        func add(_ act:UIAlertAction!){
            currentPoints=currentPoints+10
            Points.text = "\(currentPoints)"
        }
        func minus(_ act:UIAlertAction!){
            currentPoints=currentPoints-10
            Points.text = "\(currentPoints)"
        }
    }
    func addminus20 () {
        let actionSheet=UIAlertController(title:"加or減",message:"選擇你想要增加或減少點數",preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title:"Add",style: .default))
        actionSheet.addAction(UIAlertAction(title:"Minus",style: .default))
        self.present(actionSheet,animated: true)
        
        func add(_ act:UIAlertAction!){
            currentPoints=currentPoints+20
            Points.text = "\(currentPoints)"
        }
        func minus(_ act:UIAlertAction!){
            currentPoints=currentPoints-20
            Points.text = "\(currentPoints)"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        player1turn.isHidden = true
        player2turn.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
