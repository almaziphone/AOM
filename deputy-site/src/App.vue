<script setup lang="ts">
import AppHeader from '@/components/AppHeader.vue'
import AboutSection from '@/sections/AboutSection.vue'
import CharitySection from '@/sections/CharitySection.vue'
import ContactSection from '@/sections/ContactSection.vue'
import ContactsSection from '@/sections/ContactsSection.vue'
import DirectionsSection from '@/sections/DirectionsSection.vue'
import FooterSection from '@/sections/FooterSection.vue'
import HeroSection from '@/sections/HeroSection.vue'
import InitiativesSection from '@/sections/InitiativesSection.vue'
import MediaSection from '@/sections/MediaSection.vue'
import OrdersSection from '@/sections/OrdersSection.vue'
import RequestsSection from '@/sections/RequestsSection.vue'
import StatsSection from '@/sections/StatsSection.vue'
</script>

<template>
  <AppHeader />
  <main>
    <HeroSection />
    <AboutSection />
    <StatsSection />
    <DirectionsSection />
    <InitiativesSection />
    <OrdersSection />
    <RequestsSection />
    <CharitySection />
    <MediaSection />
    <ContactSection />
    <ContactsSection />
  </main>
  <FooterSection />
</template>
