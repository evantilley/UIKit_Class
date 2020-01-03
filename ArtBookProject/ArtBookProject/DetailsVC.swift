//
//  DetailsVC.swift
//  ArtBookProject
//
//  Created by Evan Tilley on 1/3/20.
//  Copyright © 2020 Evan Tilley. All rights reserved.
//

import UIKit
import CoreData

class DetailsVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var artistText: UITextField!
    @IBOutlet weak var yearText: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    var chosenPainting = ""
    var chosenPaintingID: UUID?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if chosenPainting != "" {
            //display core data
            
            saveButton.isHidden = true
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Paintings")
            let idString = chosenPaintingID?.uuidString
            fetchRequest.predicate = NSPredicate(format: "id = %@", idString!)
            fetchRequest.returnsObjectsAsFaults = false
            
            do {
                let results = try context.fetch(fetchRequest)
                if results.count > 0 {
                    for result in results as! [NSManagedObject]{
                        if let name = result.value(forKey: "name") as? String{
                            nameText.text = name
                        }
                        if let artist = result.value(forKey: "artist") as? String{
                            artistText.text = artist
                        }
                        if let year = result.value(forKey: "year") as? Int{
                            yearText.text = String(year)
                        }
                        if let imageData = result.value(forKey: "image") as? Data{
                            let image = UIImage(data: imageData)
                            imageView.image = image
                        }
                        
                    }
                }
            } catch{
                print("error")
            }
            
            
        } else{
            saveButton.isHidden = false
            saveButton.isEnabled = false
            //don't do anything
            nameText.text = ""
            artistText.text = ""
            yearText.text = ""
        }
        
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        
        //whenever anywhere on view is tapped, hide keyboard
        view.addGestureRecognizer(gestureRecognizer)
        
        imageView.isUserInteractionEnabled = true //allow users to interact with image
        let imageTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(selectImage))
        imageView.addGestureRecognizer(imageTapRecognizer)
        
    }
    
    @objc func selectImage(){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil) //present the picker to user
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        //optional casting, not implicit casting
        imageView.image = info[.originalImage] as? UIImage //info is dictionary, .editedImage is key
        saveButton.isEnabled = true
        picker.dismiss(animated: true, completion: nil) //dismiss ImagePicker view
    }
    
    @objc func hideKeyboard(){
        view.endEditing(true) //hide Keyboard
    }

    @IBAction func saveButtonClicked(_ sender: Any) {
        
        //AppDelegate as a variable
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        //write data in database
        //add entitity we created
        let newPainting = NSEntityDescription.insertNewObject(forEntityName: "Paintings", into: context)
        
        //add attributes
        newPainting.setValue(nameText.text!, forKey: "name")
        newPainting.setValue(artistText.text!, forKey: "artist")
        if let year = Int(yearText.text!){
            newPainting.setValue(year, forKey: "year")
        }
        newPainting.setValue(UUID(), forKey: "id")
        let data = imageView.image!.jpegData(compressionQuality: 0.5)
        newPainting.setValue(data, forKey: "image")
        
        do{
            try context.save()
            print("success")
        } catch{
            print("error")
        }
        
        //sends a message to the whole app that says newData
        //things observing this can respond to it
        NotificationCenter.default.post(name: NSNotification.Name("newData"), object: nil)
        
        //takes us back to original view controller when we press back button
        self.navigationController?.popViewController(animated: true)
        
    }
    
}
