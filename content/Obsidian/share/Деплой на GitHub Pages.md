Деплой на GitHub Pages

up:: [[_ Публикация Obsidian через Quartz]]
prev:: [[Локальный запуск]]
next:: [[Настройка wikilinks и графа]]

---

## Создание репозитория на GitHub

1. Зайти на [github.com/new](https://github.com/new)
2. Название репозитория → любое, например `my-garden`
3. Видимость → **Public** (обязательно для бесплатного GitHub Pages)
4. Нажать **Create repository**

## Обязательно — создать content/index.md

Без этого файла сайт отдаёт RSS вместо главной страницы.

```markdown
---
title: Главная
---

# 🌿 Название сайта

Добро пожаловать.
```

## Подключение к GitHub

```bash
# В папке quartz/
git init
git remote add origin https://github.com/USERNAME/REPO-NAME.git
```

> [!WARNING]
> Если `git clone` уже был сделан — remote `origin` уже существует и указывает на репо автора Quartz. Заменить:
> ```bash
> git remote set-url origin https://github.com/USERNAME/REPO-NAME.git
> ```

## Настройка GitHub Actions

Quartz поставляется с готовым workflow. Убедиться что файл существует:

```
quartz/.github/workflows/deploy.yml
```

Если файла нет — создать:

```yaml
name: Deploy Quartz site to GitHub Pages

on:
  push:
    branches:
      - v4

permissions:
  contents: read
  pages: write
  id-token: write

concurrency:
  group: "pages"
  cancel-in-progress: false

jobs:
  build:
    runs-on: ubuntu-22.04
    steps:
      - uses: actions/checkout@v4
        with:
          fetch-depth: 0
      - uses: actions/setup-node@v4
        with:
          node-version: 22
      - name: Install Dependencies
        run: npm ci
      - name: Build Quartz
        run: npx quartz build
      - name: Upload artifact
        uses: actions/upload-pages-artifact@v3
        with:
          path: public

  deploy:
    needs: build
    environment:
      name: github-pages
      url: ${{ steps.deployment.outputs.page_url }}
    runs-on: ubuntu-latest
    steps:
      - name: Deploy to GitHub Pages
        id: deployment
        uses: actions/deploy-pages@v4
```

## Первый деплой

```bash
git add .
git commit -m "init: quartz site"
git branch -M v4
git push -u origin v4
```

## Включение GitHub Pages

1. Открыть репозиторий на GitHub
2. **Settings** → **Pages**
3. Source → **GitHub Actions**
4. Сохранить

После этого при каждом `git push` сайт обновляется автоматически.

## Обновление контента

```bash
# После изменения заметок в vault
git add content/
git commit -m "update: новые заметки"
git push
```

Сборка займёт ~1-2 минуты. Сайт будет доступен по адресу:

```
https://USERNAME.github.io/REPO-NAME/
```

> [!TIP]
> Статус деплоя можно отслеживать во вкладке **Actions** репозитория.

---

prev:: [[03 Локальный запуск]]
next:: [[05 Настройка wikilinks и графа]]
