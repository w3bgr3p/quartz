## Содержание

- [[Клик HTML-элементу]] — `he.Click()` и `he.RiseEvent()`
- [[Клик по координатам]] — `instance.Click()` и `tab.MouseClick()`
- [[Клик по картинке]] — `tab.FindImage()` + клик по результату
- [[Клик через EvaluateScript (JS)]] — `document.EvaluateScript()`
- [[UseFullMouseEmulation]] — плавная траектория, максимальная маскировка

---

## Сравнительная таблица

|Метод|Эмуляция|Скорость|Когда использовать|
|---|---|---|---|
|`he.Click()`|минимальная|быстро|простые формы, чекбоксы|
|`he.RiseEvent("click","Full")`|полная|медленнее|защищённые сайты|
|`instance.Click(x1,x2,y1,y2,...)`|мышь в зоне|средне|canvas, нет DOM-элемента|
|`tab.MouseClick(x,y,...)`|мышь в точку|средне|точный клик по координатам|
|`tab.FindImage(...)` + клик|мышь|медленно|кнопки без DOM (flash, canvas)|
|`EvaluateScript("...click()")`|нет|очень быстро|запасной вариант|
|`FullEmulationMouseMove` + `FullEmulationMouseClick`|плавная траектория|медленно|сайты с анализом движения мыши|

---