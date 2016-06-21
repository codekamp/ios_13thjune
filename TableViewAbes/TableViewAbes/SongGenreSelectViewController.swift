//
//  SongGenreSelectViewController.swift
//  TableViewAbes
//
//  Created by Cerebro on 21/06/16.
//  Copyright © 2016 CodeKamp. All rights reserved.
//

import UIKit

class SongGenreSelectViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var genreSelectionPicker: UIPickerView!
    
    let genre = ["Ghazals", "Pop", "Rock", "Punjabi", "Metal", "Non Metal"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        genreSelectionPicker.dataSource = self
        genreSelectionPicker.delegate = self
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .Plain, target: self, action: #selector(SongGenreSelectViewController.doneButtonTapped))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genre.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genre[row]
    }
    
    func doneButtonTapped() {
        let index = genreSelectionPicker.selectedRowInComponent(0)
        let selectedGenre = genre[index]
        
        print(selectedGenre)
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        defaults.setValue(selectedGenre, forKey: "song_type")
        
        self.navigationController?.popViewControllerAnimated(true)
    }
}
