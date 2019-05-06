//
//  ViewController.swift
//  Quizzler
//
//  Created by Rahul Krishnan on 6/5/19.
//  Copyright © 2019 Rahul Krishnan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var progressLbl: UILabel!
    
    @IBOutlet weak var scoreLbl: UILabel!
    
    @IBOutlet weak var progressView: UIView!
    
    let questions : QuestionBank = QuestionBank()
    
    var isTrue : Bool = true
    
    var currentQuestion : Question!
    
    var questionCount = 0
    
    var correctAnswers = 0
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
        showQuestion()
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        
        if sender.tag == 1 {
            
            isTrue = true
            
        } else {
            
            isTrue = false
        }
            checkForAnswer(answer: isTrue)
        
        
    }
    
    func showQuestion() {
        
        if questionCount == 13 {
            
            let alert = UIAlertController(title: "End Of Quiz", message: "Do you want to retake quiz ?", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Restart", style: .default) { (UIAlertAction) in
                self.resetQuestions()
            }
            alert.addAction(alertAction)
            self.present(alert, animated: true, completion: nil)
            
        }  else {
            
            currentQuestion = questions.list[questionCount]
            questionLabel.text = currentQuestion.questionText
            
        }
        
      
    }
    
    func checkForAnswer(answer : Bool) {
        
      
        if currentQuestion.answer == answer {
            ProgressHUD.showSuccess("Correct")
            correctAnswers+=1
            questionCount+=1
            updateUI()
            scoreLbl.text = "Score:\(correctAnswers*10)"
            progressLbl.text = "\(correctAnswers + 1)/13"
            showQuestion()
            
        } else {
            ProgressHUD.showError("Wrong")
            progressLbl.text = "\(correctAnswers)/13"
            questionCount+=1
            showQuestion()
        }
        
       
        
    }
    
    func resetQuestions() {
        
        questionCount = 0
        correctAnswers = 0
        progressLbl.text = "x/13"
        scoreLbl.text = "Score:0"
        currentQuestion = questions.list[questionCount]
        questionLabel.text = currentQuestion.questionText
        updateUI()
    }
    
    func updateUI() {
        progressView.frame.size.width = (view.frame.size.width / 13 ) * CGFloat (questionCount)
    }
    
}

