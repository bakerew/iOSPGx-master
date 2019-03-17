//
//  Allele.swift
//  pgx_ios
//
//  Created by Tabor Scott on 11/21/17.
//  Copyright © 2017 Tabor Scott. All rights reserved.
//

import Foundation
import UIKit

var selectedAllele1 = ""
var selectedAllele2 = ""

class AlleleViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{
    
    @IBOutlet weak var GeneUsed: UILabel!
    @IBOutlet weak var DrugUsed: UILabel!
    @IBOutlet weak var Allele1PickerBtn: UIButton!
    @IBOutlet weak var BackButton: UIBarButtonItem!
    @IBOutlet weak var toMetabolizerNextButton: UIBarButtonItem!
    @IBOutlet weak var Allele2PickerBtn: UIButton!
    @IBOutlet weak var Allele1Picker: UIPickerView!
    @IBOutlet weak var Allele2Picker: UIPickerView!
    
    let allele1 = ["Select Allele", "*1", "*1S", "*2"]
    let allele2 = ["Select Allele", "*1", "*1S", "*2", "*3A", "*3B", "*3C", "*4"]
    let alleleDPYD = ["Select Allele", "*Normal/No variant", "*c.557A>G", "*c.1129-5923C>G", "*c.2846A>T", "*c.295_298delTCAT", "*c.703C>T", "*c.1156G>T", "*c.1679T>G", "*c.1898delC", "*c.1905+1G>A", "*c.2983G>T" ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Allele1Picker?.dataSource = self
        Allele2Picker?.dataSource = self
        Allele1Picker?.delegate = self
        Allele2Picker?.delegate = self
        GeneUsed.text = selectedGene
        DrugUsed.text = selectedDrug
        print(selectedDrug)
        print(selectedGene)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Allele1BtnPressed(_ sender: Any) {
        Allele1Picker.isHidden = false
        Allele2Picker.isHidden = true
    }
    
    @IBAction func Allele2BtnPressed(_ sender: Any) {
        Allele2Picker.isHidden = false
        Allele1Picker.isHidden = true
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        var alleleCount = Int()
        switch selectedGene {
        case "TPMT":
            if (pickerView == Allele1Picker && selectedGene == "TPMT") {
                alleleCount = allele1.count
            }
            else{
                alleleCount = allele2.count
                }
        case "DPYD":
            if (pickerView == Allele1Picker && selectedGene == "DPYD") {
                alleleCount = alleleDPYD.count
            }
            else{
                alleleCount = alleleDPYD.count
            }
        default:
            break
        }
        return alleleCount
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        var pickerViewAllele = ""
        switch selectedGene{
        case "TPMT":
            if (pickerView == Allele1Picker){
                pickerViewAllele = allele1 [row]
            }
            else{
                pickerViewAllele = allele2 [row]
            }
        case "DPYD":
            if (pickerView == Allele1Picker){
                pickerViewAllele = alleleDPYD [row]
            }
            else{
                pickerViewAllele = alleleDPYD [row]
            }
        default: break
        }
        return pickerViewAllele
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (pickerView == Allele1Picker && selectedGene == "TPMT"){
            
            Allele1PickerBtn.setTitle(allele1[row], for: UIControl.State.normal)
            selectedAllele1 = allele1[row]
            Allele1Picker.isHidden = true
        }
        else if (pickerView == Allele2Picker && selectedGene == "TPMT"){
            Allele2PickerBtn.setTitle(allele2[row], for: UIControl.State.normal)
            selectedAllele2 = allele2[row]
            Allele2Picker.isHidden = true
        }
        else if (pickerView == Allele1Picker && selectedGene == "DPYD"){
            Allele1PickerBtn.setTitle(alleleDPYD[row], for: UIControl.State.normal)
            selectedAllele1 = alleleDPYD[row]
            Allele1Picker.isHidden = true
        }
        else if (pickerView == Allele2Picker && selectedGene == "DPYD"){
            Allele2PickerBtn.setTitle(alleleDPYD[row], for: UIControl.State.normal)
            selectedAllele2 = alleleDPYD[row]
            Allele2Picker.isHidden = true
        }
            
        else{
            print("error")
        }
    }
    
    //logic for if statement to determine metabolizer pages
    //does 1S need to be *1s?!?!?
    
    @IBAction func NextBtnPress(_ sender: Any) {
        performSegue(withIdentifier: "S1", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let alert = UIAlertController(title: "Missing Field", message: "Please make sure all fields are chosen", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        if let buttonPressed = sender as? UIBarButtonItem {
            if buttonPressed == toMetabolizerNextButton {
                if selectedGene == "" || selectedDrug == "" {
                    self.present(alert, animated: true)
                }
            } else {
                performSegue(withIdentifier: "backToDrugs", sender: self)
            }
        }
    }
}
