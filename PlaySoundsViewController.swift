//
//  PlaySoundsViewController.swift
//  Pitch Perfect
//
//  Created by Jessie Torres on 3/8/15.
//  Copyright (c) 2015 jessInteractive. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    var audioPlayer: AVAudioPlayer!
    var receivedAudio: RecordedAudio!
    
    var audioEngine:AVAudioEngine!
    var audioFile:AVAudioFile!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        //        if var filePath = NSBundle.mainBundle().pathForResource("movie_quote", ofType: "mp3"){
        //            var filePath = NSURL.fileURLWithPath(filePath)
        //
        //
        //        }else {
        //            println("the filePath is empty")
        //        }
        
        audioPlayer = AVAudioPlayer(contentsOfURL: receivedAudio.filePathUrl, error: nil)
        audioPlayer.enableRate = true
        
        audioEngine = AVAudioEngine()
        audioFile = AVAudioFile(forReading: receivedAudio.filePathUrl, error: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playSoundSlowly(sender: AnyObject) {
        // Plays audio slowly
        audioPlayer.stop()
        playAudioWithVariableSpeed(0.5)
    }
    
    @IBAction func playSoundFast(sender: AnyObject) {
        // plays audio fast
        audioPlayer.stop()
        playAudioWithVariableSpeed(1.5)
    }
    
    @IBAction func playChipmunkAudio(sender: AnyObject) {
        //play chipmunk audio
        audioPlayer.stop()
        
        playAudioWithVariablePitch(1000)
    }
    
    func playAudioWithVariableSpeed(speed: Float32){
        audioPlayer.stop()
        audioPlayer.rate = speed
        audioPlayer.currentTime = 0.0
        audioPlayer.play()
    }
    
    func playAudioWithVariablePitch(pitch: Float){
        audioPlayer.stop()
        audioEngine.stop()
        audioEngine.reset()
        
        var audioPlayerNode = AVAudioPlayerNode()
        audioEngine.attachNode(audioPlayerNode)
        
        var changePitchEffect = AVAudioUnitTimePitch()
        changePitchEffect.pitch = pitch
        audioEngine.attachNode(changePitchEffect)
        
        audioEngine.connect(audioPlayerNode, to: changePitchEffect, format: nil)
        audioEngine.connect(changePitchEffect, to: audioEngine.outputNode, format: nil)
        
        audioPlayerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
        audioEngine.startAndReturnError(nil)
        
        audioPlayerNode.play()
    }
    
    
    @IBAction func playDarthVaderAudio(sender: AnyObject) {
        playAudioWithVariablePitch(-1000)
    }
    
    
    @IBAction func stopPlayback(sender: AnyObject) {
        // Stops Audio playback
        audioPlayer.stop()
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
