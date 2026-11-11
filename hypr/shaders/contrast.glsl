precision mediump float;

varying vec2 v_texcoord;
uniform sampler2D tex;

const float contrast = 1.15;
const float brightness = -0.02;
const float gamma = 0.95;
const float sharpen_strength = 0.20;

void main() {
    vec2 texel = vec2(1.0) / vec2(textureSize(tex, 0));
    vec3 col = texture(tex, v_texcoord).rgb;

    col = (col - 0.5) * contrast + 0.5 + brightness;
    col = pow(col, vec3(gamma));

    vec3 blur = (
        texture(tex, v_texcoord + vec2(texel.x, 0.0)).rgb +
        texture(tex, v_texcoord - vec2(texel.x, 0.0)).rgb +
        texture(tex, v_texcoord + vec2(0.0, texel.y)).rgb +
        texture(tex, v_texcoord - vec2(0.0, texel.y)).rgb
    ) * 0.25;

    col = mix(col, col + (col - blur), sharpen_strength);

    gl_FragColor = vec4(col, 1.0);
}
