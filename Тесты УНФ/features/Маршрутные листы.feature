#language: ru

@Tree

Функциональность: Маршрутные листы

Как пользователь УНФ
Я хочу отражать факт передачи заказов курьеру или службе доставки
Чтобы управлять доставкой

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Заказ на доставку
	Дано В командном интерфейсе я выбираю 'Продажи' 'Заказы покупателей'
	И открылось окно 'Заказы покупателей'
	И я нажимаю на кнопку с именем 'ФормаСоздать'

	Затем Я выбираю покупателя
		Когда открылось окно 'Заказ покупателя (создание)'
		И я нажимаю кнопку выбора у поля "Покупатель"
		Тогда открылось окно 'Контрагенты: Покупатели'
		И я нажимаю на кнопку с именем 'Выбрать'

	Затем Я заполняю шапку заказа
		Когда открылось окно 'Заказ покупателя (создание) *'
		И из выпадающего списка "СостояниеЗаказа" я выбираю точное значение '6. На складе'
		И в поле 'Отгрузка' я ввожу текущую дату

	Затем я заполняю табличную часть заказа
		Когда я нажимаю на кнопку с именем 'ЗапасыДобавить'
		И в таблице "Запасы" я нажимаю кнопку выбора у реквизита "Номенклатура"
		Тогда открылось окно 'Номенклатура'
		И в таблице "СписокЗапасы" я выбираю текущую строку
	
	Затем я заполняю поля на закладке 'Доставка'
		Когда открылось окно 'Заказ покупателя (создание) *'
		И я перехожу к закладке "Доставка"
		И я меняю значение переключателя 'Способ' на 'Курьер'
		И я нажимаю кнопку выбора у поля "Служба доставки"
		Тогда открылось окно 'Службы доставки'
		И в таблице "Список" я перехожу к строке:
		| 'Наименование'                 |
		| 'Доставка собственными силами' |
		И я нажимаю на кнопку с именем 'ФормаВыбрать'

	Затем я указываю курьера
		Когда открылось окно 'Заказ покупателя (создание) *'
		И я нажимаю кнопку выбора у поля "Курьер"
		Тогда открылось окно 'Физические лица'
		И я нажимаю на кнопку с именем 'ФормаВыбрать'

	Затем я указываю стоимость доставки
		Когда открылось окно 'Заказ покупателя (создание) *'
		Тогда в поле 'Стоимость' я ввожу текст '456,00'

	Когда я нажимаю на кнопку 'Провести и закрыть'
	Тогда не появилось окно предупреждения системы
	И я жду закрытия окна 'Заказ покупателя (создание) *' в течение 20 секунд

Сценарий: Маршрутный лист
	Дано В командном интерфейсе я выбираю 'Продажи' 'Маршрутные листы'
	Тогда открылось окно 'Маршрутные листы'
	И я нажимаю на кнопку с именем 'ФормаСоздать'

	Когда открылось окно 'Маршрутный лист (создание)'
	И я нажимаю кнопку выбора у поля с именем "Курьер"
	Тогда открылось окно 'Физические лица'
	И я нажимаю на кнопку с именем 'ФормаВыбрать'

	Затем в таблице "Заказы" я изменяю флаг 'Принять в работу'
	И в таблице "Заказы" я завершаю редактирование строки
	
	Когда я нажимаю на кнопку 'Провести и закрыть'
	Тогда не появилось окно предупреждения системы
	И я жду закрытия окна 'Маршрутный лист (создание) *' в течение 20 секунд
