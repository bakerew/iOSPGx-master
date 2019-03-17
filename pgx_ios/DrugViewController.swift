//
//  DrugViewController.swift
//  pgx_ios
//
//  Created by Tabor Scott on 10/11/17.
//  Copyright © 2017 Tabor Scott. All rights reserved.
//

import UIKit

var selectedDrug = ""
var selectedGene = ""

class DrugViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var GenePicker: UIPickerView!
    @IBOutlet weak var GenePickerBtn: UIButton!
    
    @IBOutlet weak var DrugPicker: UIPickerView!
    @IBOutlet weak var DrugPickerBtn: UIButton!
    
    @IBOutlet weak var backButtonToGetStarted: UIBarButtonItem!
    @IBOutlet weak var nextButtonToAllele: UIBarButtonItem!
    
    
    let genes = ["Select Gene", "TPMT", "DPYD"] //Add additional drugs here later
    let drugs = ["Select Drug", "Mercaptopurine", "6MP", "Purinethol", "Purixan", "6Mercaptopurine", "Thioguanine", "6TG", "6Thioguanine", "Tabloid", "Azathioprine", "Azasan", "Imuran"]
    let drugs2 = ["Select Drug", "Capecitabine", "XELODA", "Fluorouracil", "Efudex", "Flouroplex", "Adrucil", "5-fluorouracil", "5-FU"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GenePicker?.dataSource = self
        GenePicker?.delegate = self
        DrugPicker?.dataSource = self
        DrugPicker?.delegate = self
        //self.GenePicker.selectRow(0, inComponent:0, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func GenePickerBtnPressed(_ sender: AnyObject) {
        GenePicker.isHidden = false;
        DrugPicker.isHidden = true
    }
    

    @IBAction func DrugPickerBtnPressed(_ sender: Any) {
        DrugPicker.isHidden = false;
        GenePicker.isHidden = true
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        var drugCount = 0
        if (pickerView == GenePicker) {
            return genes.count
        }
        else{
            if selectedGene == "TPMT"{
                drugCount = drugs.count
            }
            else if selectedGene == "DPYD"{
                drugCount = drugs2.count
            }
            return drugCount}
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        var selectedArray = ""
        if (pickerView == GenePicker){
            selectedGene = genes[row]
            return genes [row]
        }
        else{
            if selectedGene == "TPMT" {
                selectedArray = drugs[row]
            }
            else if selectedGene == "DPYD" {
                selectedArray = drugs2[row]
            }
            return selectedArray
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (pickerView == GenePicker){
            //self.pickerView(GenePicker, didSelectRow: 0, inComponent: 0)
            GenePickerBtn.setTitle(genes[row], for: UIControl.State.normal)
            selectedGene = genes[row]
            GenePicker.isHidden = true
            DrugPicker.reloadAllComponents()
        }
        else if (pickerView == DrugPicker){
            switch selectedGene {
            case "TPMT":
                DrugPickerBtn.setTitle(drugs[row], for: UIControl.State.normal)
                selectedDrug = drugs[row]
                DrugPicker.isHidden = true
                break
            case "DPYD":
                DrugPickerBtn.setTitle(drugs2[row], for: UIControl.State.normal)
                selectedDrug = drugs2[row]
                DrugPicker.isHidden = true
                break
            default:
                break
            }
            
        }
        else{
            print("error")
        }
    }
    @IBAction func drugNextPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "AlleleViewController", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let alert = UIAlertController(title: "Missing Field", message: "Please make sure all fields are chosen", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        if let buttonPressed = sender as? UIBarButtonItem {
            if buttonPressed == nextButtonToAllele {
                if selectedGene == "" || selectedDrug == "" {
                    self.present(alert, animated: true)
                }
            }else {
                performSegue(withIdentifier: "backToGetStarted", sender: backButtonToGetStarted)
            }
            
        }
    }
        
}

