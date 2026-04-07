<script setup lang="ts">
import { footer, hero } from '@/data/siteContent'
</script>

<template>
  <footer class="border-t border-slate-200 bg-slate-50 py-12">
    <div class="container-page">
      <div class="flex flex-col gap-6 md:flex-row md:items-center md:justify-between">
        <div>
          <p class="font-semibold text-navy-950">{{ hero.name }}</p>
          <p class="mt-1 text-sm text-slate-600">{{ hero.role }}</p>
        </div>
        <p class="max-w-xl text-sm leading-relaxed text-slate-500">
          {{ footer.line }}
        </p>
      </div>
      <p class="mt-8 text-center text-xs text-slate-400 md:text-left">
        © {{ footer.year }} {{ hero.name }}. Все права защищены.
      </p>
    </div>
  </footer>
</template>
