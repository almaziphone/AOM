<script setup lang="ts">
import SectionHeading from '@/components/ui/SectionHeading.vue'
import { about } from '@/data/siteContent'
</script>

<template>
  <section id="about" class="section-y bg-white">
    <div class="container-page">
      <SectionHeading :title="about.title" />

      <div class="grid gap-8 lg:grid-cols-2 lg:gap-12">
        <div class="space-y-5 text-base leading-relaxed text-slate-600">
          <p v-for="(p, i) in about.paragraphs" :key="i">
            {{ p }}
          </p>
        </div>

        <ul class="space-y-4">
          <li
            v-for="(h, i) in about.highlights"
            :key="i"
            class="card-elevated rounded-xl border border-slate-100 p-6"
          >
            <p class="text-sm font-semibold uppercase tracking-wide text-navy-600">
              {{ h.label }}
            </p>
            <p class="mt-2 text-base leading-relaxed text-slate-700">
              {{ h.text }}
            </p>
          </li>
        </ul>
      </div>
    </div>
  </section>
</template>
