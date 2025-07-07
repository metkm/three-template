<template>
  <div class="max-h-screen max-w-screen h-screen w-screen overflow-hidden">
    <TheNavigation class="fixed bottom-4 left-4 right-4 z-50" />

    <main class="bg-(--ui-bg) h-full w-full">
      <Suspense>
        <slot />
      </Suspense>
    </main>
  </div>
</template>
