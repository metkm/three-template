// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  modules: ['@nuxt/eslint', '@nuxt/ui', '@tresjs/nuxt'],
  devtools: { enabled: true },
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
