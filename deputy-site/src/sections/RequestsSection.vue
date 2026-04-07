<script setup lang="ts">
import SectionHeading from '@/components/ui/SectionHeading.vue'
import { requests } from '@/data/siteContent'

const maxChannel = Math.max(...requests.channels.map((c) => c.value), 1)
</script>

<template>
  <section id="requests" class="section-y bg-slate-50">
    <div class="container-page">
      <SectionHeading :title="requests.title" />

      <div class="mb-10 flex flex-wrap items-end gap-6">
        <div>
          <p class="text-sm font-semibold uppercase tracking-wide text-navy-600">Всего обращений</p>
          <p class="mt-1 text-5xl font-bold tabular-nums text-navy-950 md:text-6xl">
            {{ requests.total }}
          </p>
        </div>
        <p class="max-w-xl text-base leading-relaxed text-slate-600">
          {{ requests.intro }}
        </p>
      </div>

      <div class="grid gap-8 lg:grid-cols-2">
        <div>
          <h3 class="mb-4 text-sm font-bold uppercase tracking-wide text-navy-800">
            Каналы поступления
          </h3>
          <ul class="space-y-4">
            <li v-for="(ch, i) in requests.channels" :key="i">
              <div class="mb-1 flex justify-between text-sm">
                <span class="font-medium text-slate-700">{{ ch.label }}</span>
                <span class="tabular-nums text-navy-800">{{ ch.value }}</span>
              </div>
              <div class="h-2 overflow-hidden rounded-full bg-navy-100">
                <div
                  class="h-full rounded-full bg-navy-600 transition-all"
                  :style="{ width: `${(ch.value / maxChannel) * 100}%` }"
                />
              </div>
            </li>
          </ul>
        </div>

        <div class="card-elevated rounded-2xl p-8">
          <h3 class="mb-4 text-sm font-bold uppercase tracking-wide text-navy-800">
            География
          </h3>
          <ul class="space-y-3">
            <li
              v-for="(g, i) in requests.geography"
              :key="i"
              class="flex items-center justify-between border-b border-slate-100 py-2 last:border-0"
            >
              <span class="text-slate-700">{{ g.place }}</span>
              <span class="font-semibold tabular-nums text-navy-900">{{ g.count }}</span>
            </li>
          </ul>
          <p class="mt-4 text-sm leading-relaxed text-slate-500">
            {{ requests.geographyExtra }}
          </p>
        </div>
      </div>

      <div class="mt-10 card-elevated rounded-2xl border border-navy-100 bg-white p-8 md:flex md:items-center md:justify-between md:gap-8">
        <div>
          <h3 class="text-lg font-bold text-navy-950">Личные приёмы</h3>
          <p class="mt-2 text-sm leading-relaxed text-slate-600">
            {{ requests.receptions.text }}
          </p>
        </div>
        <div class="mt-6 flex gap-10 md:mt-0">
          <div>
            <p class="text-3xl font-bold tabular-nums text-navy-900">{{ requests.receptions.count }}</p>
            <p class="text-sm text-slate-500">приёма проведено</p>
          </div>
          <div>
            <p class="text-3xl font-bold tabular-nums text-navy-900">{{ requests.receptions.applicants }}</p>
            <p class="text-sm text-slate-500">заявителей</p>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>
