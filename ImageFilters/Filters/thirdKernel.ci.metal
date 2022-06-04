//
//  thirdKernel.ci.metal
//  GPUImage
//
//  Created by abdrahman on 04/06/2022.
//

#include <metal_stdlib>
using namespace metal;
#include <CoreImage/CoreImage.h> 

extern "C" { namespace coreimage {
float4 thirdKernel(sample_t s) {
      // 4
      float4 swappedColor;
      swappedColor.r = s.r;
      swappedColor.g = s.g;
      swappedColor.b = s.a;
      swappedColor.a = s.a;
      return swappedColor;
    }
}
}
