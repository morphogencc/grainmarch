//
//  Grainmarch.cpp
//  GrainmarchFFGL
//
//  Created by Michael Dewberry on 11/21/13.
//
//

#include "PluginDefinition.h"
#include "isis.glsl"
#include "default_vertex_shader.glsl"

DECLARE_PLUGIN(SourcePlugin, "ISIS", "isis", "A wave interference pattern generator", "by Nathan Lachenmyer, modified from glsl.heroku.com")

// Parameter(uniform name, minimum value, maximum value, default value, optional type (default standard/float.))

BEGIN_SHADER_PARAMETERS()
PARAM(time, 0.0, 6.28318530718, 0.0, FF_TYPE_STANDARD, true, true, AccumulateAction)
PARAM(polar, 0.0, 1.0, 0.0)
PARAM(gridX, 0.0, 1.0, 0.0)
PARAM(gridY, 0.0, 1.0, 0.0)
PARAM(first_octave, 0.0, 1.0, 1.0)
PARAM(second_octave, 0.0, 1.0, 1.0)
PARAM(third_octave, 0.0, 1.0, 1.0)
PARAM(first_frequency, 1.0, 50.0, 10.0)
PARAM(second_frequency, 1.0, 50.0, 10.0)
PARAM(third_frequency, 1.0, 50.0, 10.0)
PARAM(first_ratio, 0.0, 1.0, 0.5)
PARAM(second_ratio, 0.0, 1.0, 0.5)
PARAM(third_ratio, 0.0, 1.0, 0.5)
PARAM(gridX_density, 0.0, 1.0, 0.5)
PARAM(gridY_density, 0.0, 1.0, 0.5)
END_SHADER_PARAMETERS()
