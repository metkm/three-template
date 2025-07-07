<script setup lang="ts">
import { SRGBColorSpace, Vector3 } from 'three'

const props = defineProps<{
  url?: string
  index: number
  rowLimit: number
}>()

const texture = await useTexture({
  map: props.url,
})

texture.map.colorSpace = SRGBColorSpace

const offsetX = (props.index % props.rowLimit) * 6
const offsetY = Math.floor(props.index / props.rowLimit) * 6
</script>

<template>
  <TresMesh :position="new Vector3(offsetX, offsetY, 0.0)">
    <TresBoxGeometry :args="[6, 6, 0]" />
    <TresMeshBasicMaterial :map="texture.map" />
  </TresMesh>
</template>
