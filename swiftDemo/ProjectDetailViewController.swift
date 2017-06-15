//
//  ProjectDetailViewController.swift
//  swiftDemo
//
//  Created by lisa on 2017/5/24.
//  Copyright © 2017年 lisa. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation
// 1: AVKit for AVPlayerViewController
import AVKit

//2: MobileCoreServices for constants such as kUTTypeMovie
import MobileCoreServices

protocol passValue {

    func valueText()
    
}
class ProjectDetailViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    //在类里面声明 全局imageView全局变量
    var imageView:UIImageView!
    var capturedImages: [UIImage]! = []  //所选的图片数组
    var imagePickerController: UIImagePickerController!  //图片选择器
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad();
        self.view.backgroundColor = UIColor.white
        
        self.title = "系统相册"
    
        self.imageView = UIImageView()
        self.imageView.frame = CGRect(x:20, y:220, width:100, height:100)
        self.view.addSubview(self.imageView)
        
//        imageView.sd_setImage(with: NSURL(string: "http://www.szplanner.com/images/inside/product_activity_thumb.jpg") as URL?, placeholderImage: UIImage(named: "nopic.jpg"))
        
        
        let btn:UIButton = UIButton(type:UIButtonType.system )as UIButton
        btn.frame = CGRect(x: 10, y: 140, width: 200, height: 40)
        btn.setTitle("Press me", for: UIControlState())
        btn.addTarget(self, action: #selector(ProjectViewController.buttonPressed), for: UIControlEvents.touchUpInside)
        self.view.addSubview(btn)
    }
    
    func buttonPressed() {
      
        self.showImagePicker();
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true);
        
        print("该页面消失");
    }
    
    func showImagePicker() {
        if self.imageView.isAnimating {
            self.imageView.stopAnimating()
        }
        
        if self.capturedImages.count > 0 {
            self.capturedImages.removeAll()
        }
        
        let sourceType = UIImagePickerControllerSourceType.photoLibrary
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.modalPresentationStyle = .currentContext
        imagePickerController.sourceType = sourceType
        imagePickerController.delegate = self
        imagePickerController.modalPresentationStyle = (sourceType == .camera) ? .fullScreen : .popover
        
        // 3. Allow choice of images and movies
        //    Image only is the default
        imagePickerController.mediaTypes = [String(kUTTypeImage), String(kUTTypeMovie)]
        
        if let presentationController = imagePickerController.popoverPresentationController {
//            presentationController.barButtonItem = button
            presentationController.permittedArrowDirections = .any
        }
        
        if (sourceType == .camera) {
            // The user wants to use the camera interface. Set up our custom overlay view for the camera.
            imagePickerController.showsCameraControls = false;
            Bundle.main.loadNibNamed("OverlayView", owner: self, options: nil)
        
        }
        
        self.imagePickerController = imagePickerController; // we need this for later
        self.present(imagePickerController, animated: true, completion: nil)
    }
    
    
    
    private func finishAndUpdate() {
        self.dismiss(animated: true) {
//            if let url = self.videoURL {
//                let player = AVPlayer(url: url)
//                let playerController = AVPlayerViewController()
//                playerController.player = player
//                self.present(playerController, animated: true, completion: nil)
//                player.play()
//            }
//            self.videoURL = nil
        }
        
        if self.capturedImages.count > 0 {
            self.imageView.image = self.capturedImages[0]
        }
        self.capturedImages.removeAll()
        self.imagePickerController = nil
    }
    
    
    // MARK: - UIImagePickerControllerDelegate   代理方法
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        switch info[UIImagePickerControllerMediaType] as! String {
        // 4. Detect different media types
        case String(kUTTypeMovie):
            if let url = info[UIImagePickerControllerReferenceURL] as? URL {
//                self.videoURL = url
            }
            else {
                print("Error getting url from picked asset")
            }
        case String(kUTTypeImage):
            if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
                self.capturedImages.append(image)
                print("appending \(image)")
            }
//            if let timer = self.cameraTimer,
//                timer.isValid {
//                print("continuing")
//                return
//            }
        default:
            print("Unknown type")
        }
        
        self.finishAndUpdate()
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    

    
}
