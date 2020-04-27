#language: ru
@Email
@tree

Функциональность: Заголовок отчета в рассылке

Как пользователь УНФ
Я хочу видеть в заголовке отчета период
Чтобы понимать за какой период сформирована рассылка

Контекст:
	Допустим Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Подготовить данные для сценария
	Дано Я добавляю поставщика "Контрагент для рассылки отчетов"
	И я добавляю учетную запись "bulkreport@localhost"

Сценарий: Настройка рассылки отчета Продажи
	Допустим Я закрыл все окна клиентского приложения
	И Я открываю навигационную ссылку "e1cib/list/Справочник.РассылкиОтчетов"
	
	Когда открылось окно 'Рассылки отчетов'
	Тогда я нажимаю на кнопку с именем 'ФормаСоздать'

	Когда открылось окно 'Рассылка отчетов (создание)'
	Тогда в поле 'Наименование' я ввожу текст 'Продажи за вчера'
	И из выпадающего списка "Отправлять" я выбираю точное значение 'Отчеты указанным получателям'
	И из выпадающего списка "Получатели" я выбираю точное значение 'Контрагенты'

	Когда в таблице "Отчеты" я нажимаю на кнопку 'Подобрать'
	И открылось окно 'Отчеты'
	И в таблице "Список" я перехожу к строке:
		| Наименование |
		| Продажи      |
	И в таблице "Список" я выбираю текущую строку
	Тогда Я закрываю окно 'Отчеты'

	Когда открылось окно 'Рассылка отчетов *'
	Тогда в таблице "ПользовательскиеНастройки" я перехожу к строке
		| Настройка |
		| Период   |
	И в таблице "ПользовательскиеНастройки" я нажимаю кнопку выбора у реквизита "Значение"

	Когда открылось окно 'Выберите период'
	И я нажимаю на кнопку 'День'
	И в таблице "PeriodVariantTable" я перехожу к строке:
		| Значение |
		| Вчера    |
	Тогда в таблице "PeriodVariantTable" я выбираю текущую строку

	Когда открылось окно 'Рассылка отчетов (создание) *'
	Тогда в таблице "ПользовательскиеНастройки" я перехожу к строке:
		| Настройка          |
		| Выводить заголовок |
	И в таблице "ПользовательскиеНастройки" из выпадающего списка с именем "ПользовательскиеНастройкиЗначение" я выбираю точное значение 'Да'
	И в таблице "ПользовательскиеНастройки" я завершаю редактирование строки

	Когда я перехожу к закладке "Доставка (эл. почта)"
	Тогда я нажимаю на гиперссылку "ПолучателиРассылки"

	Когда открылось окно 'Получатели рассылки *'
	И в таблице "Получатели" я нажимаю на кнопку 'Подобрать'
	Тогда открылось окно 'Контрагенты'
	И в таблице "Список" я перехожу к строке:
		| Представление                  |
		| Контрагент для рассылки отчетов |
	И в таблице "Список" я выбираю текущую строку
	И Я закрываю окно 'Контрагенты'

	Когда открылось окно 'Получатели рассылки (Продажи за вчера)'
	Тогда я нажимаю на кнопку 'ОК'

	Когда открылось окно 'Рассылка отчетов (создание) *'
	Тогда я нажимаю кнопку выбора у поля "От"

	Когда открылось окно 'Учетные записи электронной почты'
	Тогда в таблице "Список" я перехожу к строке:
		| Наименование         |
		| bulkreport@localhost |
	И в таблице "Список" я выбираю текущую строку

	Когда я перехожу к закладке "Отчеты (1)"
	Тогда в таблице "Отчеты" я нажимаю на кнопку с именем 'ОтчетыСформироватьОтчет'

	Когда открылось окно 'Продажи'
	И я жду когда в табличном документе "ОтчетТабличныйДокумент" заполнится ячейка "R1C1" в течение 120 секунд
	Тогда область "R1C1:R1C1" табличного документа "ОтчетТабличныйДокумент" равна по шаблону:
		| Продажи за * |
	И Я закрываю окно 'Продажи'

	Когда открылось окно 'Рассылка отчетов (создание) *'
	И я перехожу к закладке "Дополнительно"
	И я нажимаю кнопку очистить у поля "Форматы сохранения отчетов (по умолчанию)"
	И я снимаю флаг 'Архивировать в ZIP:'
	И я устанавливаю флаг 'Отправлять письма через скрытые копии'
	И в таблице "ФорматыОтчетов" я активизирую поле "Отправлять пустой"
	И в таблице "ФорматыОтчетов" я устанавливаю флаг 'Отправлять пустой'
	Тогда я нажимаю на кнопку 'Выполнить сейчас'
	
	Когда открылось окно 'Продажи за вчера (Рассылка отчетов)'
	И я нажимаю на кнопку с именем 'КомандаСобытияРассылки'
	Тогда открылось окно 'Журнал регистрации'

	Когда я перехожу к закладке "Журнал регистрации"
	И я жду, что в таблице "Журнал" количество строк будет "больше" 0 в течение 20 секунд
	И в таблице "Журнал" я перехожу к последней строке
	Тогда в таблице "Журнал" поле "Событие" имеет значение "Сеанс. Завершение"

Сценарий: Проверка заголовка отчета во вложении электронного письма
	Допустим пользователь IMAP 'contractor@localhost'
	И в ящике 'INBOX' есть сообщения
	И темой сообщения 'Продажи за'
	Предлог "за" в тексте вложения как индикатор правильного встраивания рассылки отчетов
		И текстом вложения сообщения 'Продажи за'
