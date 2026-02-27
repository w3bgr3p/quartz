

Выполняет JavaScript прямо в браузере. Полезно когда:

- Другие методы не срабатывают
- Нужно кликнуть на элемент, скрытый или перекрытый другим
- Нужен программный клик в обход каких-то проверок

```csharp
// Простой JS-клик по элементу с id
instance.ActiveTab.MainDocument.EvaluateScript("document.getElementById('myButton').click();");

project.SendInfoToLog("JS-клик выполнен");
```

```csharp
// Клик через querySelector — когда нет id, но есть класс или другой селектор
instance.ActiveTab.MainDocument.EvaluateScript(
    "document.querySelector('.submit-btn').click();"
);
```

```csharp
// Если нужно кликнуть по элементу внутри формы
instance.ActiveTab.MainDocument.EvaluateScript(
    "document.querySelector('form#loginForm button[type=submit]').click();"
);
```

**Важно:** JS-клик не генерирует события мыши (mouseover, mousedown и т.д.) — только само событие click. Сайты с серьёзной защитой это замечают. Используйте как запасной вариант.
