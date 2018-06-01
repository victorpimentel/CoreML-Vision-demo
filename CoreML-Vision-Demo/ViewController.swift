//
//  ViewController.swift
//  cameraTest
//
//  Created by Mark Mansur on 2017-08-01.
//  Copyright © 2017 Mark Mansur. All rights reserved.
//

import UIKit
import DrawerKit
import AVFoundation
import Vision

class ViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {
    let top5Label: UILabel = {
        let top5Label = UILabel()
        top5Label.textColor = .white
        top5Label.translatesAutoresizingMaskIntoConstraints = false
        top5Label.numberOfLines = 5
        top5Label.text = ""
        top5Label.font = top5Label.font.withSize(15)
        return top5Label
    }()

    let finishButton: UIButton = {
        let finishButton = UIButton.init(type: UIButtonType.system)
        finishButton.setTitleColor(.white, for: .normal)
        finishButton.setTitle("Acabar", for: .normal)
        finishButton.translatesAutoresizingMaskIntoConstraints = false
        finishButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        finishButton.isHidden = true
        return finishButton
    }()

    var workItem: DispatchWorkItem?
    var enqueuedLabel: String?
    var wasPresentedAtLeastOnce = false
    var stopUpdates = false
    var previousCount = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        setupCaptureSession()
        view.addSubview(top5Label)
        view.addSubview(finishButton)
        setupConstraints()

        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.doModalPresentation()
        }
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
        let request = VNCoreMLRequest(model: model) { finishedRequest, error in
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

    func setupConstraints() {
        top5Label.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        top5Label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true

        finishButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 32).isActive = true
        finishButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12).isActive = true
    }

    func didFind(label: String) {
        guard !stopUpdates else { return }

        foodViewController.foodLabel = label

        if wasPresentedAtLeastOnce && foodViewController.presentingViewController == nil {
            present(foodViewController, animated: true)
        }
    }

    func didLoseFocus() {
        guard !stopUpdates else { return }

        foodViewController.foodLabel = nil
    }

    private var drawerDisplayController: DrawerDisplayController?
    private let foodViewController = FoodViewController(nibName: nil, bundle: nil)

    func doModalPresentation() {
        // you can provide the configuration values in the initialiser...
        var configuration = DrawerConfiguration()

//        configuration.totalDurationInSeconds = 3 // default is 0.4
//        configuration.durationIsProportionalToDistanceTraveled = false
        // default is UISpringTimingParameters()
//        configuration.timingCurveProvider = UISpringTimingParameters(dampingRatio: 0.8)
//        configuration.fullExpansionBehaviour = .leavesCustomGap(gap: 100) // default is .coversFullScreen
//        configuration.supportsPartialExpansion = true
//        configuration.dismissesInStages = true
//        configuration.isDrawerDraggable = true
//        configuration.isFullyPresentableByDrawerTaps = true
//        configuration.numberOfTapsForFullDrawerPresentation = 1
//        configuration.isDismissableByOutsideDrawerTaps = true
//        configuration.numberOfTapsForOutsideDrawerDismissal = 1
//        configuration.flickSpeedThreshold = 3
//        configuration.upperMarkGap = 100 // default is 40
//        configuration.lowerMarkGap =  80 // default is 40
        configuration.maximumCornerRadius = 35

//        var handleViewConfiguration = HandleViewConfiguration()
//        handleViewConfiguration.autoAnimatesDimming = true
//        handleViewConfiguration.backgroundColor = .gray
//        handleViewConfiguration.size = CGSize(width: 40, height: 6)
//        handleViewConfiguration.top = 8
//        handleViewConfiguration.cornerRadius = .automatic
//        configuration.handleViewConfiguration = handleViewConfiguration

//        let borderColor = UIColor(red: 205.0/255.0, green: 206.0/255.0, blue: 210.0/255.0, alpha: 1)
//        let drawerBorderConfiguration = DrawerBorderConfiguration(borderThickness: 0.5,
//                                                                  borderColor: borderColor)
//        configuration.drawerBorderConfiguration = drawerBorderConfiguration

//        let drawerShadowConfiguration = DrawerShadowConfiguration(shadowOpacity: 0.25,
//                                                                  shadowRadius: 4,
//                                                                  shadowOffset: .zero,
//                                                                  shadowColor: .black)
//        configuration.drawerShadowConfiguration = drawerShadowConfiguration

        drawerDisplayController = DrawerDisplayController(presentingViewController: self,
                                                          presentedViewController: foodViewController,
                                                          configuration: configuration,
                                                          inDebugMode: false)

        present(foodViewController, animated: true) {
            self.wasPresentedAtLeastOnce = true
        }
    }

    func updateFinishButton() {
        let count = Dish.current.ingredients.count

        if count > 0 {
            finishButton.isHidden = false

            if previousCount != count {
                previousCount = count

                UIView.animate(withDuration: 0.25, animations: {
                    self.finishButton.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
                }, completion: { _ in
                    UIView.animate(withDuration: 0.25) {
                        self.finishButton.transform = CGAffineTransform(scaleX: 1, y: 1)
                    }
                })
            }

            finishButton.setTitle("Acabar (\(count))", for: .normal)
        } else {
            finishButton.isHidden = true
        }
    }
}

extension ViewController: DrawerAnimationParticipant {
    var drawerAnimationActions: DrawerKit.DrawerAnimationActions {
        return DrawerAnimationActions(prepare: { info in
            if info.endDrawerState != .partiallyExpanded {
                self.stopUpdates = true
            }
        }, cleanup: { info in
            if info.endDrawerState != .fullyExpanded {
                self.stopUpdates = false
                self.updateFinishButton()
            }
        })
    }
}
