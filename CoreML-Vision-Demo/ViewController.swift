//
//  ViewController.swift
//  cameraTest
//
//  Created by Mark Mansur on 2017-08-01.
//  Copyright © 2017 Mark Mansur. All rights reserved.
//

import UIKit
import AVFoundation
import Vision

class ViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {
    let label: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Point food!"
        label.font = label.font.withSize(30)
        return label
    }()

    var workItem: DispatchWorkItem?
    var enqueuedLabel: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCaptureSession()
        
        view.addSubview(label)
        setupLabel()
    }
    
    
    func setupCaptureSession() {
        
        // creates a new capture session
        let captureSession = AVCaptureSession()
        
        // search for available capture devices
        let availableDevices = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInWideAngleCamera], mediaType: AVMediaType.video, position: .back).devices
        
        // get capture device, add device input to capture session
        do {
            if let captureDevice = availableDevices.first {
                captureSession.addInput(try AVCaptureDeviceInput(device: captureDevice))
            }
        } catch {
            print(error.localizedDescription)
        }
        
        // setup output, add output to capture session
        let captureOutput = AVCaptureVideoDataOutput()
        captureSession.addOutput(captureOutput)
        
        captureOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "videoQueue"))
        
        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.frame = view.frame
        view.layer.addSublayer(previewLayer)
        
        captureSession.startRunning()
    }
    
    // called everytime a frame is captured
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        guard let model = try? VNCoreMLModel(for: OperacionBikini().model) else { return }
        let request = VNCoreMLRequest(model: model) { [unowned self] (finishedRequest, error) in
            guard let results = finishedRequest.results as? [VNClassificationObservation] else { return }
            let label = results
                .filter { $0.confidence > 0.5 }
                .map { "\($0.identifier)" }
                .joined(separator: "")

            if self.enqueuedLabel != label {
                self.workItem?.cancel()

                var workItem: DispatchWorkItem!

                if label == "" {
                    workItem = DispatchWorkItem {
                        guard !workItem.isCancelled else { return }
                        self.didLostFocus()
                    }
                } else {
                    workItem = DispatchWorkItem {
                        guard !workItem.isCancelled else { return }
                        self.didFind(label: label)
                    }
                }

                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: workItem)
            }

            self.enqueuedLabel = label
        }
        guard let pixelBuffer: CVPixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return }
        
        // executes request
        try? VNImageRequestHandler(cvPixelBuffer: pixelBuffer, options: [:]).perform([request])
    }
    
    func setupLabel() {
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
    }

    func didFind(label: String) {
        self.label.text = label
    }

    func didLostFocus() {
        self.label.text = ""
    }
}
