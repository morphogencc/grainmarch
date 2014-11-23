//
//  Grainmarch.cpp
//  GrainmarchFFGL
//
//  Created by Michael Dewberry on 11/21/13.
//
//

#include "PluginDefinition.h"
#include "silica.glsl"
#include "default_vertex_shader.glsl"

DECLARE_PLUGIN(SourcePlugin, "SIL", "silica", "A polychromatic perlin noise generator", "by Nathan Lachenmyer, modified from glsl.heroku.com")

// Parameter(uniform name, minimum value, maximum value, default value, optional type (default standard/float.))

BEGIN_SHADER_PARAMETERS()
PARAM(time, 0.0, 6.28318530718, 0.0, FF_TYPE_STANDARD, true, true, AccumulateAction)
PARAM(redIntensity, 0.0, 1.0, 1.0)
PARAM(greenIntensity, 0.0, 1.0, 0.0)
PARAM(blueIntensity, 0.0, 1.0, 0.0)
END_SHADER_PARAMETERS()
