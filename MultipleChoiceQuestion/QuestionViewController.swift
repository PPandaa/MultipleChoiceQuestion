//
//  QuestionViewController.swift
//  MultipleChoiceQuestion
//
//  Created by PeterHu on 2018/12/1.
//  Copyright © 2018 PeterHu. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var A: UIButton!
    @IBOutlet weak var B: UIButton!
    @IBOutlet weak var C: UIButton!
    @IBOutlet weak var D: UIButton!
    @IBOutlet weak var total: UILabel!
    @IBOutlet weak var correct: UILabel!
    @IBOutlet weak var middle: UILabel!
    @IBOutlet weak var restart: UIButton!
    struct Question{
        var question:String
        var A,B,C,D:String
        var answer:String
    }
    var qarray = [Question]()
    var score = 0
    var i = 0
    var format = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        qarray = [Question(question: "亞洲小天王是指誰？", A: "A.Peter Pan", B: "B.胡增豪" , C: "C.周杰倫", D: "D.王力宏", answer: "C.周杰倫"),Question(question: "世界最小的國家？" , A: "A.全家", B: "B.台灣", C: "C.梵諦岡", D: "D.盧森堡", answer: "C.梵諦岡"),Question(question: "請問梅雨的形成主要原因？", A: "A.從天空掉梅子下來" , B: "B.季風交替", C: "C.季節交替", D: "D.鬼抓交替", answer: "B.季風交替"),Question(question: "大陸地區的飯店，早上提供morningcall服務，在大陸叫什麼？", A: "A.叫床", B: "B.叫春", C: "C.叫叫ABC", D: "D.叫人", answer: "A.叫床"),Question(question: "何者屬於台灣原住民的節慶活動？", A: "A.矮靈祭", B: "B.溼度計", C: "C.風向計", D: "D.溫度計", answer: "A.矮靈祭"),Question(question: "蘇格拉底的父親的職業？", A: "A.雕刻家", B: "B.妙管家", C: "C.AB相加", D: "D.C++", answer: "A.雕刻家"),Question(question: "世界上最大的海洋？" , A: "A.喜洋洋", B: "B.太平洋", C: "C.大西洋", D: "D.鳥癢癢", answer: "B.太平洋"),Question(question: "古時候說的地牛翻身，指的是哪一種天然災害？", A: "A.車陣", B: "B.冰鎮", C: "C.微風陣陣", D: "D.地震", answer: "D.地震"),Question(question: "(猜一字)酒中沒有水，簡直如見鬼?", A: "A.酉", B: "B.酒", C: "C.愧", D: "D.醜", answer: "D.醜"),Question(question: "太陽早上是由哪邊升起？", A: "A.床邊", B: "B.身邊" , C: "C.東邊", D: "D.週邊", answer: "C.東邊"),Question(question: "哪一種魚才是真正的魚？", A: "A.章魚" , B: "B.木魚", C: "C.吳郭魚", D: "D.由於", answer: "C.吳郭魚"),Question(question: "中國首都？", A: "A.霍金", B: "B.精益求精", C: "C.南京", D: "D.北京", answer: "D.北京"),Question(question: "印度板塊和歐亞板塊相撞造成？", A: "A.來龍去脈", B: "B.大麥", C: "C.喜馬拉雅山脈", D:" D.大動脈", answer: "C.喜馬拉雅山脈"),Question(question: "紅樓夢中，劉姥姥進了什麼園？", A: "A.團團圓圓", B: "B.來源", C: "C.大觀園", D: "D.球員", answer: "C.大觀園"),Question(question: "增溫的乾燥空氣，這類風稱為？", A: "A.流川風", B: "B.大陸冰封", C: "C.殺人蜂", D: "D.焚風", answer: "D.焚風"),Question(question: "水稻的子葉是屬於？", A: "A.嘔葉", B: "B.一手比葉", C: "C.單子葉", D: "D.雙子葉", answer: "C.單子葉"),Question(question: "十三行文化遺址在台北縣哪裡發現？", A: "A.阿里", B: "B.八里", C: "C.咖哩 ", D: "D.地理", answer: "B.八里"),Question(question: "請問下列何者是台中的名產？" , A: "A.太陽餅", B: "B.蔥油餅", C: "C.甲乙丙", D: "D.紅豆餅", answer: "A.太陽餅"),Question(question: "清朝時的地名「蛤仔難」位於今日台灣何縣市？", A: "A.台南", B: "B.花蓮", C: "C.台東", D: "D.宜蘭", answer: "D.宜蘭"),Question(question: "蛇常常吐舌頭，是為了？", A: "A.求偶", B: "B.舌頭癢", C: "C.找尋獵物", D: "D.排臭", answer: "C.找尋獵物")]

        let totalNumberOfQuestion = qarray.count
        print(totalNumberOfQuestion)
        restart.setTitleColor(UIColor.clear, for: .normal)
        start()
        // Do any additional setup after loading the view.
    }
    @IBAction func restart(_ sender: Any) {
        start()
    }
    @IBAction func change(_ sender: UIButton) {
        checkAnswer(sender.currentTitle!)
        print(i)
        if(i+1 != 10){
            i += 1
            changeQuestion(i)
        }
        else{
            changeView(status: 0)
        }
    }
    func start() {
        correct.text = "0"
        total.text = "0"
        i = 0
        score = 0
        qarray.shuffle()
        changeView(status: 1)
        changeQuestion(i)
    }
    func checkAnswer(_ answer:String) {
        if answer == qarray[i].answer{
            score += 10
            format = String.init(format: "%d", score/10)
            correct.text = format;
            format = String.init(format: "%d", i+1)
            total.text = format
        }
        format = String.init(format: "%d", i+1)
        total.text = format
        print(score)
    }
    func changeQuestion(_ index:Int) {
        
        questionLabel.text = qarray[index].question
        A.setTitle(qarray[index].A, for: .normal)
        B.setTitle(qarray[index].B, for: .normal)
        C.setTitle(qarray[index].C, for: .normal)
        D.setTitle(qarray[index].D, for: .normal)
    }
    func changeView(status:Int) {
        if(status == 0){
            restart.isEnabled = true
            format = String.init(format: "你的分數 %d ", score)
            questionLabel.text = format
            restart.setTitle("Try again", for: .normal)
            restart.setTitleColor(UIColor.blue, for: .normal)
            A.setTitleColor(UIColor.clear, for: .normal)
            B.setTitleColor(UIColor.clear, for: .normal)
            C.setTitleColor(UIColor.clear, for: .normal)
            D.setTitleColor(UIColor.clear, for: .normal)
            correct.textColor = UIColor.clear
            total.textColor = UIColor.clear
            middle.textColor = UIColor.clear
        }
        else{
            restart.isEnabled = false
            restart.setTitleColor(UIColor.clear, for: .normal)
            A.setTitleColor(UIColor(red: 100/255, green: 80/255, blue: 250/255, alpha: 1), for: .normal)
            B.setTitleColor(UIColor(red: 148/255, green: 33/255, blue: 146/255, alpha: 1), for: .normal)
            C.setTitleColor(UIColor(red: 0/255, green: 249/255, blue: 0/255, alpha: 1), for: .normal)
            D.setTitleColor(UIColor(red: 0/255, green: 253/255, blue: 255/255, alpha: 1), for: .normal)
            correct.textColor = UIColor(red: 245/255, green: 189/255, blue: 75/255, alpha: 1)
            total.textColor = UIColor.red
            middle.textColor = UIColor.blue
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
