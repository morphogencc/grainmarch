char fragmentShaderCode[] = R"(

#ifdef GL_ES
precision highp float;
#endif

uniform float iResolutionX, iResolutionY;
uniform float time;
uniform float polar;
uniform float gridX;
uniform float gridY;
uniform float first_octave;
uniform float second_octave;
uniform float third_octave;
uniform float first_frequency;
uniform float second_frequency;
uniform float third_frequency;
uniform float first_ratio;
uniform float second_ratio;
uniform float third_ratio;
uniform float gridX_density;
uniform float gridY_density;

void main( void ) {
     vec2 resolution = vec2(iResolutionX, iResolutionY);
     vec2 position = (gl_FragCoord.xy / resolution.xy);

     float cX = position.x - 0.5;
     float cY = position.y - 0.5;

     float polarX = log(sqrt(cX*cX + cY*cY));
     float polarY = atan(cX, cY);
         
     float newX = (1.0 - polar)*cX + polar*polarX;
     float newY = (1.0 - polar)*cY + polar*polarY;

     float color = 0.0;
     color += first_octave*cos( newX * cos(time / first_frequency ) * first_ratio*80.0 ) + cos( newX * cos(time / first_frequency ) * (1.0 - first_ratio)*80.0 );
     color += second_octave*cos( newY * cos(time / second_frequency ) * second_ratio*80.0 ) + cos( newY * sin(time / second_frequency ) * (1.0 - second_ratio)*80.0 );
     color += third_octave*cos( newY * cos(time / third_frequency ) * third_ratio*80.0 ) + cos( newY * sin(time / third_frequency ) * (1.0 - third_ratio)*80.0 );
     color += gridY*(tan( newX * sin(time / 10.0 ) * gridY_density*80.0 ) + cos( newY * sin( time / 10.0 ) * gridY_density*80.0 ));
     color += gridX*(tan( newY * sin(time / 10.0 ) * gridX_density*80.0 ) + cos( newX * sin( time / 10.0 ) * gridX_density*80.0 ));    
    
     color *= cos(time / 10.0 ) * 0.5;

     gl_FragColor = vec4( vec3( color, color * 0.5, sin( color + time / 3.0 ) * 0.75 ), 1.0 );
}

)";