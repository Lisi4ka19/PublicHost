#language: ru

@tree
@EmptyIB

Функциональность: Изменение типа структурной единицы

Как пользователь УНФ
Я хочу изменять тип структурной единицы
Чтобы вести учет в в различных разрезах

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Подготовить настройки для изменения типа структурной единицы

	Допустим Я устанавливаю склад "Основной склад" как основной
	И Я удаляю все элементы Справочника "СтруктурныеЕдиницы"

	Когда В командном интерфейсе я выбираю 'Компания' 'Еще больше возможностей'
	И открылось окно 'Больше возможностей: настройка программы'
	Тогда я устанавливаю флаг 'Несколько подразделений'

	Когда в таблице "ДеревоРазделов" я перехожу к строке:
		| Представление |
		| Продажи       |
	И я перехожу к закладке "Продажи"
	И я устанавливаю флаг 'Розничные продажи'
	Тогда флаг 'Розничные продажи' равен "Да"

	Когда в таблице "ДеревоРазделов" я перехожу к строке:
		| Представление |
		| Закупки       |
	И я перехожу к закладке "Закупки"
	И я снимаю флаг 'Несколько складов'
	Тогда флаг "Несколько складов" равен "Нет"

	Затем Я закрываю текущее окно

Сценарий: Установить тип склада 'Розница'

	Когда В командном интерфейсе я выбираю 'Компания' 'Склады'
	И открылось окно 'Склады'
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Основной склад (Организационно-структурная единица компании)'

	Когда я нажимаю на кнопку 'Разрешить редактирование реквизитов'
	И открылось окно 'Разрешение редактирования реквизитов'
	Тогда я нажимаю на кнопку 'Проверить и разрешить'

	Когда открылось окно 'Разрешение редактирования реквизитов'
	И я нажимаю на кнопку 'Разрешить редактирование'
	Тогда открылось окно 'Основной склад (Организационно-структурная единица компании) *'

	Когда из выпадающего списка "Тип" я выбираю точное значение 'Розница'
	И я нажимаю кнопку выбора у поля "Розничный вид цен"
	И открылось окно 'Виды цен (колонки прайс-листов)'
	И я нажимаю на кнопку с именем 'ФормаВыбрать'
	Тогда открылось окно 'Основной склад (Организационно-структурная единица компании) *'
	
	Когда я нажимаю на кнопку 'Записать и закрыть'
	Тогда не появилось окно предупреждения системы

Сценарий: Установить тип склада 'Подразделение'

	Когда В командном интерфейсе я выбираю 'Компания' 'Склады'
	И открылось окно 'Склады'
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Основной склад (Организационно-структурная единица компании)'

	Когда я нажимаю на кнопку 'Разрешить редактирование реквизитов'
	И открылось окно 'Разрешение редактирования реквизитов'
	Тогда я нажимаю на кнопку 'Проверить и разрешить'

	Когда открылось окно 'Разрешение редактирования реквизитов'
	И я нажимаю на кнопку 'Разрешить редактирование'
	Тогда открылось окно 'Основной склад (Организационно-структурная единица компании) *'

	Затем из выпадающего списка "Тип" я выбираю точное значение 'Подразделение'
	
	Когда я нажимаю на кнопку 'Записать и закрыть'
	Тогда не появилось окно предупреждения системы

Сценарий: Установить тип склада 'Склад'

	Когда В командном интерфейсе я выбираю 'Компания' 'Подразделения'
	И открылось окно 'Подразделения'
	И в таблице "Список" я перехожу к строке
		| Наименование   |
		| Основной склад |
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Основной склад (Организационно-структурная единица компании)'

	Когда я нажимаю на кнопку 'Разрешить редактирование реквизитов'
	И открылось окно 'Разрешение редактирования реквизитов'
	Тогда я нажимаю на кнопку 'Проверить и разрешить'

	Когда открылось окно 'Разрешение редактирования реквизитов'
	И я нажимаю на кнопку 'Разрешить редактирование'
	Тогда открылось окно 'Основной склад (Организационно-структурная единица компании) *'
	
	Затем из выпадающего списка "Тип" я выбираю точное значение 'Склад'

	И я нажимаю на кнопку 'Записать и закрыть'
	Тогда не появилось окно предупреждения системы
