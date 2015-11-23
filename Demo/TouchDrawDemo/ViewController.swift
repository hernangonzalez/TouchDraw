//
//  ViewController.swift
//  TouchDrawDemo
//
//  Created by Christian Paul Dehli on 10/4/15.
//

import UIKit
import TouchDraw

class ViewController: UIViewController, TouchDrawViewDelegate {
    
    @IBOutlet var drawView: TouchDrawView!
    @IBOutlet weak var undoButton: UIButton!
    @IBOutlet weak var redoButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        drawView.delegate = self
        drawView.setWidth(5)
        
        undoButton.enabled = false
        redoButton.enabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clear(sender: AnyObject) {
        drawView.clearDrawing()
    }
    
    @IBAction func randomColor(sender: AnyObject) {
        let r = CGFloat(random() % 255) / 255
        let g = CGFloat(random() % 255) / 255
        let b = CGFloat(random() % 255) / 255
        
        let color = UIColor(red: r, green: g, blue: b, alpha: 1.0)
        drawView.setColor(color)
    }
    
    @IBAction func undo(sender: AnyObject) {
        drawView.undo()
    }
    
    @IBAction func redo(sender: AnyObject) {
        drawView.redo()
    }
    
    func undoEnabled() {
        self.undoButton.enabled = true
    }
    
    func undoDisabled() {
        self.undoButton.enabled = false
    }
    
    func redoEnabled() {
        self.redoButton.enabled = true
    }
    
    func redoDisabled() {
        self.redoButton.enabled = false
    }
}
