# Scriabin: Sonic Paintings

# Mateo Larrea (0851571)
### EP-453 Mobile Programming for iOS
### Spring 2020
### Instructor: Akito Van Troyer
## Final Project

### About the project: 

Scriabin is an iOS-based application that allows users to paint and compose music simultaneously based on Alexander Scriabin's Synesthetic Circle of Fifths. Through the combination of notes and color, users are limited to parameters that will push them to explore their creativity.

Synesthesia is a condition in which one sense (for example, hearing) is simultaneously perceived as if by one or more additional senses such as sight.

### Vision: 

This project is an attempt of creating a new instrument that allows everyone (regardless of their musical and artistic trainning) compose coherent pieces in a harmonic context.

### Structure: 
Main Menu --> Offers different keys that represent a color. (At the moment one of the 12 tones is available for users).
Canvas --> Once a key is selected, the canvas appears. The canvas has a drone on/off swith, a pencill with 4 options of color (each one creates a sound [do, re, fa, sol), an invinsible grid to play the ionian mode (horizontally - using centerY), an undo and clear button that trigger different sound, and an slider to adjust the line width. 

This application uses Navegation Controller to move between screens 

### Files: 
ViewController.swift --> Contains all of the structure of the code
Canvas.swift  --> Contains the mechanisms to draw
Line.swift --> Contains the struct Line
Scriabin.Audio [botones, Dmajor, notes] --> Contains multiple audio files that are been used 



### Getting Started: 
This application requires Xcode in order to run. A part from that, it doesn't require any specific configuration in order to run. It only uses AVFoundation and UIKit.



### Current Estate:

Negative: 
- Originally the application was supposed to use AudioKit in order to synch the behavior of the line with a synthesizor. However, at the end it was through buttoms that the grid was established (as a more simple way to play audio tracks)
Positive: The project has very functional drawing capacities and it plays sound (making it possible to connect the visual with the sonic
Future:
improve the behavior of the grid/cells, finish the rest of the keys, make the code a little bit for efficient (using more functions)




### References: 
Let's Build that App https://www.letsbuildthatapp.com/
AudioKit https://vimeo.com/search?q=audiokit
