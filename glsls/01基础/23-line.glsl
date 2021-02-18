#ifdef GL_ES
precision mediump float;
#endif

void main() {
	vec2 r = vec2( gl_FragCoord.xy / iResolution.xy );
	// shorter version of the same coordinate transformation.
	// For example "aVector.xy" is a new vec2 made of the first two 
	// components of "aVector".
	// And, when division operator is applied between vectors,
	// each component of the first vector is divided by the corresponding
	// component of the second vector.
	// So, first line of this tutorial is the same as the first line
	// of the previous tutorial.
	
	vec3 backgroundColor = vec3(1.0);
	vec3 color1 = vec3(0.216, 0.471, 0.698);
	vec3 color2 = vec3(1.00, 0.329, 0.298);
	vec3 color3 = vec3(0.867, 0.910, 0.247);

	// start by setting the background color. If pixel's value
	// is not overwritten later, this color will be displayed.
	vec3 pixel = backgroundColor;
	
	// if the current pixel's x coordinate is between these values,
	// then put color 1.
	// The difference between 0.55 and 0.54 determines
	// the with of the line.
	float leftCoord = 0.54;
	float rightCoord = 0.55;
	if( r.x < rightCoord && r.x > leftCoord ) pixel = color1;
	
	// a different way of expressing a vertical line
    // in terms of its x-coordinate and its thickness:
	float lineCoordinate = 0.4;
	float lineThickness = 0.003;
	if(abs(r.x - lineCoordinate) < lineThickness) pixel = color2;
	
	// a horizontal line
	if(abs(r.y - 0.6)<0.01) pixel = color3;
	
	// see how the third line goes over the first two lines.
	// because it is the last one that sets the value of the "pixel".

	gl_FragColor = vec4(pixel, 1.0);  
}
