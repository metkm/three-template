<script setup lang="ts">
import { EffectComposer } from 'three/examples/jsm/postprocessing/EffectComposer.js'
import { ShaderPass } from 'three/examples/jsm/Addons.js'
import { OutputPass } from 'three/examples/jsm/postprocessing/OutputPass.js'
import { RenderPass } from 'three/examples/jsm/postprocessing/RenderPass.js'
import { extend } from '@tresjs/core'

const images = [
  'https://pbs.twimg.com/media/GUrlgwhXsAASMRE?format=jpg&name=large',
  'https://i.scdn.co/image/ab67616d0000b273cda1dde174c38419df93c736',
  'https://i.scdn.co/image/ab67616d0000b273eda9478c39a21e1cdc6609ca',
  'https://i.scdn.co/image/ab67616d0000b273e11fcf0840bb6aa727885229',
  'https://i.scdn.co/image/ab67616d0000b2734422fc7526ad76759b68a09e',
  'https://i.scdn.co/image/ab67616d0000b273e286af15269abbaad30e9389',
  'https://i.scdn.co/image/ab67616d0000b27312e2be753f627bde4afdb2aa',
  'https://i.scdn.co/image/ab67616d0000b273541a0129b72e8cbac8fa095f',
  'https://i.scdn.co/image/ab67616d0000b273f1bfecc0689aa2d4eaca64d6',
  'https://i.scdn.co/image/ab67616d0000b273144a03b07d6f561d4546a3f8',
  'https://i.scdn.co/image/ab67616d0000b2737be2416414e6ed67de980b41',
  'https://i.scdn.co/image/ab67616d0000b2736dfbd2654e5c961d1126ad9c',
  'https://i.scdn.co/image/ab67616d0000b273de3c04b5fc750b68899b20a9',
  'https://i.scdn.co/image/ab67616d0000b27333c1b4c4aa4f6d7fbb1a8bc1',
]

extend({ EffectComposer, OutputPass, RenderPass, ShaderPass })
</script>

<template>
  <div class="w-full h-full">
    <div class="crt" />

    <TresCanvas
      class="w-full h-full"
      alpha
    >
      <TresPerspectiveCamera
        :position="[6 * 5, 6 * 3, 20]"
      />

      <Suspense>
        <TheFisheye :urls="images" />
      </Suspense>

      <TheFisheyeEffect />
      <!-- <TheOrbitControls /> -->
    </TresCanvas>
  </div>
</template>

<style>
.crt::before {
  display: block;
  content: "";
  position: absolute;
  inset: 0;
  background: radial-gradient(circle, transparent, black 90%);
  z-index: 2;
}

.crt {
  position: absolute;
  top: 0;
  left: 0;
  bottom: 0;
  right: 0;
  z-index: 1;
  background:
    linear-gradient(rgba(18, 16, 16, 0) 50%, rgba(0, 0, 0, 0.25) 50%),
    linear-gradient(
      90deg,
      rgba(255, 0, 0, 0.06),
      rgba(0, 255, 0, 0.02),
      rgba(0, 0, 255, 0.06)
    );
  background-size: 100% 8px, 12px 100%;
}
</style>
