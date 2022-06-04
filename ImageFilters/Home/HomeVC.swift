//
//  HomeVC.swift
//  ImageFilters
//
//  Created by abdrahman on 04/06/2022.
//

import UIKit

// Main View Controller
class HomeVC: UIViewController {

    // enabling selecting images from liberary
    var imagePicker = UIImagePickerController()
    
    // this variable will contain seleceted image to apply filter, and has an initial value from assest
    var originalImage = UIImage(named: "HMD-RMB-2")
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()

    let buttonsScrollView: UIScrollView = {
        let scroll = UIScrollView()
        return scroll
    }()

    // these properties are to calculate dymentions and content size of the scroll view
    let width:CGFloat = 100
    let height:CGFloat = 100
    var xposition:CGFloat = 10
    var scroll_contont:CGFloat = 0
    
    // array will contain 5 buttons each will apply specific shader
    var buttons : [UIButton] = []
    
    // this is an innstance of the view model class that will enable shaders
    let filter: MetalFilterViewModel = MetalFilterViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        configUI()
    }
    // adding subViews and assigning constraints
    func configUI(){
        imageView.image = originalImage
        view.backgroundColor = .white
        view.addSubview(imageView)
        view.addSubview(buttonsScrollView)
        imageView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: buttonsScrollView.topAnchor, right: view.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 20, paddingRight: 10)
        buttonsScrollView.anchor(left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingLeft: 10, paddingBottom: 50, paddingRight: 10, height: 100)

        for i in 0 ..< 5{
            let button = UIButton(frame: CGRect(x: xposition, y: 0, width: width, height: height))
    
            button.setImage(applyFilter(at: i), for: .normal)
            buttonsScrollView.addSubview(button)
            button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            button.tag = i
            view.addSubview(buttonsScrollView)
            xposition += width + 10
            scroll_contont += width
            buttonsScrollView.contentSize = CGSize(width: scroll_contont, height: height)
            buttons.append(button)
        }
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(savePressed))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Select", style: .plain, target: self, action: #selector(selectPressed))
    }
    
    // save button action
    @objc func savePressed(){
        guard let image = imageView.image else { return }
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
    }
    
    @objc func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        guard error == nil else{return}
        let ac = UIAlertController(title: "Saved!", message: "Your altered image has been saved to your photos.", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
    
    // open photo liberary based on select button action
    @objc func selectPressed(){
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = false
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    // apply custom filter when press each button in the bottom scroll
    @objc func buttonAction(sender: UIButton!){
        imageView.image = applyFilter(at: sender.tag)
    }
    
    // this function will apply custom filter and return UIImage after convertion
    func applyFilter(at index: Int) -> UIImage?{
        filter.inputImage =  CIImage(image: originalImage!)
        let outputImage = filter.outputImage(index)
        let image = convert(cmage: outputImage)
        return image
    }
    
    // after applying filter, convert the returned data to image
    func convert(cmage:CIImage?) -> UIImage?
    {
        let context:CIContext = CIContext.init(options: nil)
        let cgImage:CGImage = context.createCGImage(cmage!, from: cmage!.extent)!
        let image:UIImage = UIImage.init(cgImage: cgImage)
        return image
    }
}

extension HomeVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            // assign chosen image to the image view section based on image tag
            originalImage = image
            imageView.image = originalImage
            createButtonsFilter()
        }
    }
    
    // create 5 filter button categories for the image, each contain image thumbnail to display filter effect
    func createButtonsFilter(){
        for i in 0..<5{
            buttons[i].setImage(applyFilter(at: i), for: .normal)
        }
    }
}
