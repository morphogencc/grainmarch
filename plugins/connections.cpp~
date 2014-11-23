//
//  Grainmarch.cpp
//  GrainmarchFFGL
//
//  Created by Michael Dewberry on 11/21/13.
//
//

#include "PluginDefinition.h"
#include "connections.glsl"
#include "default_vertex_shader.glsl"

DECLARE_PLUGIN(SourcePlugin, "CCTN", "connections", "seed of life circle pulsar", "by Nathan Lachenmyer");

// Parameter(uniform name, minimum value, maximum value, default value, optional type (default standard/float.))

BEGIN_SHADER_PARAMETERS()
PARAM(time, 0.0, 6.28318530718, 0.0, FF_TYPE_STANDARD, true, true, AccumulateAction)
PARAM(scale, 0.0, 20.0, 1.0)
PARAM(linewidth, 0.0, 1.0, 0.1)
PARAM(speed, 0.0, 10.0, 1.0)
PARAM(overlap, 0.0, 2.0, 0.0)
PARAM(saturation, 0.0, 1.0, 1.0)
PARAM(even, 0.0, 1.0, 1.0)
PARAM(odd, 0.0, 1.0, 1.0)
PARAM(evenSpacing, 0.0, 5.0, 1.0)
PARAM(oddSpacing, 0.0, 5.0, 1.0)
END_SHADER_PARAMETERS()
