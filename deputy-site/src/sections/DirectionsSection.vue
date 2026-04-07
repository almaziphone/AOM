<script setup lang="ts">
import SectionHeading from '@/components/ui/SectionHeading.vue'
import { directions } from '@/data/siteContent'

/** Простые монохромные иконки 24×24, stroke */
const icons: Record<string, string> = {
  law: 'M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z',
  transport:
    'M9 17a2 2 0 11-4 0 2 2 0 014 0zM19 17a2 2 0 11-4 0 2 2 0 014 0zM13 16V6a1 1 0 00-1-1H4v11h9m4 0h2a1 1 0 001-1v-3h-5',
  people:
    'M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0z',
  target:
    'M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z',
  heart: 'M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z',
  shield:
    'M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z',
}
</script>

<template>
  <section id="directions" class="section-y bg-white">
    <div class="container-page">
      <SectionHeading title="Основные направления работы" />

      <div class="grid gap-6 md:grid-cols-2 lg:grid-cols-3">
        <article
          v-for="(d, i) in directions"
          :key="i"
          class="card-elevated group flex flex-col rounded-2xl p-8"
        >
          <div
            class="mb-5 inline-flex h-12 w-12 items-center justify-center rounded-xl bg-navy-50 text-navy-700 transition group-hover:bg-navy-100"
          >
            <svg
              class="h-7 w-7"
              fill="none"
              viewBox="0 0 24 24"
              stroke="currentColor"
              stroke-width="1.75"
              aria-hidden="true"
            >
              <path stroke-linecap="round" stroke-linejoin="round" :d="icons[d.icon] || icons.law" />
            </svg>
          </div>
          <h3 class="text-lg font-bold text-navy-950">
            {{ d.title }}
          </h3>
          <p class="mt-3 flex-1 text-sm leading-relaxed text-slate-600">
            {{ d.text }}
          </p>
        </article>
      </div>
    </div>
  </section>
</template>
