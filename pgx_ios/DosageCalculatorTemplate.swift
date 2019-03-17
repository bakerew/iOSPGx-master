//
//  DosageCalculatorTemplate.swift
//  pgx_ios
//
//  Created by Shane Forler on 10/26/17.
//  Copyright © 2017 Tabor Scott. All rights reserved.
//


//possible class to hold the dosage calculator for resuse on multiple pages to reduce redundancy 

import Foundation
import UIKit
import Darwin

class DosageCalcViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate{
    
    var errormsg = ""
    var errormsg2 = ""
    var errormsg3 = ""
    var errormsg4 = ""
    
    var runningnum = ""
    var runningWeight = ""
    var runningMedAmt = ""
    var runningPerVol = ""
    
    var output1 = Double()
    var output2 = Double()
    
    var FinalDose = Double()
    var FinalLiqDose = Double()
    
    var PatWeight = ""
    var PatDose = ""
    var PatMedAmt = ""
    var PatPerVol = ""
    
    func log(i: Double) -> Double {
        return Darwin.log(i) * M_LN10
    }
    
    func ln(i: Double) -> Double {
        return Darwin.log(i)
    }
    
    func sq(i: Double) -> Double {
        return i * i
    }
    
    func sqr(i: Double) -> Double {
        return i.squareRoot()
    }
    
    func power(x:Double, y:Double) -> Double{
        return pow(x, y)
    }
    
