

up:: [[_ Публикация Obsidian через Quartz]]
prev:: [[Деплой на GitHub Pages]]

---

## Поддержка Wikilinks

Quartz поддерживает `[[wikilinks]]` из коробки. Убедиться, что плагин включён в `quartz.config.ts`:

```typescript
plugins: {
  transformers: [
    Plugin.ObsidianFlavoredMarkdown({ enableInHtmlEmbed: false }), // ← wikilinks
    Plugin.GitHubFlavoredMarkdown(),
    // ...
  ],
}
```

### Форматы ссылок

| Синтаксис | Результат |
|---|---|
| `[[Заметка]]` | Ссылка на заметку |
| `[[Заметка\|Текст ссылки]]` | Ссылка с альтернативным текстом |
| `[[Заметка#Заголовок]]` | Ссылка на раздел |
| `![[Заметка]]` | Встраивание (transclusion) |

## Настройка графа

В `quartz.layout.ts` граф включается как компонент:

```typescript
import { QuartzLayout } from "./quartz/cfg"
import * as Component from "./quartz/components"

export const defaultContentPageLayout: PageLayout = {
  beforeBody: [Component.Breadcrumbs()],
  left: [
    Component.PageTitle(),
    Component.MobileOnly(Component.Spacer()),
    Component.Search(),
    Component.Darkmode(),
    Component.DesktopOnly(Component.Explorer()),
  ],
  right: [
    Component.Graph(),           // ← граф связей
    Component.DesktopOnly(Component.TableOfContents()),
    Component.Backlinks(),       // ← обратные ссылки
  ],
}
```

### Параметры компонента Graph

```typescript
Component.Graph({
  localGraph: {
    drag: true,
    zoom: true,
    depth: 1,          // глубина отображения связей
    scale: 1.1,
    repelForce: 0.5,
    centerForce: 0.3,
    linkDistance: 30,
    fontSize: 0.6,
    opacityScale: 1,
    removeSelfLoops: true,
  },
  globalGraph: {
    drag: true,
    zoom: true,
    depth: -1,         // -1 = показать все связи
    scale: 0.9,
    repelForce: 0.5,
    centerForce: 0.3,
    linkDistance: 30,
    fontSize: 0.6,
    opacityScale: 1,
    removeSelfLoops: true,
  },
})
```

## Теги

Теги из Obsidian (`#тег` или frontmatter) работают на сайте автоматически.

```yaml
---
tags:
  - программирование
  - javascript
---
```

## Frontmatter

Quartz читает YAML frontmatter:

```yaml
---
title: Мой заголовок
date: 2024-01-15
description: Краткое описание для превью
draft: true        # скрыть страницу с сайта
tags: [тег1, тег2]
aliases: [псевдоним]
---
```

> [!NOTE]
> `draft: true` исключает заметку из публикации, но файл остаётся в репозитории. Для полного исключения использовать `ignorePatterns` в конфиге.

## Итоговая структура vault для публикации

```
vault/
├── 00 Индекс.md          # Главная страница → index.md
├── Программирование/
│   ├── Arrays.md
│   └── Multidimensional Arrays.md
├── private/              # Папка в ignorePatterns — не публикуется
└── Templates/            # Шаблоны — не публикуются
```

> [!TIP]
> Файл `index.md` (или `00 Индекс.md` с алиасом `index`) станет главной страницей сайта.

---

prev:: [[Деплой на GitHub Pages]]
up:: [[_ Публикация Obsidian через Quartz]]
