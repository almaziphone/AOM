<script setup lang="ts">
import SectionHeading from '@/components/ui/SectionHeading.vue'
import { media } from '@/data/siteContent'
</script>

<template>
  <section id="media" class="section-y bg-slate-50">
    <div class="container-page">
      <SectionHeading :title="media.title" />

      <p class="-mt-4 mb-10 max-w-3xl text-base leading-relaxed text-slate-600">
        {{ media.intro }}
      </p>

      <div class="grid gap-6 md:grid-cols-2 lg:grid-cols-3">
        <article class="card-elevated rounded-2xl p-8 text-center md:text-left">
          <p class="text-sm font-semibold uppercase tracking-wide text-navy-600">Публикации</p>
          <p class="mt-2 text-5xl font-bold tabular-nums text-navy-950">
            {{ media.publications.toLocaleString('ru-RU') }}
          </p>
          <p class="mt-2 text-sm text-slate-500">в СМИ и соцсетях, в среднем {{ media.monthlyAvg }} в месяц</p>
        </article>
        <article class="card-elevated rounded-2xl p-8 text-center md:text-left">
          <p class="text-sm font-semibold uppercase tracking-wide text-navy-600">Упоминания в СМИ</p>
          <p class="mt-2 text-5xl font-bold tabular-nums text-navy-950">
            {{ media.mentions.toLocaleString('ru-RU') }}
          </p>
          <p class="mt-2 text-sm text-slate-500">
            {{ media.mentionsCompare }}; динамика роста цитируемости
          </p>
        </article>
        <article class="card-elevated rounded-2xl p-8 md:col-span-2 lg:col-span-1">
          <p class="text-sm font-semibold uppercase tracking-wide text-navy-600">Тематика</p>
          <ul class="mt-4 space-y-3">
            <li v-for="(t, i) in media.topics" :key="i" class="flex items-center justify-between gap-4 text-sm">
              <span class="text-slate-700">{{ t.label }}</span>
              <span class="font-semibold tabular-nums text-navy-800">{{ t.pct }}%</span>
            </li>
          </ul>
        </article>
      </div>

      <div class="mt-10">
        <h3 class="mb-4 text-center text-sm font-bold uppercase tracking-wide text-navy-800 md:text-left">
          Официальные страницы
        </h3>
        <div class="flex flex-col gap-3 sm:flex-row sm:flex-wrap sm:justify-center md:justify-start">
          <a
            v-for="(n, i) in media.networks"
            :key="i"
            :href="n.url"
            target="_blank"
            rel="noopener noreferrer"
            class="btn-secondary justify-center sm:min-w-[200px]"
          >
            {{ n.name }}
          </a>
        </div>
      </div>
    </div>
  </section>
</template>
