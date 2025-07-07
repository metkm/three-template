uniform vec2 resolution;
uniform float time;

vec2 quintic(vec2 p) {
  return p * p * p * (10.0 + p * (-15.0 + p * 6.0));
}

vec2 randomGradient(vec2 p) {
  p = p + 0.02;
  float x = dot(p, vec2(123.4, 234.5));
  float y = dot(p, vec2(234.5, 345.6));
  vec2 gradient = vec2(x, y);
  gradient = sin(gradient) * 43758.5453;
  // gradient = sin(gradient) * 43758.5453;

  gradient = sin(gradient + time);
  return gradient;
}

void main() {
  vec2 uv = gl_FragCoord.xy / resolution;
  uv.x *= resolution.x / resolution.y;

  vec3 color = vec3(0.0);

  uv *= 2.0;
  vec2 gridId = floor(uv);
  vec2 gridUv = fract(uv);
  color = vec3(gridId, 0.0);
  color = vec3(gridUv, 0.0);

  vec2 bl = gridId + vec2(0.0, 0.0);
  vec2 br = gridId + vec2(1.0, 0.0);
  vec2 tl = gridId + vec2(0.0, 1.0);
  vec2 tr = gridId + vec2(1.0, 1.0);

  vec2 gradBl = randomGradient(bl);
  vec2 gradBr = randomGradient(br);
  vec2 gradTl = randomGradient(tl);
  vec2 gradTr = randomGradient(tr);

  vec2 distFromPixelToBl = gridUv - vec2(0.0, 0.0);
  vec2 distFromPixelToBr = gridUv - vec2(1.0, 0.0);
  vec2 distFromPixelToTl = gridUv - vec2(0.0, 1.0);
  vec2 distFromPixelToTr = gridUv - vec2(1.0, 1.0);

  float dotBl = dot(gradBl, distFromPixelToBl);
  float dotBr = dot(gradBr, distFromPixelToBr);
  float dotTl = dot(gradTl, distFromPixelToTl);
  float dotTr = dot(gradTr, distFromPixelToTr);

  gridUv = quintic(gridUv);

  float b = mix(dotBl, dotBr, gridUv.x);
  float t = mix(dotTl, dotTr, gridUv.x);
  float perlin = mix(b, t, gridUv.y);

  float billow = abs(perlin);
  color = vec3(billow);

  // One line
  // color = smoothstep(0.001, 0.002, color);

  // Multiple lines
  // color = round(color / 0.10) * 0.10;

  // Multiple lines 2
  float st = round(billow / 0.08) * 0.08;
  float st_low = st - st;
  float st_high = st + st;
  float st_mid = (st_low + st_high) / 4.0; // or divide by 2
  color = vec3(step(billow, st_mid + 0.035));

  color = mix(vec3(0.35, 0.12, 0.71), vec3(0.0), color);
  gl_FragColor = vec4(color, 1.0);
}
