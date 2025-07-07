<template>
  <TresCanvas window-size>
    <TresPerspectiveCamera
      :position="[5, 5, 5]"
      :look-at="[0, 0, 0]"
    />

    <TresAxesHelper />
    <TheEffect />
  </TresCanvas>
</template>

<style>
@import "tailwindcss";
@import "@nuxt/ui";
</style>
