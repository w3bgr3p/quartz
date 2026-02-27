up:: [[_ Публикация Obsidian через Quartz]]
prev:: [[Настройка wikilinks и графа]]
next:: [[Troubleshooting]]

---

Симлинки на Windows не работают с Git. Вместо этого используем скрипт синхронизации.

## sync.sh

Создать файл `sync.sh` в корне папки `quartz/`:

```bash
#!/bin/bash
rm -rf content/*
cp -r /s/theBrain/w3bgr3p/KnowledgeHub/. content/
rm -rf content/.git
git add content/
git commit -m "sync: update content"
git push
```

> [!NOTE]
> Заменить путь `/s/theBrain/w3bgr3p/KnowledgeHub/` на путь к своему vault.
> На Windows в Git Bash диск `S:` пишется как `/s/`.

## Запуск

```bash
bash sync.sh
```

Запускать каждый раз когда нужно обновить сайт после изменений в vault.

## Почему rm -rf content/.git

Если vault сам является git-репо (есть папка `.git`), то при `git add content/` Git выдаст ошибку:

```
warning: adding embedded git repository: content
```

Строка `rm -rf content/.git` удаляет вложенный `.git` из **скопированных** файлов. Оригинальный репо vault при этом не затрагивается.

---

prev:: [[Настройка wikilinks и графа]]
next:: [[Troubleshooting]]
