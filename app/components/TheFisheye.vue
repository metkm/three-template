<script setup lang="ts">
import { BoxGeometry, Group, Mesh, MeshBasicMaterial, SRGBColorSpace, TextureLoader } from 'three'

const props = defineProps<{
  urls: string[]
}>()

const { onBeforeRender } = useLoop()
const { camera } = useTresContext()

const urls = fillArray(props.urls, 60)

// const textureLoader = new TextureLoader()

// const createGroupBuffer = async () => {
//   const groups = [new Group()]

//   const filledArray = fillArray(props.urls, 60)
//   const cubes = await Promise.all(filledArray.map(async (url) => {
//     const geometry = new BoxGeometry(IMAGE_WIDTH, IMAGE_HEIGHT, 0)
//     const material = new MeshBasicMaterial()
//     const songCover = new Mesh(geometry, material)

//     const texture = await textureLoader.loadAsync(url)

//     texture.needsUpdate = true
//     texture.matrixAutoUpdate = false
//     texture.colorSpace = SRGBColorSpace

//     const imageAspect = texture.image.width / texture.image.height
//     const aspect = IMAGE_WIDTH / IMAGE_HEIGHT

//     if (aspect < imageAspect) {
//       texture.matrix.setUvTransform(0, 0, aspect / imageAspect, 1, 0, 0.5, 0.5)
//     }
//     else {
//       texture.matrix.setUvTransform(0, 0, 1, imageAspect / aspect, 0, 0.5, 0.5)
//     }

//     songCover.material.map = texture

//     return songCover
//   }))

//   const offsetInitial = -((MAX_PER_LINE / 2) * IMAGE_WIDTH) + IMAGE_WIDTH / 2
//   const lineCount = Math.ceil(props.urls.length / MAX_PER_LINE)

//   let offsetx = offsetInitial
//   let offsety = (lineCount * IMAGE_HEIGHT) / 2 - IMAGE_HEIGHT / 2

//   const group = groups.at(0)
//   for (let index = 0; index < cubes.length; index++) {
//     const cube = cubes[index]
//     if (!cube) continue

//     group!.add(cube)

//     cube.position.x = offsetx
//     cube.position.y = offsety

//     offsetx += IMAGE_WIDTH

//     if (index > 0 && (index + 1) % MAX_PER_LINE === 0) {
//       offsety -= IMAGE_HEIGHT
//       offsetx = offsetInitial
//     }
//   }

//   return groups
// }

// const groups = await createGroupBuffer()

onBeforeRender(() => {
  if (!camera.value) return
  camera.value.position.x += 0.01
})
</script>

<template>
  <template
    v-for="(url, index) in urls"
    :key="url"
  >
    <Suspense>
      <TheFisheyeCover
        :url="url"
        :row-limit="10"
        :index="index"
      />
    </Suspense>
  </template>

  <TheOrbitControls />

  <!-- <TresMesh
    v-for="url in urls"
    :key="url"
  >
    <TresBoxGeometry />
    <TresMeshBasicMaterial />
  </TresMesh> -->

  <!-- <primitive
    v-for="(object, index) in groups[0]"
    :key="index"
    :object="object"
  /> -->
</template>
