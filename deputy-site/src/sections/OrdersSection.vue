<script setup lang="ts">
import SectionHeading from '@/components/ui/SectionHeading.vue'
import { orders } from '@/data/siteContent'
</script>

<template>
  <section id="orders" class="section-y bg-white">
    <div class="container-page">
      <SectionHeading :title="orders.title" subtitle="Наказы избирателей" />

      <p class="-mt-4 mb-10 max-w-3xl text-lg leading-relaxed text-slate-600">
        {{ orders.intro }}
      </p>

      <div class="grid gap-5 md:grid-cols-2">
        <article
          v-for="(ex, i) in orders.examples"
          :key="i"
          class="card-elevated rounded-xl p-6"
        >
          <p class="text-sm font-semibold text-navy-800">
            {{ ex.org }}
          </p>
          <p class="mt-2 text-2xl font-bold tabular-nums text-navy-950">
            {{ ex.amount }}
          </p>
          <p class="mt-2 text-sm leading-relaxed text-slate-600">
            {{ ex.for }}
          </p>
        </article>
      </div>
    </div>
  </section>
</template>
