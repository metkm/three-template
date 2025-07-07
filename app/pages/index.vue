<script setup lang="ts">
const pages = ['cube-noise', 'perlin-noise', 'fisheye']
</script>

<template>
  <main class="flex items-center justify-center min-h-screen">
    <ol class="flex items-center gap-4">
      <li
        v-for="page in pages"
        :key="page"
      >
        <UButton :to="page">
          {{ page }}
        </UButton>
      </li>
    </ol>
  </main>
</template>
