#language: ru

Функциональность: Создание карточки банка

Как пользователь УНФ
Я хочу быстро и удобно создавать карточку банка
Чтобы настраивать реквизиты расчетных счетов

Контекст:
	Допустим Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Создание новой карточки банка из классификатора
	Допустим Я закрыл все окна клиентского приложения
	И В командном интерфейсе я выбираю 'Компания' 'Все справочники'

	Когда открылось окно 'Справочники'
	И я нажимаю на кнопку 'Банки'
	Тогда открылось окно 'Банки'

	Когда я нажимаю на кнопку с именем 'ФормаСоздать'
	И открылось окно '1С:Предприятие'
	Тогда я нажимаю на кнопку 'Да'

	Когда открылось окно 'Банки'
	И в таблице  "Список" я перехожу на один уровень вниз
	И в таблице "Список" я выбираю текущую строку
	Тогда не появилось окно предупреждения системы

Сценарий: Поиск банка по SWIFT
	Допустим Я закрыл все окна клиентского приложения
	И В командном интерфейсе я выбираю 'Компания' 'Все справочники'

	Когда открылось окно 'Справочники'
	И я нажимаю на кнопку 'Банки'
	Тогда открылось окно 'Банки'

	Когда я нажимаю на кнопку с именем 'ФормаСоздать'
	И открылось окно '1С:Предприятие'
	Тогда я нажимаю на кнопку 'Нет'

	Когда открылось окно 'Банк (создание)'
	И в поле 'Наименование' я ввожу текст 'JPMORGAN CHASE BANK, N.A.'
	И в поле 'SWIFT' я ввожу текст 'CHASUS33'
	И я перехожу к следующему реквизиту
	И я нажимаю на кнопку 'Записать и закрыть'
	И я жду закрытия окна 'Банк (создание)' в течение 20 секунд
