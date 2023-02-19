const float maxGreen = 253.0;

void main() {
    tint = Color;
    if (abs(Color.r * 255. - 254.) < .5 && Color.g * 255. > minGreen - .5 && Color.g * 255. < maxGreen + .5) {
        // When marker color
        isMarker = 1.0;
        vec2 screenPos = 0.125 * corners[gl_VertexID % 4] - 1.0;
        gl_Position = vec4(screenPos, 0.0, 1.0);
        vertexDistance = 0.0;
        texCoord0 = vec2(0);
        vertexColor = vec4(0);
    } else {
        isMarker = 0.0;
        // Vanilla code + emissive stuff
        gl_Position = ProjMat * ModelViewMat * vec4(Position, 1.0);

        vertexDistance = fog_distance(ModelViewMat, Position, FogShape);
        texCoord0 = UV0;
        vertexColor = Color;
        lightColor = minecraft_sample_lightmap(Sampler2, UV2);
        maxLightColor = minecraft_sample_lightmap(Sampler2, ivec2(240.0, 240.0));
    }
}
