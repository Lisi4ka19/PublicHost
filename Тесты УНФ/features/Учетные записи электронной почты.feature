# language: ru
@Email
@tree

Функциональность: Учетные записи электронной почты
	Как пользователь УНФ
	Я хочу использовать расширенные возможности электронной почты
	Чтобы взаимодействовать с клиентами

Контекст:
	Допустим Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Подключение учетной записи по протоколу Gmail
	Допустим Я открываю навигационную ссылку "e1cib/data/Справочник.УчетныеЗаписиЭлектроннойПочты"
	Тогда открылось окно 'Создание учетной записи электронной почты'
	Когда я нажимаю на кнопку 'Gmail'
	Тогда не появилось окно предупреждения системы

	Затем Я закрываю окно 'Синхронизация с Google'
	И Я закрываю окно 'Создание учетной записи электронной почты'

Сценарий: Помощник настройки учетной записи
	Допустим Я открываю навигационную ссылку "e1cib/data/Справочник.УчетныеЗаписиЭлектроннойПочты"
	Тогда открылось окно 'Создание учетной записи электронной почты'
	И в поле 'Адрес почты' я ввожу текст 'testaccount@localhost'
	И в поле с именем 'Пароль' я ввожу текст 'testaccount@localhost'
	И в поле 'Имя отправителя' я ввожу текст 'testaccount@localhost'
	И я меняю значение переключателя 'Настроить' на 'Настроить параметры подключения вручную'
	И я нажимаю на кнопку 'Далее >'
	И в поле с именем 'СерверИсходящейПочты' я ввожу текст 'localhost'
	И я нажимаю на кнопку 'Далее >'
	Протокол POP не должен быть доступен для выбора
		Затем Проверяю шаги на Исключение:
		|И из выпадающего списка "Протокол" я выбираю точное значение 'POP'|
	И в поле с именем 'СерверВходящейПочты' я ввожу текст 'localhost'
	И я нажимаю на кнопку 'Далее >'
	И я нажимаю на кнопку 'Далее >'
	И я нажимаю на кнопку 'Перейти к учетной записи'
	Тогда открылось окно 'testaccount@localhost (Учетная запись электронной почты)'

	Затем я нажимаю на кнопку 'Записать и закрыть'
	Тогда не появилось окно предупреждения системы

Сценарий: Дополнительные настройки учетных записей в УНФ
	Допустим Я открываю навигационную ссылку "e1cib/list/Справочник.УчетныеЗаписиЭлектроннойПочты"
	Тогда открылось окно 'Учетные записи электронной почты'

	Когда в таблице "Список" я перехожу к строке:
		| 'Адрес электронной почты' | 'Наименование'          |
		| 'testaccount@localhost'   | 'testaccount@localhost' |
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'testaccount@localhost (Учетная запись электронной почты)'

	Когда я разворачиваю группу "Прочие настройки"
	И в поле 'Число попыток узнать идентификатор отправленного письма' я ввожу текст '0'
	И флаг 'Недействителен' равен 'Ложь'
	И я нажимаю на кнопку 'Записать и закрыть'
	Тогда не появилось окно предупреждения системы

Сценарий: Тип учетной записи по умолчанию равен "IMAP"
	Допустим Я открываю навигационную ссылку "e1cib/list/Справочник.УчетныеЗаписиЭлектроннойПочты"
	Тогда открылось окно 'Учетные записи электронной почты'
	
	Когда в таблице "Список" я перехожу к строке:
		| 'Адрес электронной почты' | 'Наименование'          |
		| 'testaccount@localhost'   | 'testaccount@localhost' |
	Тогда в таблице "Список" я выбираю текущую строку

	Когда открылось окно 'testaccount@localhost (Учетная запись электронной почты)'
	Тогда элемент формы "Тип учетной записи" стал равен "IMAP"

