#language: ru
@tree

Функциональность: Создание характеристики номенкалатуры с дополнительными реквизитами

Как пользователь УНФ
Я хочу создавать характеристики номенклатуры с дополнительными реквизитами,
и чтобы программа подсказывала какие реквизиты необходимо заполнить обязательно

Контекст:
	Допустим Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Создание номенклатуры в категории с обятательными дополнительными реквизитами

	Когда Я создаю номенклатуру "Номенклатура с характеристиками с обязательными доп.рек."
	Тогда открылось окно 'Номенклатура (создание) *'
	И я нажимаю кнопку выбора у поля "Категория"
	Тогда открылось окно 'Категории номенклатуры'
	И я создаю и выбираю новую категорию номенклатуры с дополнительными реквизитами
		Когда я нажимаю на кнопку с именем 'ФормаСоздать'
		Тогда открылось окно 'Категория номенклатуры (создание)'
		И в поле с именем 'Наименование' я ввожу текст 'Категория с обязательными свойствами характеристики'
		И я нажимаю на кнопку 'Записать и закрыть'
		
		Когда открылось окно 'Категории номенклатуры'
		Тогда я нажимаю на кнопку с именем 'ФормаВыбрать'
	
	Когда открылось окно 'Номенклатура (создание) *'
	Тогда я нажимаю на кнопку 'Записать'
	И открылось окно 'Номенклатура с характеристиками с обязательными доп.рек. (Номенклатура)'
	
	И В текущем окне я нажимаю кнопку командного интерфейса 'Характеристики'
	И я устанавливаю флаг 'Использовать характеристики'

	И В текущем окне я нажимаю кнопку командного интерфейса 'Основное'
	Тогда я нажимаю на кнопку 'Записать'

Структура сценария: Добавление дополнительного реквизита в категорию
	Допустим В командном интерфейсе я выбираю 'Продажи' 'Номенклатура'
	Тогда открылось окно 'Номенклатура'
	И в таблице "СписокЗапасы" я перехожу к строке:
		| Наименование                                             |
		| Номенклатура с характеристиками с обязательными доп.рек. |
	И в таблице "СписокЗапасы" я выбираю текущую строку
	Допустим я нажимаю на кнопку открытия поля "Категория"

	Когда открылось окно 'Категория с обязательными свойствами характеристики (Категория номенклатуры)' 
	Тогда я нажимаю на кнопку с именем 'ХарактеристикиДобавить'
	
	Когда открылось окно 'Дополнительные реквизиты и сведения'
	Тогда я нажимаю на кнопку с именем 'ФормаСоздать'
	
	Когда открылось окно 'Дополнительный реквизит (создание)'
	И в поле с именем 'Заголовок' я ввожу текст <ИмяДополнительногоРеквизита>
	И я нажимаю на кнопку 'Записать'
	
	Когда открылось окно '* (Дополнительный реквизит)'
	Тогда я создаю значения реквизита
		И я перехожу к закладке "Значения"
		И в таблице "Значения" я нажимаю на кнопку с именем 'ЗначенияСоздать'
		Тогда открылось окно 'Значение свойства * (Создание)'
		И в поле 'Наименование' я ввожу текст 'один'
		И я нажимаю на кнопку 'Записать и закрыть'
		И я жду закрытия окна 'Значение свойства * (Создание) *' в течение 20 секунд
		
	Когда открылось окно '* (Дополнительный реквизит)'
	Тогда Я закрываю окно '* (Дополнительный реквизит)'

	Когда открылось окно 'Дополнительные реквизиты и сведения'
	Тогда Я закрываю окно 'Дополнительные реквизиты и сведения'
	
	Тогда открылось окно 'Категория с обязательными свойствами характеристики (Категория номенклатуры)'
	И я нажимаю на кнопку 'Записать и закрыть'
	И я жду закрытия окна 'Категория с обязательными свойствами характеристики (Категория номенклатуры)' в течение 20 секунд

