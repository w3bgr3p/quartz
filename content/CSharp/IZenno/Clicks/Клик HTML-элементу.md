Клик по HTML-элементу

Это самый частый способ. Сначала находим элемент, потом кликаем.

**`he.Click()`** — простой клик без эмуляции мыши. Браузер просто получает событие click. Быстро, но сайт может заподозрить бота.

```csharp
// Находим кнопку по атрибуту и кликаем
HtmlElement he = instance.ActiveTab.FindElementById("submitBtn");

if (!he.IsVoid)
{
    he.Click();
    project.SendInfoToLog("Клик выполнен");
}
else
{
    project.SendInfoToLog("Элемент не найден");
}
```

**`he.RiseEvent("click", "Full")`** — более человечный клик. Эмулирует наведение мыши, mouseover, focus и другие события перед кликом. Лучше для защищённых сайтов.

##  EmulationLevel
Уровни эмуляции:

- `"None"` — только само событие, без лишнего
- `"Middle"` — стандартный набор событий
- `"Full"` — полная эмуляция, как живая мышь

```csharp
HtmlElement he = instance.ActiveTab.FindElementByAttribute("a", "innertext", "Войти", "text", 0);

if (!he.IsVoid)
{
    he.RiseEvent("click", "Full");
    instance.ActiveTab.WaitDownloading();
    project.SendInfoToLog("Перешли по ссылке");
}
```

**Когда что использовать:**

- `Click()` — я не использую - на ваш страх и риск
- `RiseEvent("click", "Full")` — для обычных кликов


## Типичные ошибки новичков

**1. Клик до загрузки страницы**

```csharp
// Неправильно — страница может не загрузиться
instance.ActiveTab.Navigate("https://example.com", "");
HtmlElement he = instance.ActiveTab.FindElementById("btn"); // элемент ещё не существует!

// Правильно — ждём загрузки
instance.ActiveTab.Navigate("https://example.com", "");
instance.ActiveTab.WaitDownloading();
HtmlElement he = instance.ActiveTab.FindElementById("btn");
```

**2. Клик без проверки на IsVoid**

```csharp
// Неправильно — упадёт с ошибкой если элемент не найден
HtmlElement he = instance.ActiveTab.FindElementById("btn");
he.Click(); // NullReferenceException если he.IsVoid == true

// Правильно
HtmlElement he = instance.ActiveTab.FindElementById("btn");
if (!he.IsVoid)
{
    he.Click();
}
```