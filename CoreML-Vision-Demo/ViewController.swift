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
        label.text = "Point to food!"
        label.font = label.font.withSize(30)
        return label
    }()

    let top5Label: UILabel = {
        let top5Label = UILabel()
        top5Label.textColor = .white
        top5Label.translatesAutoresizingMaskIntoConstraints = false
        top5Label.numberOfLines = 5
        top5Label.text = ""
        top5Label.font = top5Label.font.withSize(15)
        return top5Label
    }()

    var workItem: DispatchWorkItem?
    var enqueuedLabel: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCaptureSession()
        
        view.addSubview(label)
        view.addSubview(top5Label)
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

            let top5 = results.prefix(5).map { String(format: "\($0.identifier): %.2f%%", $0.confidence * 100) }
                .joined(separator: "\n")

            if self.enqueuedLabel != label {
                self.workItem?.cancel()

                var workItem: DispatchWorkItem!

                if label == "" {
                    workItem = DispatchWorkItem {
                        guard !workItem.isCancelled else { return }
                        self.didLoseFocus()
                    }
                } else {
                    workItem = DispatchWorkItem {
                        guard !workItem.isCancelled else { return }
                        self.didFind(label: label)
                        self.top5Label.text = top5
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
        top5Label.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        top5Label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
    }

    func didFind(label: String) {
        self.label.text = label
    }

    func didLoseFocus() {
        self.label.text = ""
    }
}
