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
          <p v-if="item.link" class="mt-4">
            <a
              :href="item.link"
              class="font-medium text-navy-800 underline decoration-navy-300 underline-offset-4 transition hover:text-navy-950 hover:decoration-navy-600"
              target="_blank"
              rel="noopener noreferrer"
            >
              {{ item.linkLabel ?? 'Источник' }}
            </a>
          </p>
        </article>
      </div>
    </div>
  </section>
</template>
