//
//  cortex.cpp
//  cortexFFGL
//
//  Created by Nathan Lachenmyer
//
//

#include "PluginDefinition.h"
#include "cortex2.glsl"
#include "default_vertex_shader.glsl"

DECLARE_PLUGIN(SourcePlugin, 
	       "CRT2",
	       "cortex2", 
	       "form constant visual synthesizer",
	       "by Nathan Lachenmyer");

// Parameter(uniform name, minimum value, maximum value, default value, optional type (default standard/float.))

BEGIN_SHADER_PARAMETERS()
PARAM("Time", 0.0, 25.0, 0.0)
PARAM("wavenumber1", 0.0, 50.0, 5.0)
PARAM("period1", -20.0, 20.0, 5.0)
PARAM("amplitude1", 0.0, 2.0, 1.0)
PARAM("angle1", 0, 3.14159265359, 0.0)
PARAM("transform1", 0.0, 1.0, 0.0)
PARAM("wavenumber2", 0.0, 50.0, 5.0)
PARAM("period2", -20.0, 20.0, 5.0)
PARAM("amplitude2", 0.0, 2.0, 0.0)
PARAM("angle2", 0, 3.14159265359, 0.0)
PARAM("transform2", 0.0, 1.0, 0.0)
END_SHADER_PARAMETERS()
