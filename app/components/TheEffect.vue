<script setup lang="ts">
const pointCount = 30
const pointPositionArray = new Float32Array(pointCount * 3)

for (let index = 0; index < pointCount; index++) {
  pointPositionArray[index * 3 + 0] = Math.random() * 4
  pointPositionArray[index * 3 + 1] = Math.random() * 4
  pointPositionArray[index * 3 + 2] = Math.random() * 4
}
</script>

<template>
  <TresPoints>
    <TresBufferGeometry :position="[pointPositionArray, 3]" />
    <TresPointsMaterial />
  </TresPoints>
</template>
