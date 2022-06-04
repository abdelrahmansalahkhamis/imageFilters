//
//  kernel.metal
//  GPUImage
//
//  Created by abdrahman on 04/06/2022.
//

#include <metal_stdlib>
using namespace metal;
#include <CoreImage/CoreImage.h> // includes CIKernelMetalLib.h

//extern "C" { namespace coreimage {
//
//    float4 myColor(sample_t s) {
//        return s.grba;
//    }
//}}

extern "C" { namespace coreimage {
float4 firstKernel(sample_t s) {
      // 4
      float4 swappedColor;
      swappedColor.r = s.g;
      swappedColor.g = s.b;
      swappedColor.b = s.r;
      swappedColor.a = s.a;
      return swappedColor;
    }
}
}


