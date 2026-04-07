<script setup lang="ts">
const links = [
  { href: '#about', label: 'О депутате' },
  { href: '#stats', label: 'Итоги' },
  { href: '#initiatives', label: 'Инициативы' },
  { href: '#requests', label: 'Обращения' },
  { href: '#media', label: 'СМИ' },
  { href: '#contacts', label: 'Контакты' },
]
</script>

<template>
  <header
    class="sticky top-0 z-50 border-b border-slate-200/90 bg-white/95 shadow-sm backdrop-blur-md"
  >
    <div class="container-page flex h-14 items-center justify-between gap-4 md:h-16">
      <a href="#" class="shrink-0 text-sm font-bold tracking-tight text-navy-950 md:text-base">
        А.М.&nbsp;Осадчук
      </a>
      <nav
        class="-mx-1 flex max-w-[min(100%,28rem)] flex-1 items-center gap-4 overflow-x-auto px-1 text-xs font-medium text-slate-600 sm:text-sm lg:max-w-none lg:justify-end lg:gap-6"
        aria-label="Разделы страницы"
      >
        <a
          v-for="l in links"
          :key="l.href"
          :href="l.href"
          class="shrink-0 whitespace-nowrap transition hover:text-navy-900"
        >
          {{ l.label }}
        </a>
      </nav>
      <a href="#contacts" class="btn-primary shrink-0 px-4 py-2 text-xs"> Связаться </a>
    </div>
  </header>
</template>
