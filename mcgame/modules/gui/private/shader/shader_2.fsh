uniform vec2 OutSize;

in vec2 texCoord;
in vec2 oneTexel;

out vec4 fragColor;


void main() {
    vec4 prev_color = texture(DiffuseSampler, texCoord);
    vec4 overlay;
    float time = texelFetch(ControlSampler, ivec2(0, 0), 0).r / 255. + texelFetch(ControlSampler, ivec2(0, 0), 0).g + texelFetch(ControlSampler, ivec2(0, 0), 0).b * 255;
    vec4 control_color;
    float score;
	fragColor = prev_color;

