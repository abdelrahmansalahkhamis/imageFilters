//
//  forthKernel.ci.metal
//  GPUImage
//
//  Created by abdrahman on 04/06/2022.
//

#include <metal_stdlib>
using namespace metal;
#include <CoreImage/CoreImage.h> 

extern "C" { namespace coreimage {
float4 forthKernel(sample_t s) {
      // 4
      float4 swappedColor;
      swappedColor.r = s.g;
      swappedColor.g = s.g;
      swappedColor.b = s.r;
      swappedColor.a = s.a;
      return swappedColor;
    }
}
}
