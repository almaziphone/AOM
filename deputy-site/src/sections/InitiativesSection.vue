<script setup lang="ts">
import SectionHeading from '@/components/ui/SectionHeading.vue'
import { initiatives } from '@/data/siteContent'
</script>

<template>
  <section id="initiatives" class="section-y bg-slate-50">
    <div class="container-page">
      <SectionHeading
        title="Законодательные инициативы и важные вопросы"
        subtitle="Приоритеты"
      />

      <div class="space-y-6">
        <article
          v-for="(item, i) in initiatives"
          :key="i"
          class="card-elevated rounded-2xl border border-slate-100 p-8 md:p-10"
        >
          <h3 class="text-xl font-bold text-navy-950 md:text-2xl">
            {{ item.title }}
          </h3>
          <p class="mt-4 text-base leading-relaxed text-slate-600">
            {{ item.text }}
          </p>
        </article>
      </div>
    </div>
  </section>
</template>
