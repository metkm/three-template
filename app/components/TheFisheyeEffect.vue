<script setup lang="ts">
import type { EffectComposer, ShaderPass } from 'three/examples/jsm/Addons.js'
import type { PerspectiveCamera } from 'three'
import { MathUtils } from 'three'

import vertexShader from '~/shader/fisheye/vertex.glsl?raw'
import fragmentShader from '~/shader/fisheye/fragment.glsl?raw'

const { renderer, scene, camera, sizes } = useTres()
const composer = shallowRef<EffectComposer>()

useLoop().render(() => {
  if (composer.value) {
    composer.value!.render()
  }
})

const shaderDefinition = {
  uniforms: {
    tDiffuse: { type: 't', value: null },
    strength: { type: 'f', value: 1 },
    height: { type: 'f', value: 1 },
    aspectRatio: { type: 'f', value: 140 },
    cylindricalRatio: { type: 'f', value: 2 },
  },
  vertexShader,
  fragmentShader,
}

const pixelRatio = window.devicePixelRatio
</script>

<template>
  <TresEffectComposer
    ref="composer"
    :args="[renderer]"
    :set-size="[sizes.width.value, sizes.height.value]"
    :set-pixel-ratio="[pixelRatio]"
  >
    <TresRenderPass
      :args="[scene, camera]"
      attach="passes-0"
    />

    <TresShaderPass
      :ref="(shaderPass: ShaderPass) => {
        shaderPass.renderToScreen = true

        if (camera) {
          const cam = camera as PerspectiveCamera
          const height = Math.tan(MathUtils.degToRad(140) / 2) / cam.aspect;

          shaderPass.uniforms['aspectRatio']!.value = cam.aspect;
          shaderPass.uniforms['height']!.value = height;
        }
      }"
      :args="[shaderDefinition]"
      attach="passes-1"
    />
  </TresEffectComposer>
</template>
