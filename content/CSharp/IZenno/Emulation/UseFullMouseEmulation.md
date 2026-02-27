`instance.UseFullMouseEmulation` — булев флаг на инстансе. При включённом флаге курсор физически перемещается по экрану до целевого элемента по траектории. Если по пути курсора встречается элемент, реагирующий на наведение мыши — он отреагирует. (поведение сайта будет менее предсказуемым и потребует больше внимания при автоматизации)

csharp

```csharp
instance.UseFullMouseEmulation = true;

HtmlElement he = instance.ActiveTab.FindElementById("submitBtn");
if (!he.IsVoid)
{
    he.RiseEvent("click", "Full");
}
```

- `UseFullMouseEmulation` — по умолчанию `false`
- Работает в паре с [[Клик HTML-элементу#EmulationLevel|EmulationLevel]], не заменяет его

## Сравнение

||`UseFullMouseEmulation = false`|`UseFullMouseEmulation = true`|
|---|---|---|
|Движение курсора|нет|по траектории до элемента|
|Hover-реакции по пути|нет|есть|
|Скорость|быстрее|медленнее|