//
//  MetalFilterViewModel.swift
//  ImageFilters
//
//  Created by abdrahman on 04/06/2022.
//

import Foundation
import CoreImage

class MetalFilterViewModel: CIFilter{
    var inputImage: CIImage?
    
    var firstKernel: CIColorKernel = { () -> CIColorKernel in
        guard let url = Bundle.main.url(
          forResource: "firstKernel.ci",
          withExtension: "metallib"),
          let data = try? Data(contentsOf: url) else {
          fatalError("Unable to load metallib")
        }

        guard let kernel = try? CIColorKernel(
          functionName: "firstKernel",
          fromMetalLibraryData: data) else {
          fatalError("Unable to create color kernel")
        }

        return kernel
      }()
    
    var secondKernel: CIColorKernel = { () -> CIColorKernel in
        guard let url = Bundle.main.url(
          forResource: "secondKernel.ci",
          withExtension: "metallib"),
          let data = try? Data(contentsOf: url) else {
          fatalError("Unable to load metallib")
        }

        guard let kernel = try? CIColorKernel(
          functionName: "secondKernel",
          fromMetalLibraryData: data) else {
          fatalError("Unable to create color kernel")
        }

        return kernel
      }()
    
    var thirdKernel: CIColorKernel = { () -> CIColorKernel in
        guard let url = Bundle.main.url(
          forResource: "thirdKernel.ci",
          withExtension: "metallib"),
          let data = try? Data(contentsOf: url) else {
          fatalError("Unable to load metallib")
        }

        guard let kernel = try? CIColorKernel(
          functionName: "thirdKernel",
          fromMetalLibraryData: data) else {
          fatalError("Unable to create color kernel")
        }

        return kernel
      }()
    
    var forthKernel: CIColorKernel = { () -> CIColorKernel in
        guard let url = Bundle.main.url(
          forResource: "forthKernel.ci",
          withExtension: "metallib"),
          let data = try? Data(contentsOf: url) else {
          fatalError("Unable to load metallib")
        }

        guard let kernel = try? CIColorKernel(
          functionName: "forthKernel",
          fromMetalLibraryData: data) else {
          fatalError("Unable to create color kernel")
        }

        return kernel
      }()
    
    var fifthKernel: CIColorKernel = { () -> CIColorKernel in
        guard let url = Bundle.main.url(
          forResource: "fifthKernel.ci",
          withExtension: "metallib"),
          let data = try? Data(contentsOf: url) else {
          fatalError("Unable to load metallib")
        }

        guard let kernel = try? CIColorKernel(
          functionName: "fifthKernel",
          fromMetalLibraryData: data) else {
          fatalError("Unable to create color kernel")
        }

        return kernel
      }()
    
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func outputImage(_ index: Int) -> CIImage? {
        guard let inputImage = inputImage else {return nil}
        switch index{
        case 0:
            return firstKernel.apply(extent: inputImage.extent, arguments: [inputImage])
        case 1:
            return secondKernel.apply(extent: inputImage.extent, arguments: [inputImage])
        case 2:
            return thirdKernel.apply(extent: inputImage.extent, arguments: [inputImage])
        case 3:
            return forthKernel.apply(extent: inputImage.extent, arguments: [inputImage])
        case 4:
            return fifthKernel.apply(extent: inputImage.extent, arguments: [inputImage])
        default:
            return nil
        }
    }
}
