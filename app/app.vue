<template>
  <TresCanvas
    window-size
    clear-color="black"
  >
    <TresPerspectiveCamera
      :position="[10, 10, 10]"
      :look-at="[0, 0, 0]"
    />

    <TresAxesHelper />

    <TheOrbitControls />
    <TheEffect />
  </TresCanvas>
</template>

<style>
@import "tailwindcss";
@import "@nuxt/ui";
</style>
