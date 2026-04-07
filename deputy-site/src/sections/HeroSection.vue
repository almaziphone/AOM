<script setup lang="ts">
import { hero } from '@/data/siteContent'
</script>

<template>
  <section
    class="relative overflow-hidden border-b border-navy-100 bg-gradient-to-br from-navy-50 via-white to-slate-50"
    aria-labelledby="hero-title"
  >
    <div
      class="pointer-events-none absolute -right-24 -top-24 h-96 w-96 rounded-full bg-navy-200/30 blur-3xl"
      aria-hidden="true"
    />
    <div
      class="pointer-events-none absolute -bottom-32 -left-24 h-80 w-80 rounded-full bg-navy-300/20 blur-3xl"
      aria-hidden="true"
    />

    <div class="container-page section-y relative">
      <div class="grid items-center gap-12 lg:grid-cols-[1.1fr_0.9fr] lg:gap-16">
        <div>
          <p class="mb-3 text-sm font-semibold uppercase tracking-[0.2em] text-navy-600">
            Депутатский отчёт · 2025
          </p>
          <h1 id="hero-title" class="text-4xl font-bold tracking-tight text-navy-950 md:text-5xl lg:text-[2.75rem] lg:leading-tight">
            {{ hero.name }}
          </h1>
          <p class="mt-4 max-w-2xl text-lg font-medium text-navy-700 md:text-xl">
            {{ hero.role }}
          </p>
          <p class="mt-6 max-w-2xl text-base leading-relaxed text-slate-600 md:text-lg">
            {{ hero.lead }}
          </p>
          <div class="mt-10 flex flex-col gap-4 sm:flex-row sm:items-center">
            <a href="#stats" class="btn-primary text-center"> Отчёт о работе </a>
            <a href="#deputy-contact" class="btn-secondary text-center"> Обратиться к депутату </a>
          </div>
        </div>

        <div class="flex justify-center lg:justify-end">
          <figure class="card-elevated w-full max-w-sm overflow-hidden rounded-2xl shadow-xl ring-1 ring-slate-200/80">
            <img
              src="/photo/photo.jpg"
              width="640"
              height="800"
              class="aspect-[4/5] w-full object-cover object-[center_15%]"
              :alt="`Официальный портрет: ${hero.name}`"
              loading="eager"
              decoding="async"
              fetchpriority="high"
            />
          </figure>
        </div>
      </div>
    </div>
  </section>
</template>
