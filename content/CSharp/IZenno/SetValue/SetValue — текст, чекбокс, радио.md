

Основной метод для заполнения форм. Работает с `input[text]`, `textarea`, `input[checkbox]`, `input[radio]`.

## Сигнатура

```csharp
he.SetValue(string value, string emulation, bool useSelectedItems, bool append)
```

## Заполнить текстовое поле

```csharp
var doc = instance.ActiveTab.MainDocument;
var input = doc.FindElementById("username");
input.SetValue("john_doe", "Full", false, false);
```

## Заполнить textarea

```csharp
var textarea = doc.FindElementByTag("textarea", 0);
textarea.SetValue("Мой отзыв о товаре", "Full", false, false);
```

## Поставить галочку (checkbox)

```csharp
var checkbox = doc.FindElementByAttribute("input", "type", "checkbox", "text", 0);
checkbox.SetValue("true", "Full", false, false);
```

## Убрать галочку

```csharp
checkbox.SetValue("false", "Full", false, false);
```

## Выбрать радио-кнопку

```csharp
// Индекс радио-кнопки в группе — 0 это первая
var radio = doc.FindElementByAttribute("input", "type", "radio", "text", 0);
radio.SetValue("0", "Full", false, false);
```

## Дописать текст в конец поля

```csharp
var field = doc.FindElementById("comment");
field.SetValue(" дополнение", "Full", false, true);
// append = true — текст добавится к существующему
```

## Параметры

- `value` — что установить. Для чекбокса: `"true"` / `"false"`. Для радио: индекс `"0"`, `"1"` и т.д.
- `emulation` — уровень эмуляции: `"None"`, `"Middle"`, `"Full"`, `"SuperEmulation"`. Подробнее: [[Уровни эмуляции]]
- `useSelectedItems` — `true` только для `<select>`, иначе `false`
- `append` — `true` если нужно дописать к существующему значению, а не заменить
