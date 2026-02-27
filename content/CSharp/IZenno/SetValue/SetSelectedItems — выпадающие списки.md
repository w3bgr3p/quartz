

Специализированный метод для `<select>`. Выбирает опции по их индексам (не по тексту, не по value).

## Сигнатура

```csharp
he.SetSelectedItems(string value)
```

Индексы передаются строкой через точку с запятой.

## Выбрать одну опцию (вторую по счёту)

```csharp
var doc = instance.ActiveTab.MainDocument;
var select = doc.FindElementByName("country");
select.SetSelectedItems("1");
// 0 — первая опция, 1 — вторая и т.д.
```

## Выбрать несколько опций (мультиселект)

```csharp
var multiSelect = doc.FindElementByAttribute("select", "multiple", "multiple", "text", 0);
multiSelect.SetSelectedItems("0;2;4");
// Выберет первую, третью и пятую опции
```

## Прочитать что выбрано

```csharp
var select = doc.FindElementByName("lang");
string selected = select.GetSelectedItems();
project.SendInfoToLog("Выбрано: " + selected);
// Вернёт индексы через ";"
```

## Альтернатива через [[SetValue — текст, чекбокс, радио|SetValue]]

```csharp
// SetValue с useSelectedItems = true делает то же самое
var select = doc.FindElementByName("country");
select.SetValue("1;2", "Middle", true, false);
```

## Параметры

- `value` — строка с индексами через `";"`. Например: `"0"`, `"1;3"`, `"0;1;2;4"`

## Важно

Индексы считаются от нуля. Чтобы узнать нужный индекс — откройте DevTools, посчитайте `<option>` теги внутри `<select>`.
