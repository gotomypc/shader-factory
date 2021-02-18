#iChannel0 "file://assets/horizon.jpg"
#iChannel1 "file://common/uv-warp.glsl"

#iChannel1::MinFilter "Nearest"
#iChannel1::MagFilter "Nearest"

void main() {
    vec2 uv = gl_FragCoord.xy / iResolution.xy;
    
    vec2 uvWarped = texture2D(iChannel1, uv).rg;
    vec3 pattern = texture2D(iChannel0, uvWarped).rgb;

    gl_FragColor = vec4(pattern, 1.0);
}
