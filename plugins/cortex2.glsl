char fragmentShaderCode[] = R"(
#version 120
//precision highp float;

uniform float iResolutionX, iResolutionY;
uniform float Time;
uniform float wavenumber1, wavenumber2;
uniform float period1, period2;
uniform float amplitude1, amplitude2;
uniform float angle1, angle2;
uniform float transform1, transform2;

const float PI = 3.1415926535;

void main( void ) {
    vec2 resolution = vec2(iResolutionX, iResolutionY);
    vec2 position = (gl_FragCoord.xy/resolution.xy);
    
    float diagonal = length(resolution); //diagonal

    float cX = position.x - 0.5;
    float cY = position.y - 0.5;
    
    float newX = log(sqrt(cX*cX + cY*cY));
    float newY = atan(cX, cY);
    
    float x1 = transform1*cX + (1.0 - transform1)*newX;
    float y1 = transform1*cY + (1.0 - transform1)*newY;

    float x2 = transform2*cX + (1.0 - transform2)*newX;
    float y2 = transform2*cY + (1.0 - transform2)*newY;

    float color = 0.0;
    
    color += amplitude1 * (cos(2.0*wavenumber1*(x1*sin(angle1) + y1*cos(angle1)) + period1*Time));

    //overall brightness/color
    //color *= cos(Time/10.0);
    gl_FragColor = vec4( vec3( sin( color + Time / 3.0 ) * 0.75, color, sin( color + Time / 3.0 ) * 0.75 ), 1.0 );
    //gl_FragColor = vec4(1.0,0.0,0.0,1.0);
    
}
)";