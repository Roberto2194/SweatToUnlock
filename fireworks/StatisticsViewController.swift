//
//  StatisticViewController.swift
//  fireworks
//
//  Created by Luca Vespoli on 22/11/2019.
//  Copyright © 2019 Terrence Gillespie. All rights reserved.
//

import UIKit

class StatisticViewController: UIViewController {
    
    @IBOutlet var basicBarChart: BeautifulBarChart!
    
//    private let numEntry = 20
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//    }
//    
//    override func viewDidAppear(_ animated: Bool) {
//        let dataEntries = generateEmptyDataEntries()
//        basicBarChart.updateDataEntries(dataEntries: dataEntries, animated: false)
//        
//        
//        let timer = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) {[unowned self] (timer) in
//            let dataEntries = self.generateRandomDataEntries()
//            
//            self.basicBarChart.updateDataEntries(dataEntries: dataEntries, animated: true)
//        }
//        timer.fire()
//    }
//    
//    func generateEmptyDataEntries() -> [DataEntry] {
//        var result: [DataEntry] = []
//        Array(0..<numEntry).forEach {_ in
//            result.append(DataEntry(color: UIColor.clear, height: 0, textValue: "0", title: ""))
//        }
//        return result
//    }
//    
//    func generateRandomDataEntries() -> [DataEntry] {
//        let colors = [/*#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1), #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1), #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1), #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1),*/ #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)]
//        
//        var result: [DataEntry] = []
//        for i in 0..<numEntry {
////            let value = (arc4random() % 90) + 10000
//            let value = Int.random(in: 0 ... 10000)
//            let height: Float = Float(value) / 10000.0
//            
//            let formatter = DateFormatter()
//            formatter.dateFormat = "d MMM"
//            var date = Date()
//            date.addTimeInterval(TimeInterval(24*60*60*i))
//            result.append(DataEntry(color: colors[i % colors.count], height: height, textValue: "\(value)", title: formatter.string(from: date)))
//        }
//        return result
//    }
    
        private let numEntry = 7
    
        override func viewDidLoad() {
            super.viewDidLoad()
        }
    
        override func viewDidAppear(_ animated: Bool) {
            let dataEntries = generateEmptyDataEntries()
            basicBarChart.updateDataEntries(dataEntries: dataEntries, animated: false)
    
    
            let timer = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) {[unowned self] (timer) in
                let dataEntries = self.generateRandomDataEntries()
                self.basicBarChart.updateDataEntries(dataEntries: dataEntries, animated: true)        }
            timer.fire()
        }
    
        func generateEmptyDataEntries() -> [DataEntry] {
            var result: [DataEntry] = []
            Array(0..<numEntry).forEach {_ in
                result.append(DataEntry(color: UIColor.clear, height: 0, textValue: "0", title: ""))
            }
            return result
        }
    
        func generateRandomDataEntries() -> [DataEntry] {
            let colors = [#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1), #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1), #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1), #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1), #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1), #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)]
            var result: [DataEntry] = []
            for i in 0..<numEntry {
                let value = arc4random_uniform(3501) + 4000
                let height: Float = Float(value) / 10000.0
    
                let formatter = DateFormatter()
                formatter.dateFormat = "d MMM"
                // var date = Date()
    
                var earlyDate = Calendar.current.date(
                    byAdding: .day,
                    value: -7,
                    to: Date())
    
                earlyDate!.addTimeInterval(TimeInterval(24*60*60*i))
                result.append(DataEntry(color: colors[i % colors.count], height: height, textValue: "\(value)", title: formatter.string(from: earlyDate!)))
            }
            return result
        }

}
