
//  ViewController.swift
//  ScriabinTest1
//
//  Created by Mateo Larrea Ferro on 4/28/20.
//  Copyright © 2020 Mateo Larrea Ferro. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let canvas = Canvas()
    
    //Experimento Botones
    let doButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("DO", for: .reserved)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(handleDo), for: .touchDown)
        return button
    }()
    @objc fileprivate func handleDo() {
        soundPlayer(player: &doPlayer, path: doScalePath, count: 0)
    }
    let reButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("RE", for: .reserved)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(handleRe), for: .touchDown)
        return button
    }()
    @objc fileprivate func handleRe() {
        soundPlayer(player: &rePlayer, path: reScalePath, count: 0)
    }
    let miButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("MI", for: .reserved)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(handleMi), for: .touchDown)
        return button
    }()
    @objc fileprivate func handleMi() {
        soundPlayer(player: &miPlayer, path: miScalePath, count: 0)
    }
    let faButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("FA", for: .reserved)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(handleFa), for: .touchDown)
        return button
    }()
    @objc fileprivate func handleFa() {
        soundPlayer(player: &faPlayer, path: faScalePath, count: 0)
    }
    let solButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("SOL", for: .reserved)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(handleSol), for: .touchDown)
        return button
    }()
    @objc fileprivate func handleSol() {
        soundPlayer(player: &solPlayer, path: solScalePath, count: 0)
    }
    let laButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("LA", for: .reserved)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(handleLa), for: .touchDown)
        return button
    }()
    @objc fileprivate func handleLa() {
        soundPlayer(player: &laPlayer, path: laScalePath, count: 0)
    }
    let tiButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("TI", for: .reserved)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(handleTi), for: .touchDown)
        return button
    }()
    @objc fileprivate func handleTi() {
        soundPlayer(player: &tiPlayer, path: tiScalePath, count: 0)
    }
    
    //All of the Buttons
    
    let undoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Undo", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(handleUndo), for: .touchUpInside)
        return button
    }()
    @objc fileprivate func handleUndo() {
        print("Undo lines drawn")
        canvas.undo()
        soundPlayer(player: &undoPlayer, path: undoPath, count: 0)
    }
   
    let clearButton: UIButton = {
           let button = UIButton(type: .system)
           button.setTitle("Clear", for: .normal)
           button.titleLabel?.font = .boldSystemFont(ofSize: 14)
            button.addTarget(self, action: #selector(handleClear), for: .touchUpInside)
           return button
       
       }()
    @objc fileprivate func handleClear() {
        canvas.clear()
        print("Borra toda la huevada!")
        soundPlayer(player: &clearPlayer, path: clearPath, count: 0)
    }
    let playButton: UIButton = {
              let button = UIButton(type: .system)
              button.setTitle("Play", for: .normal)
              button.titleLabel?.font = .boldSystemFont(ofSize: 14)
               button.addTarget(self, action: #selector(handlePlay), for: .touchUpInside)
              return button
          
          }()
       @objc fileprivate func handlePlay() {
           soundPlayer(player: &dronePlayer, path: dDronePath, count: -1)
           print("Venga!")
       }
    let stopButton: UIButton = {
        let button = UIButton(type: .system)
                 button.setTitle("Stop", for: .normal)
                 button.titleLabel?.font = .boldSystemFont(ofSize: 14)
                  button.addTarget(self, action: #selector(handleStop), for: .touchUpInside)
                 return button
             
             }()
          @objc fileprivate func handleStop() {
            dronePlayer.stop()
              print("Venga!")
          }
    let color1: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .yellow
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(handleColorChange), for: .touchUpInside)
        return button
        //Con este escoges el color para dibujar
        
    }()
    let color2: UIButton = {
          let button = UIButton(type: .system)
          button.backgroundColor = .systemBlue
          button.layer.borderWidth = 1
          button.addTarget(self, action: #selector(handleColorChange), for: .touchUpInside)
          return button
          //Con este escoges el 2do color
          
      }()
    let color3: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .orange
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(handleColorChange), for: .touchUpInside)
        return button
  
         }()
    let color4: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .green
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(handleColorChange), for: .touchUpInside)
        return button
       
        
    }()
    @objc fileprivate func handleColorChange (button: UIButton) {
        canvas.setStrokeColor (color: button.backgroundColor ?? .black)
        if color1.isTouchInside{
            soundPlayer(player: &dNotePlayer, path: dNotePath, count: 0)
        }
        else if color2.isTouchInside {
            soundPlayer(player: &eNotePlayer, path: eNotePath, count: 0)
        }
        if color3.isTouchInside {
            soundPlayer(player: &gNotePlayer, path: gNotePath, count: 0)
        }
        else if color4.isTouchInside {
            soundPlayer(player: &aNotePlayer, path: aNotePath, count: 0)
        }
        
    }
    //UI Slider
    
    let slider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 1
        slider.maximumValue = 10
        slider.addTarget(self, action: #selector(handleSliderChange), for: .valueChanged)
        return slider
        
    } ()
    
    @objc fileprivate func handleSliderChange() {
        canvas.setStrokeWidth(width: slider.value)
        soundPlayer(player: &aNotePlayer, path: aNotePath, count: 0)
       
    }

    //LoadView!!!
    override func loadView() {
        self.view = canvas
        
    }
    //Cells PT 1
    //let numViewPerRow = 15
    //var cells = [String: UIView]()
    
    //Finally --> viewDidLoad!!!
    override func viewDidLoad() {
        super.viewDidLoad()
        canvas.backgroundColor = .white
        
        
        setupLayout()
    //CELL-GRID
            /* let width = view.frame.width / CGFloat(numViewPerRow)
             
             for j in 0...15 {
                 for i in 0...numViewPerRow {
                     let cellView = UIView()
                     
                     cellView.frame = CGRect(x: CGFloat(i) * width, y: CGFloat(j) * width, width: width, height: width)
                     view.addSubview(cellView)
                    let key = "\(i)|\(j)"
                    cells [key] = cellView
                 }
             }
             
             view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handlePan)))
         }
         
         @objc func handlePan(gesture: UIPanGestureRecognizer) {
             let location = gesture.location(in: view)
             //print(location)
            
            let width = view.frame.width / CGFloat(numViewPerRow)
            let i = Int(location.x / width)
            let j = Int(location.y / width)
            print (i, j)
            //soundPlayer(player: &aNotePlayer, path: aNotePath, count: 0)
        
            
            
            let key = "\(i)|\(j)"
            _ = cells[key]
            
            
            for subview in view.subviews {
                if subview.frame.contains(location) {
                    print("okkkkk")
                }
            } */
         }
        
    
        
        
        
        //AUDIO RELATED STUFF
    //Paths
    let dDronePath = Bundle.main.bundleURL.appendingPathComponent("d.drone.mp3")
    let dNotePath = Bundle.main.bundleURL.appendingPathComponent("d.note.wav")
    let eNotePath = Bundle.main.bundleURL.appendingPathComponent("e.note.wav")
    let gNotePath = Bundle.main.bundleURL.appendingPathComponent("g.note.wav")
    let aNotePath = Bundle.main.bundleURL.appendingPathComponent("a.note.wav")
    let doScalePath = Bundle.main.bundleURL.appendingPathComponent("do.wav")
    let reScalePath = Bundle.main.bundleURL.appendingPathComponent("re.wav")
    let miScalePath = Bundle.main.bundleURL.appendingPathComponent("mi.wav")
    let faScalePath = Bundle.main.bundleURL.appendingPathComponent("fa.wav")
    let solScalePath = Bundle.main.bundleURL.appendingPathComponent("sol.wav")
    let laScalePath = Bundle.main.bundleURL.appendingPathComponent("la.wav")
    let tiScalePath = Bundle.main.bundleURL.appendingPathComponent("ti.wav")
    let clearPath = Bundle.main.bundleURL.appendingPathComponent("clear.wav")
    let undoPath = Bundle.main.bundleURL.appendingPathComponent("undo.wav")
    
    //Players
    var dronePlayer = AVAudioPlayer()
    var dNotePlayer = AVAudioPlayer()
    var eNotePlayer = AVAudioPlayer()
    var gNotePlayer = AVAudioPlayer()
    var aNotePlayer = AVAudioPlayer()
    var doPlayer = AVAudioPlayer()
    var rePlayer = AVAudioPlayer()
    var miPlayer = AVAudioPlayer()
    var faPlayer = AVAudioPlayer()
    var solPlayer = AVAudioPlayer()
    var laPlayer = AVAudioPlayer()
    var tiPlayer = AVAudioPlayer()
    var clearPlayer = AVAudioPlayer()
    var undoPlayer = AVAudioPlayer()
    fileprivate func soundPlayer(player:inout AVAudioPlayer, path: URL, count: Int){
        do {
            player = try AVAudioPlayer(contentsOf: path, fileTypeHint: nil)
            player.numberOfLoops = count
            player.play()
        }
        catch {
            print("Error in playing sound")
        }
    }
   
//CONSTRAINTS
    fileprivate func setupLayout() {
        
    
        // Setup after loading the arangedSubviews
        let colorsStackView = UIStackView(arrangedSubviews: [color1, color2, color3, color4])
        colorsStackView.distribution = .fillEqually
        let stackView = UIStackView(arrangedSubviews: [colorsStackView, slider])
        stackView.distribution = .fillEqually
        stackView.spacing = 6
        let topStackView = UIStackView(arrangedSubviews: [undoButton, clearButton, playButton, stopButton])
        topStackView.distribution = .fillEqually
        let centerStackView = UIStackView(arrangedSubviews: [doButton, reButton, miButton, faButton, solButton, laButton, tiButton])
        centerStackView.distribution = .fillEqually
        
        
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -6).isActive = true
        
        view.addSubview(topStackView)
         topStackView.translatesAutoresizingMaskIntoConstraints = false
         topStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
         topStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
         topStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        view.addSubview(centerStackView)
        centerStackView.translatesAutoresizingMaskIntoConstraints = false
         centerStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
         centerStackView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
         centerStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        
    }
    
        
        }
    






