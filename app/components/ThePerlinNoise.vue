<script setup lang="ts">
import vertexShader from '~/shader/perlin-noise/vertex.glsl?raw'
import fragmentShader from '~/shader/perlin-noise/fragment.glsl?raw'
import { Vector2 } from 'three'

const width = window.innerWidth
const height = window.innerHeight

const { onLoop } = useRenderLoop()

const uniforms = {
  resolution: { value: new Vector2(window.innerWidth, window.innerHeight) },
  time: { value: 0 },
}

onLoop(({ elapsed }) => {
  uniforms.time.value = elapsed
})
</script>

<template>
  <TresMesh>
    <TresPlaneGeometry :args="[width, height]" />
    <TresShaderMaterial
      :vertex-shader="vertexShader"
      :fragment-shader="fragmentShader"
      :uniforms="uniforms"
    />
  </TresMesh>
</template>
