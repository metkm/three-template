<script setup lang="ts">
import type { Group } from 'three'
import { Box3, Vector3 } from 'three'

const props = defineProps<{
  urls: string[]
}>()

const { onBeforeRender } = useLoop()
const { camera } = useTresContext()

const groupRefs = shallowRef<Group[]>([])
const groupRenderCount = ref(1)

const urls = fillArray(props.urls, 60)

onBeforeRender(() => {
  if (!camera.value) return
  camera.value.position.x += 0.01

  const lastGroup = groupRefs.value[groupRefs.value.length - 1]
  if (!lastGroup) return

  const box = new Box3().setFromObject(lastGroup)

  const size = new Vector3()
  box.getSize(size)

  const groupEndPoint = size.x + lastGroup.position.x - size.x / 2
  if (camera.value.position.x > groupEndPoint - (size.x / 2)) {
    groupRenderCount.value += 1
  }
})
</script>

<template>
  <template
    v-for="i in groupRenderCount"
    :key="i"
  >
    <TresGroup
      ref="groupRefs"
      :position="[(i - 1) * (10 * 6), 0, 0]"
    >
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
    </TresGroup>
  </template>
</template>
