<script setup lang="ts">
import vertexShader from '~/shader/vertex.glsl?raw'
import fragmentShader from '~/shader/fragment.glsl?raw'
import { Vector2 } from 'three'

const { onLoop } = useRenderLoop()

const size = 30

const positionData = new Float32Array(size * size * size * 4)
const uvData = new Float32Array(size * size * size * 3)

for (let x = 0; x < size; x++) {
  for (let y = 0; y < size; y++) {
    for (let z = 0; z < size; z++) {
      const index = (x * size * size) + (y * size) + z

      positionData[index * 4 + 0] = x / size * 10.0
      positionData[index * 4 + 1] = y / size * 10.0
      positionData[index * 4 + 2] = z / size * 10.0
      positionData[index * 4 + 3] = 1.0

      uvData[index * 2 + 0] = x / size
      uvData[index * 2 + 1] = y / size
      uvData[index * 2 + 2] = z / size
    }
  }
}

const uniforms = {
  resolution: { value: new Vector2(window.innerWidth, window.innerHeight) },
  time: { value: 0 },
}

onLoop(({ elapsed }) => {
  uniforms.time.value = elapsed / 5
})
</script>

<template>
  <TresPoints>
    <TresBufferGeometry
      :position="[positionData, 4]"
      :uv="[uvData, 3]"
    />

    <TresShaderMaterial
      :vertex-shader="vertexShader"
      :fragment-shader="fragmentShader"
      :uniforms="uniforms"
    />
  </TresPoints>
</template>
