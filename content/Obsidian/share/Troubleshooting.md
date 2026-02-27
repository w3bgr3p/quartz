

up:: [[_ Публикация Obsidian через Quartz]]
prev:: [[Синхронизация vault с сайтом]]

---

## Сайт отдаёт RSS вместо главной страницы

**Симптом:** открываешь `https://username.github.io/repo/` и видишь XML с `<rss version="2.0">`.

**Причина 1 — нет `content/index.md`:**
```bash
# Создать content/index.md
echo "---\ntitle: Главная\n---\n# Главная" > content/index.md
git add content/index.md
git commit -m "add: index.md"
git push
```

**Причина 2 — неверный формат `baseUrl` в `quartz.config.ts`:**
```typescript
// ❌ Неверно
baseUrl: "https://username.github.io/repo/"

// ✅ Верно — без https://, без / в конце
baseUrl: "username.github.io/repo"
```

---

## Ошибка парсинга YAML frontmatter

**Симптом:**
```
Failed to process markdown `file.md`: end of the stream or a document separator is expected
```

**Причина:** файл начинается с `---` но нет закрывающего `---`, либо в тексте есть символы `:` или `«»` которые YAML интерпретирует как разметку.

**Решение:** добавить корректный frontmatter:
```yaml
---
title: "Название заметки"
---
```

Если в тексте есть двоеточие — обернуть значение в кавычки:
```yaml
---
title: "Метод: как это работает"
---
```

---

## LaTeX предупреждения на русском тексте

**Симптом:**
```
Unicode text character "н" used in math mode [unicodeTextInMathMode]
```

**Причина:** в тексте есть `$текст$` — одиночные доллары, которые Quartz воспринимает как формулу.

**Решение:** найти в заметках конструкции `$...$` не являющиеся формулами и экранировать:
```markdown
❌ $строк покурсу$
✅ \$строк покурсу\$
```

---

## remote origin already exists

**Симптом:**
```
error: remote origin already exists.
```

**Причина:** при `git clone` Quartz уже прописал `origin` на репо автора.

**Решение:**
```bash
git remote set-url origin https://github.com/USERNAME/REPO.git
# Проверить
git remote -v
```

---

## warning: adding embedded git repository

**Симптом:**
```
warning: adding embedded git repository: content
```

**Причина:** vault является git-репо, и ты скопировал его вместе с папкой `.git`.

**Решение:**
```bash
rm -rf content/.git
git add content/
git commit -m "fix: remove nested git"
git push
```

---

## Симлинк на Windows не работает с Git

**Симптом:** `git status` показывает `nothing to commit` но `content/` на GitHub пустая или содержит только ссылку.

**Причина:** Git на Windows не разворачивает симлинки при пуше.

**Решение:** использовать [[Синхронизация vault с сайтом|скрипт синхронизации]] вместо симлинка.

---

## mklink — cannot create a file when that file already exists

**Симптом:**
```
Cannot create a file when that file already exists.
```

**Причина:** папка `content/` уже существует после клонирования Quartz.

**Решение:**
```cmd
rmdir /S /Q "W:\quartz\content"
mklink /D "W:\quartz\content" "S:\path\to\vault"
```

> [!WARNING]
> `rmdir /S /Q` удаляет без подтверждения. Убедись что в `content/` нет нужных файлов.

---

## Убрать брендинг Quartz из репо

```bash
# Удалить спонсорскую кнопку GitHub
rm .github/FUNDING.yml

# Удалить code of conduct
rm CODE_OF_CONDUCT.md

# Заменить README
echo "# my-vault" > README.md

git add .
git commit -m "chore: remove quartz branding"
git push
```

Ссылки на автора в футере сайта — убрать в `quartz.layout.ts`:
```typescript
Component.Footer({
  links: {
    GitHub: "https://github.com/USERNAME/REPO",
  },
}),
```

---

prev:: [[Синхронизация vault с сайтом]]
up:: [[_ Публикация Obsidian через Quartz]]
