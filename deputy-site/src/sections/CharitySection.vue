<script setup lang="ts">
import SectionHeading from '@/components/ui/SectionHeading.vue'
import { charityCategories } from '@/data/siteContent'
</script>

<template>
  <section id="charity" class="section-y bg-white">
    <div class="container-page">
      <SectionHeading title="Благотворительность и адресная помощь" subtitle="2025 год" />

      <p class="-mt-4 mb-10 max-w-3xl text-base leading-relaxed text-slate-600">
        Поддержка оказывалась за счёт личных средств депутата, спонсорских взносов и целевых пожертвований — по
        направлениям от участников СВО и ветеранов до образования, спорта и противопожарной защиты территорий.
      </p>

      <div class="grid gap-6 md:grid-cols-2">
        <article
          v-for="(cat, i) in charityCategories"
          :key="i"
          class="card-elevated rounded-2xl p-8"
        >
          <h3 class="text-lg font-bold text-navy-950">
            {{ cat.title }}
          </h3>
          <ul class="mt-4 list-inside list-disc space-y-2 text-sm leading-relaxed text-slate-600 marker:text-navy-400">
            <li v-for="(line, j) in cat.items" :key="j">
              {{ line }}
            </li>
          </ul>
        </article>
      </div>
    </div>
  </section>
</template>
