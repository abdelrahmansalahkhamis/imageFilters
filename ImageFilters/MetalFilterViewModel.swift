//
//  MetalFilterViewModel.swift
//  ImageFilters
//
//  Created by abdrahman on 04/06/2022.
//

import Foundation
import CoreImage

// view model class to act as intermediate between the main vc and the shaders
class MetalFilterViewModel{
    // this will contain the image to be filtered
    var inputImage: CIImage?
    
    
    // these are 5 computed properties that will access the shader bundles //
    
    // firstKernel
    var firstKernel: CIColorKernel = {
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
    
    // secondKernel
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
    
    // thirdKernel
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
    
    // forthKernel
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
    
    // fifthKernel
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
    
    // returning a ciimage after apply filter using kernal properties based on index of filter
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
