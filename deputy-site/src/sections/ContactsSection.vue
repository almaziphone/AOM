<script setup lang="ts">
import SectionHeading from '@/components/ui/SectionHeading.vue'
import { contacts, media } from '@/data/siteContent'

const primarySocial = media.networks[0]

function scrollToId(id: string) {
  document.getElementById(id)?.scrollIntoView({ behavior: 'smooth' })
}
</script>

<template>
  <section id="contacts" class="section-y bg-white">
    <div class="container-page">
      <SectionHeading :title="contacts.title" subtitle="Связь" />

      <div
        class="card-elevated overflow-hidden rounded-2xl border border-navy-100 bg-gradient-to-br from-navy-900 to-navy-950 p-10 text-white md:p-14"
      >
        <p class="max-w-2xl text-lg leading-relaxed text-navy-100">
          {{ contacts.lead }}
        </p>
        <div class="mt-10 flex flex-col gap-4 sm:flex-row sm:flex-wrap">
          <button type="button" class="btn-primary bg-white text-navy-900 hover:bg-navy-50" @click="scrollToId('requests')">
            {{ contacts.ctaPrimary }}
          </button>
          <a
            v-if="primarySocial"
            :href="primarySocial.url"
            target="_blank"
            rel="noopener noreferrer"
            class="btn-secondary border-white/30 bg-white/10 text-white hover:bg-white/20"
          >
            {{ contacts.ctaSecondary }}
          </a>
        </div>
      </div>
    </div>
  </section>
</template>
