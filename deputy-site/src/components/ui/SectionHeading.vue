<script setup lang="ts">
defineProps<{
  title: string
  subtitle?: string
  id?: string
}>()
</script>

<template>
  <header :id="id" class="mb-10 md:mb-14">
    <p
      v-if="subtitle"
      class="mb-2 text-sm font-semibold uppercase tracking-wider text-navy-500"
    >
      {{ subtitle }}
    </p>
    <h2 class="text-3xl font-bold tracking-tight text-navy-950 md:text-4xl">
      {{ title }}
    </h2>
    <div class="mt-4 h-1 w-16 rounded-full bg-navy-600" aria-hidden="true" />
  </header>
</template>
