//
//  MainVc.swift
//  DateAndTimePractise
//
//  Created by surya-zstk231 on 07/06/21.
//

import UIKit

class MainVc: UIViewController {
    @IBOutlet weak var textFieldArea: UITextField!
    
    @IBOutlet weak var differenceTextArea: UILabel!
    @IBOutlet weak var currentDateTextField: UITextField!
    @IBOutlet weak var datePickerArea: UIDatePicker!
    
    @IBOutlet weak var typePickerArea: UIPickerView!
    
    let typeArr:[Time] = [.year,.month,.week,.date,.hour,.minute,.second]
    let dateFormatter = DateFormatter()
    
    var selectedType:Time = .year
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        dateFormatter.dateFormat = "MM-dd-yy_HH:mm:ss-a"
//        dateFormatter.dateFormat = "EEEE-MMM-dd-yyyy"
//        dateFormatter.dateFormat = "dd/M/Y"
//        dateFormatter.dateFormat = "h:m:s:a"
//        dateFormatter.dateFormat = "F" ///Month la entha week nu find pannurathu
//        dateFormatter.setLocalizedDateFormatFromTemplate("hh:mm-a")
        dateFormatter.setLocalizedDateFormatFromTemplate("dd/MM/yyyy, hh:mm a")
        setCurrectDate()
        
        typePickerArea.delegate = self
        typePickerArea.dataSource = self
        
        
    }
    
    func setCurrectDate(){
        currentDateTextField.text = dateFormatter.string(from: Date())
    }
    
    @IBAction func DatePickerValueChanged(_ sender: UIDatePicker) {
        self.textFieldArea.text = dateFormatter.string(from: sender.date)
        
//        print(dateFormatter.string(from: Date()) == dateFormatter.string(from: sender.date))
//        print(dateFormatter.string(from: Date()) != dateFormatter.string(from: sender.date))
//        print(dateFormatter.string(from: Date()) >= dateFormatter.string(from: sender.date))
//        print(dateFormatter.string(from: Date()) <= dateFormatter.string(from: sender.date))

        difference(date: sender.date, type: selectedType)
        
    }
 
    
    func difference(date: Date, type: Time){
        
        var ans = 0
        switch type {
        case .year:
            ans = Calendar.current.dateComponents([.year], from: date, to: Date()).year ?? 0
        case .month:
            ans = Calendar.current.dateComponents([.month], from: date, to: Date()).month ?? 0
        case .week:
            ans = Calendar.current.dateComponents([.weekOfMonth], from: date, to: Date()).weekOfMonth ?? 0
        case .date:
            ans = Calendar.current.dateComponents([.day], from: date, to: Date()).day ?? 0
        case .hour:
            ans = Calendar.current.dateComponents([.hour], from: date, to: Date()).hour ?? 0
        case .minute:
            ans = Calendar.current.dateComponents([.minute], from: date, to: Date()).minute ?? 0
        case .second:
            ans = Calendar.current.dateComponents([.second], from: date, to: Date()).second ?? 0
        }
        if ans>0{
        differenceTextArea.text = "\(type) difference in past == \(ans)"
        } else {
            let n = ans * -1
            differenceTextArea.text = "\(type) difference in future == \(n)"
        }
    }
}

extension MainVc: UIPickerViewDataSource,UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return typeArr.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return typeArr[row].rawValue
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedType = typeArr[row]
    }
    
    
    
    
}

enum Time:String {
    case year = "Year"
    case month = "Month"
    case week = "Week"
    case date = "Date"
    case hour = "Hour"
    case minute = "Minute"
    case second = "Second"
}


/*
    Year - y (Caps and Small cases use seiyalam)
        y- normal ah work aayirum
        yy- rendu digit ku year show pannurathukku
        yyyyy- four digit ku year ah show pannurathukku
 
    Month - MM (use caps case only)
        M- month ah letter la sollama numeric ah sollurathukku
        MM- Month ah two digit numeric ah show pannurathukku
        MMM- month ah letter la 3 letter la show panurathukku
        MMMM- Full month name um varum
        MMMMM- month ooda first name mattum varum
 
    Day - d (small case only)
        d- show date
        F- show your date contains which week of current month (Only caps allowed)
        E- Day show pannurathukku(Caps only)
        
    Hour - h (Small and Caps allowed)
        h- 12hr format
        H- 24hr format
        a- Am/Pm indicator
        
    Minute - m(Small case mattum)
 
    Seconds - s(small and caps allowed)
        
 */



//A
//D
//e
