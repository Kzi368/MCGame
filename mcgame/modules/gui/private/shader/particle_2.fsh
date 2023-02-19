        )
            discard;
    } else {
        // Vanilla calculation + emissive stuff
        vec4 color = texture(Sampler0, texCoord0) * vertexColor * ColorModulator;
        float alpha = textureLod(Sampler0, texCoord0, 0.0).a * 255.0;
        color = make_emissive(color, lightColor, maxLightColor, vertexDistance, alpha);
        color.a = remap_alpha(alpha) / 255.0;
        if (color.a < 0.1) {
            discard;
        }
        fragColor = linear_fog(color, vertexDistance, FogStart, FogEnd, FogColor);
    }
}
