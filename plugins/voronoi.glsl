char fragmentShaderCode[] = R"(

#version 120

uniform float iResolutionX, iResolutionY;
uniform float time;
uniform float scale;
uniform float mode;

float hash1( float q ) { return fract(sin(q)*43758.5453); }
vec2  hash2( vec2  p ) { p = vec2( dot(p,vec2(127.1,311.7)), dot(p,vec2(269.5,183.3)) ); return fract(sin(p)*43758.5453); }

vec4 voronoi(vec2 x, float mode )
{
    vec2 zn = floor( x );
    vec2 f = fract( x );

	vec3 m = vec3( 8.0 );
	float m2 = 8.0;
    for( int j=-2; j<=2; j++ ) {
    for( int i=-2; i<=2; i++ )
    {
        vec2 g = vec2( float(i),float(j) );
        vec2 o = hash2( zn + g );

		// animate
        o = 0.5 + 0.5*sin(time + 6.2831*o );

		vec2 r = g - f + o;

        // euclidean		
		vec2 d0 = vec2( sqrt(dot(r,r)), 1.0 );
        // manhattam		
		vec2 d1 = vec2( 0.71*(abs(r.x) + abs(r.y)), 1.0 );
        // triangular		
		vec2 d2 = vec2( max(abs(r.x)*0.866025+r.y*0.5,-r.y), 
				        step(0.0,0.5*abs(r.x)+0.866025*r.y)*(1.0+step(0.0,r.x)) );

		vec2 d = d0; 
		if( mode<3.0 ) d=mix( d2, d0, fract(mode) );
		if( mode<2.0 ) d=mix( d1, d2, fract(mode) );
		if( mode<1.0 ) d=mix( d0, d1, fract(mode) );
		
        if( d.x<m.x )
        {
			m2 = m.x;
            m.x = d.x;
            m.y = hash1( dot( floor(x) + vec2(float(i), float(j)),vec2(7.0,113.0) ) );
			m.z = d.y;
        }
		else if( d.x<m2 )
		{
			m2 = d.x;
		}

    }
    }
    return vec4( m, m2-m.x );
}

void main( void )
{	
    vec2 resolution = vec2(iResolutionX, iResolutionY);
    vec2 position = gl_FragCoord.xy/resolution.xy;
    vec4 c = voronoi( scale*position, mode );

    vec3 col = 0.5 + 0.5*sin( c.y*2.5 + vec3(1.0,1.0,1.9) );
    col *= sqrt( clamp( 1.0 - c.x, 0.0, 1.0 ) );
	col *= clamp( 0.5 + (1.0-c.z/2.0)*0.5, 0.0, 1.0 );
	col *= 0.4 + 0.6*sqrt(clamp( 4.0*c.w, 0.0, 1.0 ));
	
	
    gl_FragColor = vec4( col, 1.0 );
}

)";