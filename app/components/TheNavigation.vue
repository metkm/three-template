<script setup lang="ts">
const pages = [['i-lucide-home', '/'], ['i-tabler-cube', 'cube-noise'], ['i-gravity-ui-dots-9', 'perlin-noise'], ['i-lucide-eye', 'fisheye']]
</script>

<template>
  <div class="flex justify-center">
    <ol class="flex items-center gap-2 bg-(--ui-bg) border border-(--ui-border) p-2 rounded-full">
      <li
        v-for="[icon, page] in pages"
        :key="page"
      >
        <UButton
          :to="page"
          color="neutral"
          variant="soft"
          :icon="icon"
        >
          {{ page }}
        </UButton>
      </li>
    </ol>
  </div>
</template>
