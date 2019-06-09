//
//  CollectionViewController.swift
//  FBTest
//
//  Created by Ashwin Rajesh on 4/20/19.
//  Copyright © 2019 Ashwin Rajesh. All rights reserved.
//

import UIKit
import Firebase

var selectedImage: UIImage? = nil

class CollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var imageCollectionView: UICollectionView!
    
    var images: [UIImage] = [UIImage(named: "artifact")!]
    let labels: [String] = ["Hello", "Hi"]
    
    var storageRef: StorageReference!
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()

        // Do any additional setup after loading the view.
        storageRef = Storage.storage().reference()
        let imgReference = storageRef.child("images/test.jpg")
        
        imgReference.downloadURL {url, error in
            if (error == nil) {
                let data = try? Data(contentsOf: url!)
                let image = UIImage(data: data!)
                print("done")
                self.images.append(image!)
                print(self.images)
            } else {
                // Handle error
                print("error")
            }
            self.imageCollectionView.delegate = self
            self.imageCollectionView.dataSource = self
        }
        
        ref.child("data").observe(.value, with: {(data) in
            for child in data.children.allObjects as! [DataSnapshot] {
                print(child.value)
            }
        })
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CELL", for: indexPath) as! CollectionViewCell
        cell.imageView.image = images[indexPath.row]
        cell.label.text = labels[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedImage = images[indexPath.row]
        performSegue(withIdentifier: "share", sender: self)
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
