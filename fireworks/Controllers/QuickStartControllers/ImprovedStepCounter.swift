//
//  ImprovedStepCounter.swift
//  MC1-TestPrototypes
//
//  Created by Simone Formisano on 19/11/2019.
//  Copyright © 2019 DesingerWannaBee. All rights reserved.
//

import CoreMotion

// Delegate function protocol
protocol ImprovedStepCounterDelegate: NSObjectProtocol {
    func stepAccurate()
}

class ImprovedStepCounter: NSObject {
    /* TODO: try to tweak the threshold and accelleration initialized values
             to find a less sensible configuration, to avoid false positive
             steps by just moving the phone in the hand */
    
    private let cmManager = CMMotionManager()
    private var stepCount = true
    private var smoothedVerticalAcc = 0.0
    private var frame = 0
    private let V_THRESH_DEFAULT = 0.05 // Default threshold value
    private var vThresh = 0.05          // Initial threshold value (changes dynamically)
    private var reductionRate = 0.01    // Initial threshold value to be reduced per frame (changes dynamically)
    private let RESET_FRAME_NUM = 15.0  // The threshold returns the default value with the number of frames specified here.
    private let MIN_COUNT_FRAME = 12    // Minimum count frame
    var delegate: ImprovedStepCounterDelegate? // It will accept a class wich will be conform to the protocol (similar to interfaces in Java)
    
    func startStepCount(fps: Double) {
        cmManager.deviceMotionUpdateInterval = TimeInterval(1 / fps)
        cmManager.startDeviceMotionUpdates(to: OperationQueue.main, withHandler: handleMovement) // TODO: implement and use handleMoveImproved()
    }
    
    func stopAccMeter() {
        cmManager.stopDeviceMotionUpdates()
    }
    
    private func handleMovement(data: CMDeviceMotion?, error: Error?) {
        if data != nil {
            // Acceleration acquisition
            let x = data!.userAcceleration.x
            let y = data!.userAcceleration.y
            let z = data!.userAcceleration.z
            
            // Get tilt
            let rollRow = data!.attitude.roll
            let pitchRow = data!.attitude.pitch
            
            // Convert units to degrees
            let rollDeg = rollRow * 180.0 / Double.pi
            let pitchDeg = pitchRow * 180.0 / Double.pi
            
            // Normalized to be in the range of -90 degrees to +90 degrees
            var rollTmp = rollDeg
            
            if (rollDeg > 90.0) { // If the tilt is over 90 degrees, subtract the excess from 90
                rollTmp = 90.0 - (rollDeg - 90.0)
            } else if (rollDeg < -90) {
                rollTmp = -90.0 - (rollDeg + 90.0)
            }
            
            let roll_90 = rollTmp
            let pitch_90 = pitchDeg // Since pitch is in the range of -90 to +90 from the beginning, it remains as it is
            
            // Normalize to be in the range -1 to 1
            let roll = roll_90 / 90.0
            let pitch = pitch_90 / 90.0
            
            // Calculate vertical component weights
            let x_weight = roll * (1.0 - fabs(pitch))
            let y_weight = pitch * (-1)
            var z_weightTmp = 1.0 - (fabs(x_weight) + fabs(y_weight))
            
            if (fabs(rollDeg) > 90) {
                z_weightTmp = z_weightTmp * (-1)
            }
            
            let z_weight = z_weightTmp * (-1)
            
            // Calculate only the vertical component of acceleration
            let verticalAcc = x * x_weight + y * y_weight + z * z_weight
            
            // Smoothing
            smoothedVerticalAcc = verticalAcc * 0.1 + smoothedVerticalAcc * 0.9
           
            // Count steps
            if (smoothedVerticalAcc > vThresh && stepCount == true && frame > MIN_COUNT_FRAME) {
                stepCount = false
                frame = 0
                delegate?.stepAccurate() // the function will be accessed due to the class reference passed to delegate, which will implement the step function to be conform to the protocol
            } else if (smoothedVerticalAcc < 0.0) {
                stepCount = true
            }
            
            // Adjust the threshold dynamically (Reset the threshold value to the frame specified by RESET_FRAME_NUM)
            updateVThresh(smoothedVerticalAcc)
            
            print("x:\(x), y:\(y), z:\(z), roll:\(roll), pitch:\(pitch), x_weight:\(x_weight), y_weight:\(y_weight), z_weight:\(z_weight), verticalAcc:\(verticalAcc)") // realtime data printing
            
            frame += 1
        }
    }
    
    private func handleMoveImproved() {
        /* TODO: implement an even better motion handler for steps detecetion based on the experiments showed
                 in the paper here https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6211124/ in order to improve
                 accuracy and reducing errors */
    }
    
    // Threshold dynamical update processing
    private func updateVThresh(_ verticalAcc: Double) {
        if (verticalAcc > vThresh) {
            vThresh = verticalAcc
            reductionRate = (verticalAcc - V_THRESH_DEFAULT) / RESET_FRAME_NUM
        } else if (vThresh > V_THRESH_DEFAULT) {
            vThresh -= reductionRate
        } else {
            vThresh = V_THRESH_DEFAULT
        }
    }
}
