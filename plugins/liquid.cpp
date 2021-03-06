//
//  Grainmarch.cpp
//  GrainmarchFFGL
//
//  Created by Michael Dewberry on 11/21/13.
//
//

#include "PluginDefinition.h"
#include "liquid.glsl"
#include "default_vertex_shader.glsl"

DECLARE_PLUGIN(SourcePlugin, "LIQD", "liquid", "A monotone perlin noise generator, reminiscent of liquid", "by Nathan Lachenmyer, modified from glsl.heroku.com")

// Parameter(uniform name, minimum value, maximum value, default value, optional type (default standard/float.))

BEGIN_SHADER_PARAMETERS()
PARAM(time, 0.0, 6.28318530718, 0.0, FF_TYPE_STANDARD, true, true, AccumulateAction)
PARAM(frequency, 0.0, 16.0, 4.0)
PARAM(layer1, 0.0, 1.0, 1.0)
PARAM(layer2, 0.0, 1.0, 0.0)
PARAM(layer4, 0.0, 1.0, 0.0)
PARAM(layer8, 0.0, 1.0, 0.0)
END_SHADER_PARAMETERS()
