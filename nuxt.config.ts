// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  modules: ['@nuxt/eslint', '@nuxt/ui', '@tresjs/nuxt'],
  ssr: false,
  devtools: { enabled: true },
  app: {
    head: {
      htmlAttrs: {
        lang: 'en',
        style: 'background-color: oklch(14.1% 0.005 285.823); color: var(--ui-color-neutral-700); min-height: 100vh; min-width: 100vw;',
      },
    },
    pageTransition: { name: 'page', mode: 'in-out' },
  },
  css: ['~/assets/main.css'],
  routeRules: {
    '/perlin-noise': { ssr: false },
    '/fisheye': { ssr: false },
  },
  future: {
    compatibilityVersion: 4,
  },
  compatibilityDate: '2025-05-15',
  eslint: {
    config: {
      stylistic: true,
    },
  },
})
