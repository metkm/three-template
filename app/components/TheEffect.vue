<script setup lang="ts">
import vertexShader from '~/shader/vertex.glsl?raw'
import fragmentShader from '~/shader/fragment.glsl?raw'
import { Vector2 } from 'three'

const { onLoop } = useRenderLoop()

const pointCount = 200
const pointPositionArray = new Float32Array(pointCount * 3)

for (let index = 0; index < pointCount; index++) {
  pointPositionArray[index * 3 + 0] = Math.random() * 1
  pointPositionArray[index * 3 + 1] = Math.random() * 1
  pointPositionArray[index * 3 + 2] = Math.random() * 1
}

const uniforms = {
  resolution: { value: new Vector2(window.innerWidth, window.innerHeight) },
  time: { value: 0 },
}

onLoop(({ elapsed }) => {
  uniforms.time.value = elapsed
})
</script>

<template>
  <TresPoints>
    <TresBufferGeometry :position="[pointPositionArray, 3]" />
    <TresShaderMaterial
      :vertex-shader="vertexShader"
      :fragment-shader="fragmentShader"
      :uniforms="uniforms"
    />
  </TresPoints>
</template>
