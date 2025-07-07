<template>
  <TresCanvas
    window-size
    clear-color="black"
  >
    <TresPerspectiveCamera
      :position="[16, 16, 16]"
      :look-at="[0, 0, 0]"
    />

    <TresAxesHelper />
    <TheOrbitControls />

    <TheCubeNoise />
  </TresCanvas>
</template>
