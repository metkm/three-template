<template>
  <div class="w-full h-full">
    <TresCanvas
      class="w-full h-full"
      alpha
    >
      <TresPerspectiveCamera
        :position="[16, 16, 16]"
        :look-at="[0, 0, 0]"
      />

      <TresAxesHelper />
      <TheOrbitControls />

      <TheCubeNoise />
    </TresCanvas>
  </div>
</template>
