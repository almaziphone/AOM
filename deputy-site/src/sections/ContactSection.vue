<script setup lang="ts">
import { onMounted, onUnmounted, ref } from 'vue'
import SectionHeading from '@/components/ui/SectionHeading.vue'
import {
  DEPUTY_CONTACT_SECTION_ID,
  setupDeputyContactHashFocus,
} from '@/utils/deputyContactNav'

const FORM_ENDPOINT = 'https://formspree.io/f/xdapbbgo'

const fio = ref('')
const phone = ref('')
const consent = ref(false)
const submitting = ref(false)
const submitted = ref(false)
const errorMessage = ref<string | null>(null)

async function handleSubmit() {
  errorMessage.value = null

  submitting.value = true
  try {
    const body = new FormData()
    body.append('_subject', 'Новое обращение с сайта депутата')
    body.append('fio', fio.value.trim())
    body.append('phone', phone.value.trim())
    body.append('consent', 'yes')

    const response = await fetch(FORM_ENDPOINT, {
      method: 'POST',
      headers: { Accept: 'application/json' },
      body,
    })

    if (!response.ok) {
      const data = (await response.json().catch(() => null)) as { error?: string } | null
      throw new Error(data?.error ?? 'Не удалось отправить обращение. Попробуйте позже.')
    }

    submitted.value = true
  } catch (e) {
    errorMessage.value =
      e instanceof Error ? e.message : 'Не удалось отправить обращение. Попробуйте позже.'
  } finally {
    submitting.value = false
  }
}

let cleanupHashFocus: (() => void) | undefined

onMounted(() => {
  cleanupHashFocus = setupDeputyContactHashFocus()
})

onUnmounted(() => {
  cleanupHashFocus?.()
})
</script>

<template>
  <section :id="DEPUTY_CONTACT_SECTION_ID" class="section-y bg-slate-50">
    <div class="container-page">
      <SectionHeading title="Обратиться к депутату" subtitle="Обращение" />

      <div class="card-elevated mx-auto max-w-xl p-8 md:p-10">
        <p class="mb-8 text-base leading-relaxed text-slate-600">
          Оставьте контактные данные для обратной связи.
        </p>

        <div
          v-if="submitted"
          class="rounded-xl border border-navy-200 bg-navy-50 px-6 py-8 text-center"
          role="status"
        >
          <p class="text-lg font-semibold text-navy-900">Спасибо! Ваше обращение отправлено.</p>
        </div>

        <form v-else class="space-y-6" @submit.prevent="handleSubmit">
          <input type="hidden" name="_subject" value="Новое обращение с сайта депутата" />

          <div>
            <label for="contact-fio" class="mb-2 block text-sm font-semibold text-navy-900">
              ФИО
            </label>
            <input
              id="contact-fio"
              v-model="fio"
              type="text"
              name="fio"
              autocomplete="name"
              required
              maxlength="500"
              class="w-full rounded-xl border border-slate-200 bg-white px-4 py-3.5 text-base text-slate-900 shadow-sm outline-none transition placeholder:text-slate-400 focus:border-navy-500 focus:ring-2 focus:ring-navy-500/20"
              placeholder="Фамилия, имя, отчество"
            />
          </div>

          <div>
            <label for="contact-phone" class="mb-2 block text-sm font-semibold text-navy-900">
              Телефон
            </label>
            <input
              id="contact-phone"
              v-model="phone"
              type="tel"
              name="phone"
              autocomplete="tel"
              required
              maxlength="50"
              class="w-full rounded-xl border border-slate-200 bg-white px-4 py-3.5 text-base text-slate-900 shadow-sm outline-none transition placeholder:text-slate-400 focus:border-navy-500 focus:ring-2 focus:ring-navy-500/20"
              placeholder="+7 (___) ___-__-__"
            />
          </div>

          <div>
            <label class="flex cursor-pointer items-start gap-3 text-sm leading-snug text-slate-700">
              <input
                v-model="consent"
                type="checkbox"
                name="consent"
                value="yes"
                required
                class="mt-0.5 size-5 shrink-0 rounded border-slate-300 text-navy-800 focus:ring-navy-600"
              />
              <span>Я согласен на обработку персональных данных</span>
            </label>
          </div>

          <p v-if="errorMessage" class="text-sm font-medium text-red-600" role="alert">
            {{ errorMessage }}
          </p>

          <button
            type="submit"
            class="btn-primary w-full py-4 text-base disabled:cursor-not-allowed disabled:opacity-60"
            :disabled="submitting"
          >
            {{ submitting ? 'Отправка…' : 'Отправить обращение' }}
          </button>
        </form>
      </div>
    </div>
  </section>
</template>