Примеры:
| ИмяДополнительногоРеквизита  |
| Реквизит без условий         |
| Обязательный всегда реквизит |

Сценарий: Включение обязательности заполнения у доп реквизита
	Допустим В командном интерфейсе я выбираю 'Продажи' 'Номенклатура'
	Тогда открылось окно 'Номенклатура'
	И в таблице "СписокЗапасы" я перехожу к строке:
		| Наименование                                             |
		| Номенклатура с характеристиками с обязательными доп.рек. |
	И в таблице "СписокЗапасы" я выбираю текущую строку
	И я нажимаю на кнопку открытия поля "Категория"

	Когда открылось окно 'Категория с обязательными свойствами характеристики (Категория номенклатуры)'
	Тогда в таблице "СвойстваХарактеристики" я перехожу к строке:
		| Наименование                 |
		| Обязательный всегда реквизит |
	И я выбираю пункт контекстного меню с именем 'СвойстваХарактеристикиКонтекстноеМенюИзменить' на элементе формы с именем "СвойстваХарактеристики"

	Когда открылось окно 'Обязательный всегда реквизит (Дополнительный реквизит)'
	И я изменяю флаг 'Заполнять обязательно:'
	И я нажимаю на кнопку "Записать и закрыть"

Сценарий: Проверка наличия предупреждения при незаполненном реквизите
	Допустим В командном интерфейсе я выбираю 'Продажи' 'Номенклатура'
	Тогда открылось окно 'Номенклатура'
	И в таблице "СписокЗапасы" я перехожу к строке:
		| Наименование                                             |
		| Номенклатура с характеристиками с обязательными доп.рек. |
	И в таблице "СписокЗапасы" я выбираю текущую строку

	Когда В текущем окне я нажимаю кнопку командного интерфейса 'Характеристики'
	Тогда я нажимаю на кнопку с именем 'ФормаСоздать'
	
	Когда открылось окно 'Характеристика номенклатуры (создание)'
	Тогда в поле с именем 'Наименование' я ввожу текст 'Характеристика 1'
	
	Когда я нажимаю на кнопку 'Записать'
	Тогда я жду, что в сообщениях пользователю будет подстрока 'Поле "Обязательный всегда реквизит" не заполнено.' в течение 30 секунд

	И Я закрываю окно 'Характеристика номенклатуры (создание) *'
	Тогда открылось окно '1С:Предприятие'
	И я нажимаю на кнопку 'Нет'

Сценарий: Запись характеристики с заполненным реквизитом
	Допустим В командном интерфейсе я выбираю 'Продажи' 'Номенклатура'
	Тогда открылось окно 'Номенклатура'
	И в таблице "СписокЗапасы" я перехожу к строке:
		| Наименование                                             |
		| Номенклатура с характеристиками с обязательными доп.рек. |
	И в таблице "СписокЗапасы" я выбираю текущую строку

	Когда В текущем окне я нажимаю кнопку командного интерфейса 'Характеристики'
	Тогда я нажимаю на кнопку с именем 'ФормаСоздать'
	
	Когда открылось окно 'Характеристика номенклатуры (создание)'
	Тогда в поле с именем 'Наименование' я ввожу текст 'Характеристика 1'
	И я заполняю обязательный доп реквизит в таблице
		И в таблице "Свойства_ТаблицаСвойстваИЗначения" я перехожу к строке:
			| Наименование                 |
			| Обязательный всегда реквизит |
		И в таблице "Свойства_ТаблицаСвойстваИЗначения" я нажимаю кнопку выбора у реквизита "Значение"
	
		Когда открылось окно 'Выберите значение свойства *'
		Тогда я нажимаю на кнопку с именем 'ФормаВыбрать'
	
	Когда я нажимаю на кнопку 'Записать и закрыть'
	Тогда открылось окно 'Номенклатура с характеристиками с обязательными доп.рек. (Номенклатура)'