

up:: [[_ Публикация Obsidian через Quartz]]
prev:: [[Требования и установка]]
next:: [[Локальный запуск]]

---

## Структура проекта

После клонирования структура выглядит так:

```
quartz/
├── content/        ← сюда кладём заметки (или симлинк на vault)
├── quartz/
│   ├── cfg.ts      ← главный конфиг
│   └── plugins/
├── quartz.config.ts ← настройки сайта
└── quartz.layout.ts ← настройки интерфейса
```

## Подключение Obsidian Vault

### Вариант A — Скопировать заметки

```bash
cp -r /path/to/your/vault/* quartz/content/
```

Простой способ, но нужно копировать при каждом обновлении.

### Вариант B — Символическая ссылка (рекомендуется)

```bash
# macOS / Linux
ln -s /path/to/your/vault quartz/content

# Windows (от имени администратора)
mklink /D "C:\quartz\content" "C:\path\to\vault"
mklink /D "W:\code_hard\js\quartz\content" "S:\theBrain\w3bgr3p\KnowledgeHub"
```

Vault и сайт синхронизированы автоматически.

### Вариант C — Разместить vault внутри quartz/content/

Переместить сам vault в папку `content/` и открывать его оттуда в Obsidian.

## Редактирование quartz.config.ts

Открыть файл `quartz.config.ts` и настроить основные параметры:

```typescript
const config: QuartzConfig = {
  configuration: {
    pageTitle: "🌿 Мой цифровой сад",       // название сайта
    pageTitleSuffix: "",
    enableSPA: true,
    enablePopovers: true,
    analytics: null,                          // или { provider: "plausible" }
    locale: "ru-RU",                          // язык
    baseUrl: "username.github.io/repo-name",  // ← важно для GitHub Pages
    ignorePatterns: ["private", ".obsidian"], // исключить приватные папки
    defaultDateType: "created",
    theme: {
      fontOrigin: "googleFonts",
      cdnCaching: true,
      typography: {
        header: "Schibsted Grotesk",
        body: "Source Sans Pro",
        code: "IBM Plex Mono",
      },
      colors: {
        lightMode: {
          light: "#faf8f8",
          lightgray: "#e5e5e5",
          gray: "#b8b8b8",
          darkgray: "#4e4e4e",
          dark: "#2b2b2b",
          secondary: "#284b63",
          tertiary: "#84a98c",
          highlight: "rgba(143, 159, 169, 0.15)",
          textHighlight: "#fff23688",
        },
        darkMode: {
          light: "#161618",
          lightgray: "#393639",
          gray: "#646464",
          darkgray: "#d4d4d4",
          dark: "#ebebec",
          secondary: "#7b97aa",
          tertiary: "#84a98c",
          highlight: "rgba(143, 159, 169, 0.15)",
          textHighlight: "#b3aa0288",
        },
      },
    },
  },
  // ... plugins
}
```

> [!WARNING]
> Поле `baseUrl` критично для корректной работы ссылок на GitHub Pages. Указывать без `https://`.

## Исключение приватных заметок

В `ignorePatterns` добавить папки или файлы, которые не должны публиковаться:

```typescript
ignorePatterns: ["private", "drafts", ".obsidian", "Templates"],
```

---

prev:: [[Требования и установка]]
next:: [[Локальный запуск]]
