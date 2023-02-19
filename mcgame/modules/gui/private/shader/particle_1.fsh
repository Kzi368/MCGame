#version 150

#moj_import <fog.glsl>
#moj_import <emissive_utils.glsl>

uniform sampler2D Sampler0;

uniform vec4 ColorModulator;
uniform float FogStart;
uniform float FogEnd;
uniform vec4 FogColor;

in float vertexDistance;
in vec2 texCoord0;
in vec4 vertexColor;
in vec4 lightColor;
in vec4 maxLightColor;
flat in float isMarker;
flat in vec4 tint;

out vec4 fragColor;

void main() {
    if (isMarker == 1.0) {
        fragColor = vec4(254./255., tint.gb, 1);
        ivec2 iCoord = ivec2(gl_FragCoord.xy);
        if (
            (((iCoord.x + iCoord.y) & 1) == 1)