Сценарий: В списке протоколов отсутствует POP
	Допустим Я открываю навигационную ссылку "e1cib/list/Справочник.УчетныеЗаписиЭлектроннойПочты"
	Тогда открылось окно 'Учетные записи электронной почты'
	
	Когда в таблице "Список" я перехожу к строке:
		| 'Адрес электронной почты' | 'Наименование'          |
		| 'testaccount@localhost'   | 'testaccount@localhost' |
	Тогда в таблице "Список" я выбираю текущую строку

	Когда открылось окно 'testaccount@localhost (Учетная запись электронной почты)'
	Тогда Проверяю шаги на Исключение:
		|И из выпадающего списка "Тип учетной записи" я выбираю точное значение 'POP'|

Сценарий: Проверка настроек
	Допустим Я открываю навигационную ссылку "e1cib/list/Справочник.УчетныеЗаписиЭлектроннойПочты"
	Тогда открылось окно 'Учетные записи электронной почты'
	Когда в таблице "Список" я перехожу к строке:
		| 'Адрес электронной почты' | 'Наименование'          |
		| 'testaccount@localhost'   | 'testaccount@localhost' |
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'testaccount@localhost (Учетная запись электронной почты)'

	Когда я нажимаю на кнопку 'Проверить настройки'
	Тогда открылось окно 'Проверка настроек учетной записи'
	И я нажимаю на кнопку 'Закрыть'

Сценарий: Перенастройка
	Допустим Я открываю навигационную ссылку "e1cib/list/Справочник.УчетныеЗаписиЭлектроннойПочты"
	Тогда открылось окно 'Учетные записи электронной почты'
	Когда в таблице "Список" я перехожу к строке:
		| 'Адрес электронной почты' | 'Наименование'          |
		| 'testaccount@localhost'   | 'testaccount@localhost' |
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'testaccount@localhost (Учетная запись электронной почты)'

	Когда я нажимаю на кнопку 'Перенастроить...'
	Тогда открылось окно 'Настройка учетной записи электронной почты'
	И я нажимаю на кнопку 'Отмена'

Сценарий: Добавить учетную запись для проверки признака 'Недействителен'
	Допустим Я добавляю учетную запись "inactive@localhost"	

Сценарий: Проверить функциональность признака 'Недействителен'
	Допустим Я открываю навигационную ссылку "e1cib/list/Справочник.УчетныеЗаписиЭлектроннойПочты"
	И открылось окно 'Учетные записи электронной почты'
	И в таблице "Список" я перехожу к строке:
	| Наименование       |
	| inactive@localhost |
	И в таблице "Список" я выбираю текущую строку

	Когда открылось окно 'inactive@localhost (Учетная запись электронной почты)'
	И я разворачиваю группу "Прочие настройки"
	Тогда я устанавливаю флаг 'Недействителен'
	И я нажимаю на кнопку 'Записать и закрыть'
	И я жду закрытия окна 'inactive@localhost (Учетная запись электронной почты) *' в течение 20 секунд

	Когда открылось окно 'Учетные записи электронной почты'
	Тогда в таблице "Список" 0 строк, у которых колонка "Наименование" "Равно" "inactive@localhost"

	Когда я нажимаю на кнопку 'Показывать недействительных'
	Тогда в таблице "Список" 1 строк, у которых колонка "Наименование" "Равно" "inactive@localhost"

	Допустим В командном интерфейсе я выбираю 'CRM' 'Письма'
	Тогда открылось окно 'События: электронные письма'
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	И открылось окно 'Исходящее письмо  (создание)'
	И я нажимаю кнопку выбора у поля "Учетная запись"

	Когда открылось окно 'Учетные записи электронной почты'
	Тогда в таблице "Список" 0 строк, у которых колонка "Наименование" "Равно" "inactive@localhost"

	Когда я нажимаю на кнопку 'Показывать недействительных'
	Тогда в таблице "Список" 1 строк, у которых колонка "Наименование" "Равно" "inactive@localhost"
