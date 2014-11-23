char fragmentShaderCode[] = R"(

float r3 = sqrt(3.0);

uniform float iResolutionX;
uniform float iResolutionY;
uniform float time;
uniform float scale;
uniform float linewidth;
uniform float speed;
uniform float overlap;
uniform float saturation;

uniform float even;
uniform float odd;
uniform float evenSpacing;
uniform float oddSpacing;

vec3 hsv(float h,float s,float v) {
     return mix(vec3(1.),clamp((abs(fract(h+vec3(3.,2.,1.)/3.)*6.-3.)-1.),0.,1.),s)*v;
}

float circle(vec2 p, float r) {
      return smoothstep(linewidth, 0.0, abs(length(p)-r)); // try changing the 0.1 to 0.3
}

void main(void) {
     vec2 resolution = vec2(iResolutionX, iResolutionY);
     vec2 uv = -1.0 + 2.0*gl_FragCoord.xy / resolution.xy;
     uv.x *= resolution.x/resolution.y;
     uv *= scale;
     float r = smoothstep(-0.7, 0.7, sin(speed*time*1.57-length(uv)*0.1)) + overlap;
     vec2 rep = vec2(4.0,r3*4.0);
     vec2 p1 = mod(uv, rep)-rep*0.5;
     vec2 p2 = mod(uv+vec2(2.0,0.0), rep)-rep*0.5;
     vec2 p3 = mod(uv+vec2(1.0,r3), rep)-rep*0.5;
     vec2 p4 = mod(uv+vec2(3.0,r3), rep)-rep*0.5;
     vec2 p5 = mod(uv+vec2(0.0,r3*2.0), rep)-rep*0.5;
     vec2 p6 = mod(uv+vec2(2.0,r3*2.0), rep)-rep*0.5;
     vec2 p7 = mod(uv+vec2(1.0,r3*3.0), rep)-rep*0.5;
     vec2 p8 = mod(uv+vec2(3.0,r3*3.0), rep)-rep*0.5;
     
     float c = 0.0;
     c += even*circle(evenSpacing*p1, r);
     c += even*circle(evenSpacing*p2, r);
     c += odd*circle(oddSpacing*p3, r);
     c += odd*circle(oddSpacing*p4, r);
     c += even*circle(evenSpacing*p5, r);
     c += even*circle(evenSpacing*p6, r);
     c += odd*circle(oddSpacing*p7, r);
     c += odd*circle(oddSpacing*p8 , r);
     gl_FragColor = vec4(hsv(r+0.7, saturation, c), 1.0);
}

)";