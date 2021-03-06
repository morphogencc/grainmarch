//
//  Grainmarch.cpp
//  GrainmarchFFGL
//
//  Created by Michael Dewberry on 11/21/13.
//
//

#include "PluginDefinition.h"
#include "voronoi.glsl"
#include "default_vertex_shader.glsl"

DECLARE_PLUGIN(SourcePlugin, "VNOI", "voronoi", "A voronoi cell generator", "by Nathan Lachenmyer, modified from glsl.heroku.com")

// Parameter(uniform name, minimum value, maximum value, default value, optional type (default standard/float.))

BEGIN_SHADER_PARAMETERS()
PARAM(time, 0.0, 6.28318530718, 0.0, FF_TYPE_STANDARD, true, true, AccumulateAction)
PARAM(mode, 0.0, 3.0, 0.0)
PARAM(scale, 1.0, 20.0, 10.0)
END_SHADER_PARAMETERS()
