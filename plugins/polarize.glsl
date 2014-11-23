char vertexShaderCode[] = R"(

/*
uniform sampler2D inputTexture0;

void main() {
    gl_Position = gl_Vertex;
    gl_TexCoord[0] = gl_MultiTexCoord0;
}
*/

varying vec2 texcoord0;
varying vec2 texcoord1;
varying vec2 texdim0;
varying vec2 texdim1;
varying vec2 texorient0;
varying vec2 texorient1;

void main()
{
    // perform standard transform on vertex
    gl_Position = ftransform();

    // transform texcoords
    texcoord0 = vec2(gl_TextureMatrix[0] * gl_MultiTexCoord0);
    texcoord1 = vec2(gl_TextureMatrix[1] * gl_MultiTexCoord1);
    // extract the x and y scalars from the texture matrix to determine dimensions
    texdim0 = vec2 (abs(gl_TextureMatrix[0][0][0]),abs(gl_TextureMatrix[0][1][1]));
    texdim1 = vec2 (abs(gl_TextureMatrix[1][0][0]),abs(gl_TextureMatrix[1][1][1]));
    // extract the sign for orientation
    texorient0 = vec2 (gl_TextureMatrix[0][0][0]/texdim0.x,gl_TextureMatrix[0][1][1]/texdim0.y);
    texorient1 = vec2 (gl_TextureMatrix[1][0][0]/texdim1.x,gl_TextureMatrix[1][1][1]/texdim1.y);
}

)";

char fragmentShaderCode[] = R"(

/*
#version 120

uniform float iResolutionX;
uniform float iResolutionY;
uniform sampler2D inputTexture0;

const float pi = 3.14159

void main() {
     vec2 uv = gl_TexCoord[0].xy + 0.5;
     float theta = atan(uv.y, uv.x) + pi;
     float r = sqrt(dot(uv,uv));
     vec2 shifted = vec2(r,theta);
     gl_FragColor = texture2D(inputTexture0, shifted);

}
*/

varying vec2 texcoord0;
varying vec2 texdim0;
uniform vec2 origin;
uniform vec2 scale;
uniform sampler2DRect tex0;
const float pi=3.1415926;


void main()
{
	vec2 point = abs(mod((texcoord0/texdim0)*scale+origin,1.));//normalize coordinates
    
	// cartesian to polar conversion
	vec2 dt = 2.*(point-0.5);
	float radius = sqrt(dot(dt,dt)); //hypot
	float theta = atan(dt.y,dt.x)+pi;
	vec2 topol = vec2(radius,theta/(2.*pi))*texdim0;
	vec4 a = texture2DRect(inputTexture0,topol);
	// output texture
	gl_FragColor = a;
}

)";