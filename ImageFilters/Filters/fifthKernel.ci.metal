//
//  fifthKernel.ci.metal
//  GPUImage
//
//  Created by abdrahman on 04/06/2022.
//

#include <metal_stdlib>
using namespace metal;
#include <CoreImage/CoreImage.h>

//extern "C" { namespace coreimage {
//float4 fifthKernel(sample_t s) {
//      // 4
//      float4 swappedColor;
//      swappedColor.r = s.r;
//      swappedColor.g = s.a;
//      swappedColor.b = s.b;
//      swappedColor.a = s.g;
//      return swappedColor;
//    }
//}
//}
extern "C" { namespace coreimage {
float4 fifthKernel(sample_t s) {
    return s.grba;
}
}}
