/** Секция «Обратиться к депутату» и первое поле формы (Formspree) */
export const DEPUTY_CONTACT_SECTION_ID = 'deputy-contact'
export const DEPUTY_CONTACT_FIO_INPUT_ID = 'contact-fio'

export function focusDeputyContactFio(): void {
  document.getElementById(DEPUTY_CONTACT_FIO_INPUT_ID)?.focus({ preventScroll: true })
}

/** Плавный скролл к форме и фокус на поле ФИО (кнопки без hash-ссылки) */
export function scrollToDeputyContactAndFocus(): void {
  document.getElementById(DEPUTY_CONTACT_SECTION_ID)?.scrollIntoView({ behavior: 'smooth' })
  try {
    window.history.replaceState(null, '', `#${DEPUTY_CONTACT_SECTION_ID}`)
  } catch {
    /* ignore */
  }
  window.setTimeout(() => {
    focusDeputyContactFio()
  }, 450)
}

/** Фокус после перехода по ссылкам вида href="#deputy-contact" */
export function setupDeputyContactHashFocus(): () => void {
  const scheduleFocus = () => {
    window.setTimeout(() => {
      focusDeputyContactFio()
    }, 500)
  }

  const onHash = () => {
    if (window.location.hash === `#${DEPUTY_CONTACT_SECTION_ID}`) {
      scheduleFocus()
    }
  }

  window.addEventListener('hashchange', onHash)
  if (window.location.hash === `#${DEPUTY_CONTACT_SECTION_ID}`) {
    scheduleFocus()
  }

  return () => window.removeEventListener('hashchange', onHash)
}
