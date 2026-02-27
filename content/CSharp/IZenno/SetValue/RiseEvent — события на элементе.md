# RiseEvent — события на элементе

Вызывает JavaScript-событие на элементе вручную. Используется когда SetValue установил значение, но сайт не отреагировал — потому что реакция висит на событии, а не на самом значении.

## Сигнатура

```csharp
he.RiseEvent(string eventName, string emulation)
```

## Базовый пример — поджечь onclick

```csharp
var doc = instance.ActiveTab.MainDocument;
var btn = doc.FindElementById("submit-btn");
btn.RiseEvent("onclick", "Full");
```

## Сначала SetValue, потом RiseEvent

```csharp
var input = doc.FindElementById("email");
input.SetValue("user@mail.com", "None", false, false);
input.RiseEvent("onchange", "Full");
// Сайт среагирует на изменение поля — например включит кнопку отправки
```

## Частые события

```csharp
he.RiseEvent("onclick", "Full");      // клик
he.RiseEvent("onchange", "Full");     // изменение значения
he.RiseEvent("oninput", "Full");      // ввод (срабатывает при каждом символе)
he.RiseEvent("onfocus", "Middle");    // фокус на элементе
he.RiseEvent("onblur", "Middle");     // потеря фокуса
he.RiseEvent("onmouseover", "Full");  // наведение мыши
```

## Пример: форма которая не отправляется через Click

```csharp
var doc = instance.ActiveTab.MainDocument;

// Заполняем поле
var loginInput = doc.FindElementById("login");
loginInput.SetValue("myuser", "Middle", false, false);

// Заполняем пароль
var passInput = doc.FindElementById("password");
passInput.SetValue("mypass", "Middle", false, false);

// Жмём кнопку через событие
var submitBtn = doc.FindElementByAttribute("button", "type", "submit", "text", 0);
submitBtn.RiseEvent("onclick", "Full");
```

## Параметры

- `eventName` — название события: `"onclick"`, `"onchange"`, `"oninput"` и т.д. С префиксом `"on"`
- `emulation` — уровень эмуляции. Подробнее: [[Уровни эмуляции]]
