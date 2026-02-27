## Windows

**Что нужно:** Git + плагин Obsidian Git

**1. Установи Git** Скачай с git-scm.com, установи с настройками по умолчанию.

**2. Создай репозиторий на GitHub/GitLab** Создай приватный репо. В настройках GitHub → Settings → Developer settings → Personal access tokens → сгенерируй токен с правами `repo`.

**3. Клонируй репо в папку vault**

```
git clone https://github.com/username/vault.git "C:\путь\к\vault"
```

Если vault уже существует:

```
cd C:\путь\к\vault
git init
git remote add origin https://github.com/username/vault.git
git add .
git commit -m "init"
git push -u origin main
```

При запросе логина/пароля — введи username и **токен** (не пароль).

**4. Сохрани токен в Git Credential Manager** Windows автоматически сохранит токен после первого ввода через встроенный Git Credential Manager.

**5. Установи плагин Obsidian Git** Настройки → Community plugins → найди "Obsidian Git" → включи.

Основные настройки плагина:

- `Auto pull interval` — например 5 минут
- `Auto push interval` — например 5 минут
- `Auto pull on startup` — включить
- `Commit message` — можно оставить дефолтное