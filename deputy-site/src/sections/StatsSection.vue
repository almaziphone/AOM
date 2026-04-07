<script setup lang="ts">
import SectionHeading from '@/components/ui/SectionHeading.vue'
import { stats } from '@/data/siteContent'
</script>

<template>
  <section id="stats" class="section-y bg-slate-50">
    <div class="container-page">
      <SectionHeading title="Ключевые итоги года в цифрах" subtitle="Результаты" />

      <div class="grid gap-5 sm:grid-cols-2 lg:grid-cols-4">
        <article
          v-for="(s, i) in stats"
          :key="i"
          class="card-elevated flex flex-col rounded-2xl p-8"
        >
          <p class="text-4xl font-bold tabular-nums tracking-tight text-navy-900 md:text-5xl">
            {{ s.value }}
          </p>
          <p class="mt-3 text-base font-semibold text-navy-800">
            {{ s.label }}
          </p>
          <p class="mt-2 text-sm leading-relaxed text-slate-500">
            {{ s.note }}
          </p>
        </article>
      </div>
    </div>
  </section>
</template>
