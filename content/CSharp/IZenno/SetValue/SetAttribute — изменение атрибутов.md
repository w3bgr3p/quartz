

Меняет атрибут элемента напрямую в DOM, без эмуляции и без событий. Сайт об этом не узнает — JavaScript не сработает.

## Сигнатура

```csharp
he.SetAttribute(string attrName, string attrValue)
```

## Снять disabled с кнопки

```csharp
var doc = instance.ActiveTab.MainDocument;
var btn = doc.FindElementById("submit-btn");
btn.SetAttribute("disabled", "");
// Пустая строка убирает значение атрибута
```

## Добавить/сменить placeholder

```csharp
var input = doc.FindElementById("search");
input.SetAttribute("placeholder", "Введите запрос...");
```

## Сменить тип поля

```csharp
// Превратить password в text чтобы увидеть что написано
var passField = doc.FindElementByAttribute("input", "type", "password", "text", 0);
passField.SetAttribute("type", "text");
```

## Поставить checked на чекбокс напрямую

```csharp
var cb = doc.FindElementById("agree");
cb.SetAttribute("checked", "true");
// Внимание: это не вызывает событие onclick/onchange
// Используй SetValue если нужна реакция сайта
```

## Когда использовать SetAttribute, а не SetValue

SetAttribute нужен когда:
- нужно поменять `class`, `style`, `href`, `src`, `data-*` атрибут
- нужно убрать или добавить атрибут как флаг (`disabled`, `readonly`)
- сайт читает данные из атрибута, а не из value

SetValue нужен когда:
- нужно чтобы сайт среагировал на изменение (обработчики событий)

## Параметры

- `attrName` — имя атрибута: `"class"`, `"value"`, `"href"`, `"data-id"` и т.д.
- `attrValue` — новое значение. Пустая строка `""` — обнуляет значение атрибута