    func eTo(x:Double) -> Double{
        return exp(x)
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        // add self.
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func homeBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: "DosageCalc", sender: self)
        // works but the redundant unlike dismiss ??
    }
    
    @IBOutlet weak var view1: UIView!
    //Spinner selections
    
    @IBOutlet weak var DosageWeightTxt: UITextField!
    @IBOutlet weak var WeightTypeTxt: UITextField!
    @IBOutlet weak var LiqMedWeightTxt: UITextField!
    @IBOutlet weak var LiqVolTypeTxt: UITextField!
    @IBOutlet weak var DoseFreqTxt: UITextField!
    @IBOutlet weak var LiqDoseFreqTxt: UITextField!
    @IBOutlet weak var DecPercTxt: UITextField!
    
    // user entered
    @IBOutlet weak var EnteredDosageTxt: UITextField!
    @IBOutlet weak var EnteredWeightTxt: UITextField!
    @IBOutlet weak var EnteredLiqMedAmt: UITextField!
    @IBOutlet weak var EnteredLiqPerVol: UITextField!
    
    // label outputs
    @IBOutlet weak var DosageOutputLbl: UILabel!
    @IBOutlet weak var LiqDosageOutputLbl: UILabel!
    @IBOutlet weak var Metabolizer: UILabel!
    @IBOutlet weak var RecommendedText: UITextView!
    
    // actions
    
    @IBAction func DoseEntered(_ sender: Any) {
        PatDose = EnteredDosageTxt.text!
        // user entered value into Dosage
    }
    
    @IBAction func DoseWeightEntered(_ sender: Any) {
        PatWeight = EnteredWeightTxt.text!
        // user entered value into weight
    }
    
    
    @IBAction func LiqMedAmt(_ sender: Any) {
        PatMedAmt = EnteredLiqMedAmt.text!
        // user entered med Amount value
    }
    
    
    @IBAction func LiqPerVol(_ sender: Any) {
        PatPerVol = EnteredLiqPerVol.text!
        // user entered per volume value
    }
    
    
    @IBAction func btnPressed(_ sender: Any) {
        let alert = UIAlertController(title: "Missing Field", message: "Please make sure all fields are chosen", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        let invalidSelection = UIAlertController(title: "Invalid Selection", message: "Please select a valid allele combination", preferredStyle: UIAlertController.Style.alert)
        invalidSelection.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        // UI picker for which dosage format is picked
        switch DosageWeightTxt.text{
        case "mg/kg"?:
            if PatDose.isEmpty{
                errormsg = "error"
                print("error")
            } else {
                errormsg = ""
                runningnum = "\(Double(PatDose)! * 1)"
            }
        case "mcg/kg"?:
            if PatDose.isEmpty{
                errormsg = "error"
                print("error")
            } else {
                errormsg = ""
                runningnum = "\(Double(PatDose)! * 0.001)"
            }
        case "gm/kg"?:
            if PatDose.isEmpty{
                errormsg = "error"
                print("error")
            } else {
                errormsg = ""
                runningnum = "\(Double(PatDose)! * 1000)"
            }
        case .none:
            runningnum = ""
        default:
            runningnum = "\(Double(PatDose)! * 1)"
        }
        
        // UI picker for which weight format is picked
        switch WeightTypeTxt.text {
        case "kg"?:
            if PatWeight.isEmpty{
                errormsg2 = "error"
                print("error")
            } else {
                errormsg = ""
                runningWeight = "\(Double(PatWeight)! * 1)"
            }
        case "lbs"?:
            if PatWeight.isEmpty{
                errormsg2 = "error"
                print("error")
            } else {
                errormsg2 = ""
                runningWeight = "\(Double(PatWeight)! * 0.45359237)"
            }
        case .none:
            runningWeight = ""
        // or nil?
        default:
            runningWeight = "\(Double(PatWeight)! * 1)"
        }
        
        // UI picker value for which med amount format is picked
        switch LiqMedWeightTxt.text {
        case "mg"?:
            
            if PatMedAmt.isEmpty {
                errormsg3 = "error"
                print("error")
            }else {
                errormsg3 = ""
                runningMedAmt = "\(Double(PatMedAmt)! * 1000000)"
            }
        case "mcg"?:
            if PatMedAmt.isEmpty {
                errormsg3 = "error"
                print("error")
            }else {
                errormsg3 = ""
                runningMedAmt = "\(Double(PatMedAmt)! * 1000)"
            }
        case "gm"?:
            if PatMedAmt.isEmpty {
                errormsg3 = "error"
                print("error")
            }else {
                errormsg3 = ""
                runningMedAmt = "\(Double(PatMedAmt)! * 1000000000)"
            }
        case .none:
            runningMedAmt = ""
        default:
            runningMedAmt = "\(Double(PatMedAmt)! * 1)"
        }
        
        // UI picker value for the type of per volume picked
        
        switch LiqVolTypeTxt.text {
        case "mL"?:
            if PatPerVol.isEmpty{
                errormsg4 = "error"
                print("error")
            } else {
                errormsg4 = ""
                runningPerVol = "\(Double(PatPerVol)! * 1000)"
            }
        case "L"?:
            if PatPerVol.isEmpty{
                errormsg4 = "error"
                print("error")
            } else {
                errormsg4 = ""
                runningPerVol = "\(Double(PatPerVol)! * 1000000)"
            }
        case .none:
            runningPerVol = ""
        default:
            runningPerVol = "\(Double(PatPerVol)! * 1)"
        }
        
        if errormsg.isEmpty && errormsg2.isEmpty{
            
            output1 = Double(runningnum)! * Double(runningWeight)!
            
            switch DoseFreqTxt.text {
            case "gm BID"?:
                FinalDose = (output1 / 2000)
            case "gm Daily"?:
                FinalDose = (output1 / 1000)
            case "gm QID"?:
                FinalDose = (output1 / 4000)
            case "gm TID"?:
                FinalDose = (output1 / 3000)
            case "gm q1 hr"?:
                FinalDose = (output1 / 24000)
            case "gm q2 hr"?:
                FinalDose = (output1 / 12000)
            case "gm q4 hr"?:
                FinalDose = (output1 / 6000)
            case "mcg BID"?:
                FinalDose = (output1 / 0.002)
            case "mcg Daily"?:
                FinalDose = (output1 / 0.001)
            case "mcg QID"?:
                FinalDose = (output1 / 0.004)
            case "mcg TID"?:
                FinalDose = (output1 / 0.003)
            case "mcg q1 hr"?:
                FinalDose = (output1 / 0.024)
            case "mcg q2 hr"?:
                FinalDose = (output1 / 0.012)
            case "mcg q4 hr"?:
                FinalDose = (output1 / 0.006)
            case "mg BID"?:
                FinalDose = (output1 / 2)
            case "mg Daily"?:
                FinalDose = (output1 / 1)
            case "mg QID"?:
                FinalDose = (output1 / 4)
            case "mg TID"?:
                FinalDose = (output1 / 3)
            case "mg q1 hr"?:
                FinalDose = (output1 / 24)
            case "mg q2 hr"?:
                FinalDose = (output1 / 12)
            case "mg q4 hr"?:
                FinalDose = (output1 / 6)
            case .none:
                print("error")
            default:
                FinalDose = (output1 / 1)
            }
            
            switch DecPercTxt.text{
            case "0"?:
                DosageOutputLbl.text = String(format: "%.f", FinalDose)
            case "1"?:
                DosageOutputLbl.text = String(format: "%.1f", FinalDose)
            case "2"?:
                DosageOutputLbl.text = String(format: "%.2f", FinalDose)
            case "3"?:
                DosageOutputLbl.text = String(format: "%.3f", FinalDose)
            case .none:
                print("error")
            default:
                DosageOutputLbl.text = String(format: "%.2f", FinalDose)
            }
            
        }
        
        if errormsg3.isEmpty && errormsg4.isEmpty{
            
            output2 = ((output1 * Double(runningPerVol)!) / Double(runningMedAmt)!)
            
            switch LiqDoseFreqTxt.text {
            case "L BID"?:
                FinalLiqDose = (output2 * 2)
            case "L Daily"?:
                FinalLiqDose = (output2 * 1)
            case "L QID"?:
                FinalLiqDose = (output2 * 4)
            case "L TID"?:
                FinalLiqDose = (output2 * 3)
            case "L q1 hr"?:
                FinalLiqDose = (output2 * 24)
            case "L q2 hr"?:
                FinalLiqDose = (output2 * 12)
            case "L q4 hr"?:
                FinalLiqDose = (output2 * 6)
            case "mL BID"?:
                FinalLiqDose = (output2 * 2000)
            case "mL Daily"?:
                FinalLiqDose = (output2 * 1000)
            case "mL QID"?:
                FinalLiqDose = (output2 * 4000)
            case "mL TID"?:
                FinalLiqDose = (output2 * 3000)
            case "mL q1 hr"?:
                FinalLiqDose = (output2 * 24000)
            case "mL q2 hr"?:
                FinalLiqDose = (output2 * 12000)
            case "mL q4 hr"?:
                FinalLiqDose = (output2 * 6000)
            case .none:
                print("error")
            default:
                FinalLiqDose = (output2 / 1)
            }
            
            switch DecPercTxt.text{
            case "0"?:
                LiqDosageOutputLbl.text = String(format: "%.f", FinalLiqDose)
            case "1"?:
                LiqDosageOutputLbl.text = String(format: "%.1f", FinalLiqDose)
            case "2"?:
                LiqDosageOutputLbl.text = String(format: "%.2f", FinalLiqDose)
            case "3"?:
                LiqDosageOutputLbl.text = String(format: "%.3f", FinalLiqDose)
            case .none:
                print("error")
            default:
                LiqDosageOutputLbl.text = String(format: "%.2f", FinalLiqDose)
            }
            
        }
        
    }
    let DosageWeight = ["mg/kg","mcg/kg","gm/kg"]
    
    let WeightType = ["kg","lbs"]
    
    let LiqMedWeight = ["gm","mcg","mg"]
    
    let LiqVolType = ["L","mL"]
    
    let DoseFreq = ["gm BID","gm Daily","gm QID","gm TID","gm q1 hr","gm q2 hr","gm q4 hr","mcg BID","mcg Daily","mcg QID","mcg TID","mcg q1 hr","mcg q2 hr","mcg q4 hr","mg BID","mg Daily","mg QID","mg TID","mg q1 hr","mg q2 hr","mg q4 hr"]
    
    let LiqDoseFreq = ["L BID","L Daily","L QID","L TID","L q1 hr","L q2 hr","L q4 hr","mL BID","mL Daily","mL QID","mL TID","mL q1 hr","mL q2 hr","mL q4 hr"]
    
    let DecPerc = ["0","1","2","3"]
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let invalidCharacters = CharacterSet(charactersIn: "0123456789.").inverted
        return string.rangeOfCharacter(from: invalidCharacters, options: [], range: string.startIndex ..< string.endIndex) == nil
    }
    
    // also clear lbl if required field is cleared EX: dose entered and weight, press button then removed weight should clear label
    
    // make the uiImages one images, better UI when rotating
    
    // fix when you enter long number, and sizing of UI
    
    // change uiview controllers, add a class for function
    
    // navigation
    
    
    @objc func didTapView(){
        self.view.endEditing(true)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapRecognizer = UITapGestureRecognizer()
        tapRecognizer.addTarget(self, action: #selector(DosageCalcViewController.didTapView))
        self.view.addGestureRecognizer(tapRecognizer)
        
        //.numberPad
        EnteredDosageTxt.delegate = self
        EnteredDosageTxt.keyboardType = UIKeyboardType.decimalPad
        // or select the keyboardtype from drop down inspector
        EnteredWeightTxt.delegate = self
        EnteredWeightTxt.keyboardType = UIKeyboardType.decimalPad
        EnteredLiqMedAmt.delegate = self
        EnteredLiqMedAmt.keyboardType = UIKeyboardType.decimalPad
        EnteredLiqPerVol.delegate = self
        EnteredLiqPerVol.keyboardType = UIKeyboardType.decimalPad
        
        print(selectedGene + " " + selectedDrug + " " + selectedAllele1 + " " + selectedAllele2)
        
        LiqDosageOutputLbl.text = ""
        DosageOutputLbl.text = ""
        Metabolizer.text = ""
        RecommendedText.text = ""
        DosageWeightTxt.text = DosageWeight[0]
        WeightTypeTxt.text = WeightType[0]
        LiqMedWeightTxt.text = LiqMedWeight[2]
        LiqVolTypeTxt.text = LiqVolType[1]
        DoseFreqTxt.text = DoseFreq[15]
        LiqDoseFreqTxt.text = LiqDoseFreq[8]
        DecPercTxt.text = DecPerc[2]
        
        let DosageWeightView = UIPickerView()
        DosageWeightView.delegate = self
        DosageWeightView.tag = 1
        DosageWeightTxt.inputView = DosageWeightView
        
        let WeightTypeView = UIPickerView()
        WeightTypeView.delegate = self
        WeightTypeView.tag = 2
        WeightTypeTxt.inputView = WeightTypeView
        
        let LiqMedWeightView = UIPickerView()
        LiqMedWeightView.delegate = self
        LiqMedWeightView.tag = 3
        LiqMedWeightTxt.inputView = LiqMedWeightView
        
        let LiqVolTypeView = UIPickerView()
        LiqVolTypeView.delegate = self
        LiqVolTypeView.tag = 4
        LiqVolTypeTxt.inputView = LiqVolTypeView
        
        let DoseFreqView = UIPickerView()
        DoseFreqView.delegate = self
        DoseFreqView.tag = 5
        DoseFreqTxt.inputView = DoseFreqView
        
        let LiqDoseFreqView = UIPickerView()
        LiqDoseFreqView.delegate = self
        LiqDoseFreqView.tag = 6
        LiqDoseFreqTxt.inputView = LiqDoseFreqView
        
        let DecPercView = UIPickerView()
        DecPercView.delegate = self
        DecPercView.tag = 7
        DecPercTxt.inputView = DecPercView
        
        let alleles = selectedAllele1 + " " + selectedAllele2
        switch selectedDrug{
        case "Mercaptopurine", "6MP", "Purinethol", "Purixan", "6Mercaptopurine":
            switch alleles{
            case "*1 *1", "*1 *1S", "*1S *1S":
                Metabolizer.text = "Normal Metabolizer"
                RecommendedText.text = "Start with normal starting dose:\n" +
                    "* Adult: 2.5 mg/kg daily   (include drug calculator option with each dose)\n" +
                    "* Pediatric: 1.25-2.5 mg/kg (50-70 mg/m2) daily\n" +
                "Allow 2 weeks to reach steady state after each dose adjustment."
                break
            case "*1 *2", "*1 *3A", "*1 *3B", "*1 *3C", "*1 *4", "*1S *2", "*1S *3A", "*1S *3B", "*1S *3C", "*1S *4":
                Metabolizer.text = "Intermediate Metabolizer"
                RecommendedText.text = "Start with 30-70% reduction from normal starting dose:\n" +
                    "* Adult: 0.75-1.75 mg/kg daily  (include drug calculator option with each dose)\n" +
                    "Pediatric: 0.375-1.75 mg/kg (15-49 mg/m2) daily\n" +
                    "Allow 2-4 weeks to reach steady state after each dose adjustment.\n" +
                "In those who require a dosage reduction based on myelosuppression, the median dose may be ~40% lower"
                break
            case "*2 *2", "*2 *3A", "*2 *3B", "*2 *3C", "*2 *4":
                Metabolizer.text = "Poor Metabolizer"
                RecommendedText.text = "For malignancy, reduce daily dose by 10-fold from normal starting dose and reduce frequency to thrice weekly instead of daily:\n" +
                    "* Adult: 0.25 mg/kg Three Times Weekly (include drug calculator option with each dose)\n" +
                    "* Pediatric: 0.125-0.25 mg/kg (5-7 mg/m2) Three Times Weekly\n" +
                    "Allow 4-6 weeks to reach steady state after each dose adjustment.\n" +
                "For nonmalignant conditions, consider alternative nonthiopurine immunosuppressant therapy."
                break
            default:
                RecommendedText.text = "Please pick another sequence of alleles."
                break
            }
        case "Thioguanine", "6TG", "6Thioguanine", "Tabloid":
            switch alleles{
            case "*1 *1", "*1 *1S", "*1S *1S":
                Metabolizer.text = "Normal Metabolizer"
                RecommendedText.text = "Start with normal starting dose:\n" +
                    "* Adult and Pediatric: 2 mg/kg/day  (include dosage calculator)\n" +
                    "Allow 2-4 weeks to reach steady state after each dose adjustment.\n" +
                "May cautiously increase to 3 mg/kg/day if no response after 4 weeks"
                break
            case "*1 *2", "*1 *3A", "*1 *3B", "*1 *3C", "*1 *4", "*1S *2", "*1S *3A", "*1S *3B", "*1S *3C", "*1S *4":
                Metabolizer.text = "Intermediate Metabolizer"
                RecommendedText.text = "Start with 30-50% reduction from normal starting dose:\n" +
                    "1 -1.4 mg/kg daily  (include drug calculator option with each dose)\n" +
                "Allow 2-4 weeks to reach steady state after each dose adjustment."
                break
            case "*2 *2", "*2 *3A", "*2 *3B", "*2 *3C", "*2 *4":
                Metabolizer.text = "Poor Metabolizer"
                RecommendedText.text = "Reduce daily dose by 10-fold from normal starting dose and reduce frequency to thrice weekly instead of daily:\n" +
                    "0.2 mg/kg Three Times Weekly (include drug calculator option with each dose)\n" +
                    "Allow 4-6 weeks to reach steady state after each dose adjustment.\n" +
                "For nonmalignant conditions, consider alternative nonthiopurine immunosuppressant therapy."
                break
            default:
                RecommendedText.text = "Please pick another sequence of alleles."
                break
            }
        case "Azathioprine", "Azasan", "Imuran":
            switch alleles{
            case "*1 *1", "*1 *1S", "*1S *1S":
                Metabolizer.text = "Normal Metabolizer"
                RecommendedText.text = "Start with normal starting dose:\n" +
                    "Immunosuppressant/Kidney Transplantation  (include dosage calculator)\n" +
                    "* Adult: 3-5 mg/kg/day\n" +
                    "Rheumatoid Arthritis\n" +
                    "* Adult: 1 mg/kg/day\n" +
                    "Juvenile Idiopathic Arthritis\n" +
                "* Pediatric: 1 mg/kg/day"
                break
            case "*1 *2", "*1 *3A", "*1 *3B", "*1 *3C", "*1 *4", "*1S *2", "*1S *3A", "*1S *3B", "*1S *3C", "*1S *4":
                Metabolizer.text = "Intermediate Metabolizer"
                RecommendedText.text = "Start with 30-70% reduction from normal starting dose:\n" +
                    "Immunosuppressant/Kidney Transplantation\n" +
                    "Adult: 0.9-3.5 mg/kg daily  (include drug calculator option with each dose)\n" +
                    "Rheumatoid Arthritis\n" +
                    "Adult: 0.3-0.7 mg/kg/day\n" +
                    "Juvenile Idiopathic Arthritis\n" +
                    "Pediatric: 0.3-0.7 mg/kg/day\n" +
                "Allow 2-4 weeks to reach steady state after each dose adjustment."
                break
            case "*2 *2", "*2 *3A", "*2 *3B", "*2 *3C", "*2 *4":
                Metabolizer.text = "Poor Metabolizer"
                RecommendedText.text = "Consider alternate therapy.\n" +
                    "If you do use, reduce daily dose by 10-fold from normal starting dose and reduce frequency to thrice weekly instead of daily:\n" +
                    "Immunosuppressant/Kidney Transplantation\n" +
                    "Adult: 0.3-0.5 mg/kg Three Times Weekly   (include drug calculator option with each dose)\n" +
                    "Rheumatoid Arthritis\n" +
                    "Adult: 0.1 mg/kg Three Times Weekly\n" +
                    "Juvenile Idiopathic Arthritis\n" +
                    "Pediatric: 0.1 mg/kg Three Times Weekly\n" +
                "Allow 4-6 weeks to reach steady state after each dose adjustment."
                break
            default:
                RecommendedText.text = "Please pick another sequence of alleles."
                break
            }
        case "XELODA", "Capecitabine":
            switch alleles{
            case "*Normal/No variant *Normal/No variant":
                Metabolizer.text = "Normal Metabolizer"
                RecommendedText.text = "- Monotherapy (Metastatic Colorectal Cancer, Adjuvant Colorectal Cancer, Metastatic Breast Cancer)\n" +
                    "- The recommended dose of XELODA is 1250 mg/m² administered\n" +
                    "orally twice daily (morning and evening; equivalent to 2500 mg/m² total daily dose)\n" +
                "for 2 weeks followed by a 1-week rest period given as 3-week cycles."
                break
            case "*Normal/No variant *c.295_298delTCAT", "*Normal/No variant *c.703C>T", "*Normal/No variant *c.1156G>T", "*Normal/No variant *c.1679T>G", "*Normal/No variant *c.1898delC", "*Normal/No variant *c.1905+1G>T", "*Normal/No variant *c.2983G>T", "*c.557A>G *c.1129-5923C>G", "*c.557A>G *c.2846A>T", "*c.557A>G *c.557A>G", "*c.1129-5923C>G *c.1129-5923C>G", "*c.1129-5923C>G *c.2846A>T", "*c.2846A>T *c.2846A>T":
                Metabolizer.text = "Intermediate Metabolizer"
                RecommendedText.text = "Reduce starting dose by 50% followed by titration " +
                    "of dose based on toxicity (increase the dose in patients experiencing no or clinically tolerable toxicity in the first " +
                    "two cycles to maintain efficacy; decrease the dose in patients who do not tolerate the starting dose to minimize toxicities) " +
                    "or therapeutic drug monitoring (if available).\n" +
                    "Start with 625 mg/m² administered orally twice daily (morning and evening; equivalent to 1250 mg/m² total daily dose) " +
                "for 2 weeks followed by a 1-week rest period given as 3-week cycles."
                break
            case "*Normal/No variant *c.557A>G", "*Normal/No variant *c.2946A>T", "*Normal/No variant *c.1129-5923C>G":
                Metabolizer.text = "Intermediate Metabolizer"
                RecommendedText.text = "Reduce starting dose by 25% to 50% followed by titration " +
                    "of dose based on toxicity (increase the dose in patients experiencing no or clinically tolerable toxicity in the first " +
                    "two cycles to maintain efficacy; decrease the dose in patients who do not tolerate the starting dose to minimize toxicities) or " +
                    "therapeutic drug monitoring (if available).\n" +
                    "Start with 625-937.5 mg/m² administered orally twice daily (morning and evening; equivalent to 1250-1875 " +
                "mg/m² total daily dose) for 2 weeks followed by a 1-week rest period given as 3-week cycles."
                break
            case "*c.295_298delTCAT *c.295_298delTCAT", "*c.295_298delTCAT *c.703C>T", "*c.295_298delTCAT *c.1156G>T", "*c.295_298delTCAT *c.1679T>G", "*c.295_298delTCAT *c.1898delC", "*c.295_298delTCAT *c.1905+1G>A", "*c.295_298delTCAT c.2983G>T", "*c.703C>T *c.703C>T", "*c.703C>T *1156G>T", "*c.703C>T *1679T>G", "*c.703C>T *c.1898delC", "*c.703C>T *c.1905+1G>A", "*c.703C>T *c.2983G>T", "*c.1156G>T *c.1156G>T", "*c.1156G>T *c.1679T>G", "*c.1156G>T *c.1898delC", "*c.1156G>T *c.1905+1G>A", "*c.1156G>T *c.2983G>T", "*c.1679T>G *c.1679T>G", "*c.1679T>G *c.1898delC", "*c.1679T>G *c.1905+1G>A", "*c.1679T>G *c.2983G>T", "*c.1898delC *c.1898delC", "*c.1898delC *c.1905+1G>A", "*c.1898delC *c.2983G>T", "*c.1905+1G>A *c.1905+1G>A", "*c.1905+1G>A *c.2983G>T":
                Metabolizer.text = "Poor Metabolizer"
                RecommendedText.text = "Avoid use of this drug."
                break
            case "*c.295_298delTCAT *c.557A>G", "*c.295_298delTCAT *c.1129-5923C>G", "*c.295_298delTCAT *c.2846A>T", "*c.557A>G *c.703C>T", "*c.557A>G *c.1156G>T", "*c.557A>G *c.1679T>G", "*c.557A>G *c.1898delC", "*c.557A>G *c.1905+1G>A", "*c.557A>G *c.2983G>T", "*c.703C>T *c.1129-5923C>G", "*c.703C>T *c.2846A>T", "*c.1129-5923C>G *c.1156G>T", "*c.1129-5923C>G *c.1679T>G", "*c.1129-5923C>G *c.1898delC", "*c.1129-5923C>G *c.1905+1G>A", "*c.1129-5923C>G *c.2983G>T", "*c.1156G>T *c.2846A>T", "*c.1679T>G *2846A>T", "*c.1898delC *c.2846A>T", "*1905+1G>A *c.2846A>T", "*c.2846A>T *c.2983G>T", "*c.2983G>T *c.2983G>T":
                Metabolizer.text = "Poor Metabolizer"
                RecommendedText.text = "- Avoid use of this drug. In the event, based on clinical " +
                    "advice, alternative agents are not considered a suitable therapeutic option, 5-fluorouracil should be administered " +
                    "at a strongly reduced dose* with early therapeutic drug monitoring.\n" +
                "* A dose of <25% of the normal starting dose is estimated assuming additive effects of alleles on 5-FU clearance."
                break
            default:
                RecommendedText.text = "Please pick another sequence of alleles."
                break
            }
        case "Fluorouracil", "Efudex", "Flouroplex", "Adrucil", "5-fluorouracil", "5-FU":
            switch alleles{
            case "*Normal/No variant *Normal/No variant":
                Metabolizer.text = "Normal Metabolizer"
                RecommendedText.text = "Keep normal recommended dosage."
                break
            case "*Normal/No variant *c.295_298delTCAT", "*Normal/No variant *c.703C>T", "*Normal/No variant *c.1156G>T", "*Normal/No variant *c.1679T>G", "*Normal/No variant *c.1898delC", "*Normal/No variant *c.1905+1G>T", "*Normal/No variant *c.2983G>T", "*c.557A>G *c.1129-5923C>G", "*c.557A>G *c.2846A>T", "*c.557A>G *c.557A>G", "*c.1129-5923C>G *c.1129-5923C>G", "*c.1129-5923C>G *c.2846A>T", "*c.2846A>T *c.2846A>T":
                Metabolizer.text = "Intermediate Metabolizer"
                RecommendedText.text = "Reduce starting dose by 50% followed by titration " +
                    "of dose based on toxicity (increase the dose in patients experiencing no or clinically tolerable toxicity in the first " +
                    "two cycles to maintain efficacy; decrease the dose in patients who do not tolerate the starting dose to minimize toxicities) " +
                "or therapeutic drug monitoring (if available)."
                break
            case "*Normal/No variant *c.557A>G", "*Normal/No variant *c.2946A>T", "*Normal/No variant *c.1129-5923C>G":
                Metabolizer.text = "Intermediate Metabolizer"
                RecommendedText.text = "Reduce starting dose by 25% to 50% followed by titration " +
                    "of dose based on toxicity (increase the dose in patients experiencing no or clinically tolerable toxicity in the first " +
                    "two cycles to maintain efficacy; decrease the dose in patients who do not tolerate the starting dose to minimize toxicities) or " +
                "therapeutic drug monitoring (if available)."
                break
            case "*c.295_298delTCAT *c.295_298delTCAT", "*c.295_298delTCAT *c.703C>T", "*c.295_298delTCAT *c.1156G>T", "*c.295_298delTCAT *c.1679T>G", "*c.295_298delTCAT *c.1898delC", "*c.295_298delTCAT *c.1905+1G>A", "*c.295_298delTCAT c.2983G>T", "*c.703C>T *c.703C>T", "*c.703C>T *1156G>T", "*c.703C>T *1679T>G", "*c.703C>T *c.1898delC", "*c.703C>T *c.1905+1G>A", "*c.703C>T *c.2983G>T", "*c.1156G>T *c.1156G>T", "*c.1156G>T *c.1679T>G", "*c.1156G>T *c.1898delC", "*c.1156G>T *c.1905+1G>A", "*c.1156G>T *c.2983G>T", "*c.1679T>G *c.1679T>G", "*c.1679T>G *c.1898delC", "*c.1679T>G *c.1905+1G>A", "*c.1679T>G *c.2983G>T", "*c.1898delC *c.1898delC", "*c.1898delC *c.1905+1G>A", "*c.1898delC *c.2983G>T", "*c.1905+1G>A *c.1905+1G>A", "*c.1905+1G>A *c.2983G>T":
                Metabolizer.text = "Poor Metabolizer"
                RecommendedText.text = "Avoid use of this drug."
                break
            case "*c.295_298delTCAT *c.557A>G", "*c.295_298delTCAT *c.1129-5923C>G", "*c.295_298delTCAT *c.2846A>T", "*c.557A>G *c.703C>T", "*c.557A>G *c.1156G>T", "*c.557A>G *c.1679T>G", "*c.557A>G *c.1898delC", "*c.557A>G *c.1905+1G>A", "*c.557A>G *c.2983G>T", "*c.703C>T *c.1129-5923C>G", "*c.703C>T *c.2846A>T", "*c.1129-5923C>G *c.1156G>T", "*c.1129-5923C>G *c.1679T>G", "*c.1129-5923C>G *c.1898delC", "*c.1129-5923C>G *c.1905+1G>A", "*c.1129-5923C>G *c.2983G>T", "*c.1156G>T *c.2846A>T", "*c.1679T>G *2846A>T", "*c.1898delC *c.2846A>T", "*1905+1G>A *c.2846A>T", "*c.2846A>T *c.2983G>T", "*c.2983G>T *c.2983G>T":
                Metabolizer.text = "Poor Metabolizer"
                RecommendedText.text = "- Avoid use of this drug. In the event, based on clinical " +
                    "advice, alternative agents are not considered a suitable therapeutic option, 5-fluorouracil should be administered " +
                    "at a strongly reduced dose* with early therapeutic drug monitoring.\n" +
                "* A dose of <25% of the normal starting dose is estimated assuming additive effects of alleles on 5-FU clearance."
                break
            default:
                RecommendedText.text = "Please pick another sequence of alleles."
                break
            }
        default:
            RecommendedText.text = "Please pick another gene sequence."
            break
        }
    }
    
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        if pickerView.tag == 1 {
            return DosageWeight.count
        }
        if pickerView.tag == 2 {
            return WeightType.count
        }
        if pickerView.tag == 3 {
            return LiqMedWeight.count
        }
        if pickerView.tag == 4 {
            return LiqVolType.count
        }
        if pickerView.tag == 5 {
            return DoseFreq.count
        }
        if pickerView.tag == 6 {
            return LiqDoseFreq.count
        }
        if pickerView.tag == 7 {
            return DecPerc.count
        }
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1 {
            return DosageWeight[row]
        }
        if pickerView.tag == 2 {
            return WeightType[row]
        }
        if pickerView.tag == 3 {
            return LiqMedWeight[row]
        }
        if pickerView.tag == 4 {
            return LiqVolType[row]
        }
        if pickerView.tag == 5 {
            return DoseFreq[row]
        }
        if pickerView.tag == 6 {
            return LiqDoseFreq[row]
        }
        if pickerView.tag == 7 {
            return DecPerc[row]
        }
        return nil
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1 {
            DosageWeightTxt.text =  DosageWeight[row]
        }
        if pickerView.tag == 2 {
            WeightTypeTxt.text = WeightType[row]
        }
        if pickerView.tag == 3 {
            LiqMedWeightTxt.text = LiqMedWeight[row]
        }
        if pickerView.tag == 4 {
            LiqVolTypeTxt.text = LiqVolType[row]
        }
        if pickerView.tag == 5 {
            DoseFreqTxt.text = DoseFreq[row]
        }
        if pickerView.tag == 6 {
            LiqDoseFreqTxt.text = LiqDoseFreq[row]
        }
        if pickerView.tag == 7 {
            DecPercTxt.text = DecPerc[row]
        }
        
        self.view.endEditing(false)
    }
}
