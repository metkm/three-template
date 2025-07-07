<script setup lang="ts">
const width = window.innerWidth
const height = window.innerHeight
</script>

<template>
  <div class="w-full h-full">
    <TresCanvas
      class="w-full h-full"
      alpha
    >
      <TresOrthographicCamera
        :args="[width / -2, width / 2, height / 2, height / -2, 1, 1000]"
        :position="[0, 0, 1]"
      />

      <ThePerlinNoise />
    </TresCanvas>
  </div>
</template>
