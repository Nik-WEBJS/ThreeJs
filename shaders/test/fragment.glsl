varying vec2 vUv;

float random (vec2 st) {
    return fract(sin(dot(st.xy,
                         vec2(12.9898,78.233)))*
        43758.5453123);
}

void main()
{
    // float strength = vUv.x;
    // float strength = 1.0 - vUv.y;
    // float strength = vUv.y * 10.0;
    // float strength = mod(vUv.y * 10.0, 1.0);
    // float strength = mod(vUv.y * 10.0, 1.0);
    // strength = step(0.5, strength);

    // float strength =  step(0.8, mod(vUv.x * 10.0, 1.0));
    // strength += step(0.8, mod(vUv.y * 10.0, 1.0));

    // float strength =  step(0.8, mod(vUv.x * 10.0, 1.0));
    // strength *= step(0.8, mod(vUv.y * 10.0, 1.0));
    
    // float barX =  step(0.4, mod(vUv.x * 10.0, 1.0));
    // barX *= step(0.8, mod(vUv.y * 10.0, 1.0));
    // float barY =  step(0.8, mod(vUv.x * 10.0, 1.0));
    // barY *= step(0.4, mod(vUv.y * 10.0, 1.0));
    // float strength = barX + barY;

    // float barX =  step(0.4, mod(vUv.x * 10.0 , 1.0));
    // barX *= step(0.8, mod(vUv.y * 10.0 + 0.2 , 1.0));
    // float barY =  step(0.8, mod(vUv.x * 10.0 + 0.2, 1.0));
    // barY *= step(0.4, mod(vUv.y * 10.0, 1.0));

    // float strength = barX + barY;

    // float strength = abs(vUv.x - 0.5);

    // float strength = min(abs(vUv.y - 0.5), abs(vUv.x - 0.5));

    // float strength = max(abs(vUv.y - 0.5), abs(vUv.x - 0.5));

    // float strength = step(0.2, max(abs(vUv.y - 0.5), abs(vUv.x - 0.5)));

    // float strength1 = step(0.2, max(abs(vUv.y - 0.5), abs(vUv.x - 0.5)));
    // float strength2 = 1.0 - step(0.25, max(abs(vUv.y - 0.5), abs(vUv.x - 0.5)));
    // float strength =strength1 * strength2;

    // float strength = floor(vUv.x * 10.0) / 10.0;

    // float strength = floor(vUv.x * 10.0) / 10.0;
    // strength *= floor(vUv.y * 10.0) / 10.0;
    
    // float strength = random(vUv);

    // vec2 gridUv = vec2(
    //     floor(vUv.x * 10.0) / 10.0,
    //     floor(vUv.y * 10.0) / 10.0
    // );
    // float strength = random(gridUv);
    
    //  vec2 gridUv = vec2(
    //     floor(vUv.x * 10.0) / 10.0,
    //     floor(vUv.y * 10.0 + vUv.x * 5.0 ) / 10.0 
    // );
    // float strength = random(gridUv);

    // float strength = length(vUv);

    // float strength = length(vUv - 0.5);
    // float strength = distance(vUv, vec2(0.5));

    // float strength = 1.0 - distance(vUv, vec2(0.5));

    // float strength = 0.015 / distance(vUv, vec2(0.5));

    // vec2 lightUv = vec2(vUv.x * 0.1 + 0.45, vUv.y * 0.5 + 0.25);
    // float strength = 0.015 / distance(lightUv, vec2(0.5));

    // vec2 lightUvX = vec2(vUv.x * 0.1 + 0.45, vUv.y * 0.5 + 0.25);
    // float lightX = 0.015 / distance(lightUvX, vec2(0.5));
    // vec2 lightUvY = vec2(vUv.y * 0.1 + 0.45, vUv.x * 0.5 + 0.25);
    // float lightY = 0.015 / distance(lightUvY, vec2(0.5));
    // float strength = lightX * lightY;

    vec2 lightUvX = vec2(vUv.x * 0.1 + 0.45, vUv.y * 0.5 + 0.25);
    float lightX = 0.015 / distance(lightUvX, vec2(0.5));
    vec2 lightUvY = vec2(vUv.y * 0.1 + 0.45, vUv.x * 0.5 + 0.25);
    float lightY = 0.015 / distance(lightUvY, vec2(0.5));
    float strength = lightX * lightY;

    gl_FragColor = vec4(vec3(strength), 1.0);
}