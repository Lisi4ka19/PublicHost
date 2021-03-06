#language: ru

@tree
@ExportScenarios
@IgnoreOnCIMainBuild

Функциональность: Прикладные сценарии

Как разработчик тестовых сценариев для УНФ
Я хочу организовать библиотеку операций
Чтобы структурировать основные сценарии

Сценарий: Я добавляю покупателя "НаименованиеПокупателя"
	Дано В командном интерфейсе я выбираю 'Продажи' 'Покупатели'
	И открылось окно 'Контрагенты: Покупатели'

	Когда я нажимаю на кнопку с именем 'Создать'
	Тогда открылось окно 'Контрагент (создание)'
	И в поле 'НаименованиеКонтакт_0' я ввожу текст "НаименованиеПокупателя"
	И в поле 'ПредставлениеКонтакт_0_КИ_1' я ввожу текст 'contact@localhost'
	И в поле 'ПредставлениеКИ_1' я ввожу текст 'customer@localhost'
	И я нажимаю на кнопку 'Записать и закрыть'
	И я жду закрытия окна 'Контрагент (создание)' в течение 20 секунд
Сценарий: Я добавляю покупателя без контакта "НаименованиеПокупателя"
	Дано В командном интерфейсе я выбираю 'Продажи' 'Покупатели'
	И открылось окно 'Контрагенты: Покупатели'

	Когда я нажимаю на кнопку с именем 'Создать'
	Тогда открылось окно 'Контрагент (создание)'
	И в поле 'НаименованиеПолное' я ввожу текст "НаименованиеПокупателя"
	И в поле 'ПредставлениеКИ_1' я ввожу текст 'customer@localhost'
	И я нажимаю на кнопку 'Записать и закрыть'
	И я жду закрытия окна 'Контрагент (создание)' в течение 20 секунд
Сценарий: Я добавляю поставщика "НаименованиеПоставщика"
	Дано В командном интерфейсе я выбираю 'Закупки' 'Поставщики'
	И открылось окно 'Контрагенты: Поставщики'

	Когда я нажимаю на кнопку с именем 'Создать'
	Тогда открылось окно 'Контрагент (создание)'
	И в поле 'В программе' я ввожу текст "НаименованиеПоставщика"
	И в поле 'ПредставлениеКИ_1' я ввожу текст 'contractor@localhost'
	И я нажимаю на кнопку 'Записать и закрыть'
	И я жду закрытия окна 'Контрагент (создание)' в течение 20 секунд

Сценарий: Я добавляю номенклатуру "НаименованиеНоменклатуры"
	Дано В командном интерфейсе я выбираю 'Продажи' 'Номенклатура'
	И открылось окно 'Номенклатура'
	
	Когда я нажимаю на кнопку с именем 'СоздатьНоменклатуру'
	Тогда открылось окно 'Номенклатура (создание)'
	И в поле 'Тип' я ввожу текст 'Запас'
	И в поле 'Наименование' я ввожу текст "НаименованиеНоменклатуры"
	И я нажимаю на кнопку 'Записать и закрыть'
	И я жду закрытия окна 'Номенклатура (создание)' в течение 20 секунд

Сценарий: Я добавляю номенклатуру с серийными номерами "НаименованиеНоменклатуры"
	Дано В командном интерфейсе я выбираю 'Продажи' 'Номенклатура'
	И открылось окно 'Номенклатура'
	
	Когда я нажимаю на кнопку с именем 'СоздатьНоменклатуру'
	Тогда открылось окно 'Номенклатура (создание)'
	И в поле 'Тип' я ввожу текст 'Запас'
	И в поле 'Наименование' я ввожу текст "НаименованиеНоменклатуры"
	И я нажимаю на кнопку 'Записать'

	Когда В текущем окне я нажимаю кнопку командного интерфейса 'Серийные номера'
	Тогда я устанавливаю флаг 'Использовать серийные номера'
	
	Когда В текущем окне я нажимаю кнопку командного интерфейса 'Основное'
	Тогда я нажимаю на кнопку 'Записать и закрыть'
	И я жду закрытия окна 'Номенклатура (создание)' в течение 20 секунд

Сценарий: Я создаю номенклатуру "НаименованиеНоменклатуры"
	Дано В командном интерфейсе я выбираю 'Продажи' 'Номенклатура'
	И открылось окно 'Номенклатура'
	
	Когда я нажимаю на кнопку с именем 'СоздатьНоменклатуру'
	Тогда открылось окно 'Номенклатура (создание)'
	И в поле 'Тип' я ввожу текст 'Запас'
	И в поле 'Наименование' я ввожу текст "НаименованиеНоменклатуры"
	
Сценарий: Я устанавливаю штрихкод "ПараметрШтрихкод" для номенклатуры "НаименованиеНоменклатуры"
	Дано В командном интерфейсе я выбираю 'Продажи' 'Номенклатура'
	И открылось окно 'Номенклатура'
	
	Когда в таблице "СписокЗапасы" я перехожу к строке
		| Наименование               |
		| "НаименованиеНоменклатуры" |
	Тогда в таблице "СписокЗапасы" я выбираю текущую строку

	Когда открылось окно '* (Номенклатура)'
	Тогда В текущем окне я нажимаю кнопку командного интерфейса 'Штрихкоды номенклатуры'
	И Я нажимаю на кнопку 'Создать'

	Когда открылось окно 'Штрихкоды номенклатуры (создание)'
	Тогда в поле 'Штрихкод' я ввожу текст "ПараметрШтрихкод"
	И я нажимаю на кнопку 'Записать и закрыть'
	И я жду закрытия окна 'Штрихкоды номенклатуры (создание) *' в течение 20 секунд

Сценарий: Я добавляю услугу "НаименованиеУслуги"
	Дано В командном интерфейсе я выбираю 'Продажи' 'Номенклатура'
	И открылось окно 'Номенклатура'
	
	Когда я нажимаю на кнопку с именем 'СоздатьНоменклатуру'
	Тогда открылось окно 'Номенклатура (создание)'
	И в поле 'Тип' я ввожу текст 'Услуга'
	И в поле 'Наименование' я ввожу текст "НаименованиеУслуги"
	И я нажимаю на кнопку 'Записать и закрыть'
	И я жду закрытия окна 'Номенклатура (создание)' в течение 20 секунд

Сценарий: Я создаю новый акт выполненных работ
	Дано В командном интерфейсе я выбираю 'Продажи' 'Акты выполненных работ'
	И открылось окно 'Акты выполненных работ'

	Когда я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно 'Акт выполненных работ (создание)'

Сценарий: Я создаю новый заказ покупателя
	Дано В командном интерфейсе я выбираю 'Продажи' 'Заказы покупателей'
	И открылось окно 'Заказы покупателей'

	Когда я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно 'Заказ покупателя (создание)'
	И в поле "Отгрузка" я ввожу текущую дату

Сценарий: Я выбираю покупателя "НаименованиеПокупателя"
	Когда я нажимаю кнопку выбора у поля "Покупатель"
	Тогда открылось окно 'Контрагенты: Покупатели'

	Когда в таблице "Список" я перехожу к строке
		| Представление            |
		| "НаименованиеПокупателя" |
	И в таблице "Список" я выбираю текущую строку
	
Сценарий: Я устанавливаю НДС в том числе
	Когда я нажимаю на гиперссылку "ЦеныИВалюта"
	И открылось окно 'Цены и валюта'
	И из выпадающего списка "Налоги" я выбираю точное значение 'Облагается (с НДС)'
	И я устанавливаю флаг 'Сумма включает НДС'
	Тогда я нажимаю на кнопку 'ОК'

Сценарий: Я устанавливаю НДС сверху
	Когда я нажимаю на гиперссылку "ЦеныИВалюта"
	И открылось окно 'Цены и валюта'
	И из выпадающего списка "Налоги" я выбираю точное значение 'Облагается (с НДС)'
	И я снимаю флаг 'Сумма включает НДС'
	Тогда я нажимаю на кнопку 'ОК'

Сценарий: В таблице "ТаблицаЗапасы" по кнопке "ЗапасыДобавить" я добавляю позицию "ЗапасыНоменклатура" без параметров
	Когда я нажимаю на кнопку с именем "ЗапасыДобавить"
	Тогда в таблице "ТаблицаЗапасы" я нажимаю кнопку выбора у реквизита "Номенклатура"

	Когда открылось окно 'Номенклатура'
	И я разворачиваю группу "Фильтры"
	И я снимаю флаг 'Остатки'
	И я меняю значение переключателя 'ОтборКатегорииИерархияПереключатель' на 'Иерархия'
	И в таблице 'ОтборИерархия' я перехожу к строке:
	| Представление  |
	| "<Все группы>" |
	И в таблице "СписокЗапасы" я перехожу к строке:
		| Наименование         |
		| "ЗапасыНоменклатура" |
	Тогда в таблице "СписокЗапасы" я выбираю текущую строку

Сценарий: В таблице "ТаблицаЗапасы" по кнопке "ЗапасыДобавить" я добавляю позицию "ЗапасыНоменклатура" "ЗапасыКоличество" "ЗапасыЦена" "ЗапасыСкидка"
	Когда я нажимаю на кнопку с именем "ЗапасыДобавить"
	Тогда в таблице "ТаблицаЗапасы" я нажимаю кнопку выбора у реквизита "Номенклатура"

	Когда открылось окно 'Номенклатура'
	И я разворачиваю группу "Фильтры"
	И я снимаю флаг 'Остатки'
	И я меняю значение переключателя 'ОтборКатегорииИерархияПереключатель' на 'Иерархия'
	И в таблице 'ОтборИерархия' я перехожу к строке:
	| Представление  |
	| "<Все группы>" |
	И в таблице "СписокЗапасы" я перехожу к строке:
		| Наименование         |
		| "ЗапасыНоменклатура" |
	Тогда в таблице "СписокЗапасы" я выбираю текущую строку

	Когда я перехожу к следующему реквизиту
	И в таблице "ТаблицаЗапасы" в поле 'Количество' я ввожу текст "ЗапасыКоличество"
	И в таблице "ТаблицаЗапасы" в поле 'Цена' я ввожу текст "ЗапасыЦена"
	И в таблице "ТаблицаЗапасы" в поле '% Скидки' я ввожу текст "ЗапасыСкидка"
	Тогда в таблице "ТаблицаЗапасы" я завершаю редактирование строки

Сценарий: В таблице "ТаблицаЗапасы" по кнопке "ЗапасыДобавить" я добавляю позицию "ЗапасыНоменклатура" с характеристикой "ЗапасыХарактеристика" "ЗапасыЦена"
	Когда я нажимаю на кнопку с именем "ЗапасыДобавить"
	Тогда в таблице "ТаблицаЗапасы" я нажимаю кнопку выбора у реквизита "Номенклатура"

	Когда открылось окно 'Номенклатура'
	И я разворачиваю группу "Фильтры"
	И я снимаю флаг 'Остатки'
	И я меняю значение переключателя 'ОтборКатегорииИерархияПереключатель' на 'Иерархия'
	И в таблице 'ОтборИерархия' я перехожу к строке:
	| Представление  |
	| "<Все группы>" |
	И в таблице "СписокЗапасы" я перехожу к строке:
		| Наименование         |
		| "ЗапасыНоменклатура" |
	Тогда в таблице "СписокЗапасы" я выбираю текущую строку

	И в таблице "ТаблицаЗапасы" я активизирую поле "Характеристика"
	И в таблице "ТаблицаЗапасы" в поле 'Характеристика' я ввожу текст "ЗапасыХарактеристика"
	И в таблице "ТаблицаЗапасы" в поле 'Цена' я ввожу текст "ЗапасыЦена"
	Тогда в таблице "ТаблицаЗапасы" я завершаю редактирование строки

Сценарий: Я указываю стоимость доставки в заказе покупателя "СтоимостьДоставки"
	Дано открылось окно 'Заказ покупателя *'

	Когда я перехожу к закладке "Доставка"
	И я меняю значение переключателя 'Способ' на 'Курьер'
	И из выпадающего списка "Служба доставки" я выбираю точное значение "Доставка собственными силами"
	Тогда я нажимаю кнопку выбора у поля "Услуга"

	Когда открылось окно 'Номенклатура'
	И я разворачиваю группу "Фильтры"
	И я снимаю флаг 'Остатки'
	И я меняю значение переключателя 'ОтборКатегорииИерархияПереключатель' на 'Иерархия'
	И в таблице 'ОтборИерархия' я перехожу к строке:
	| Представление  |
	| "<Все группы>" |
	И в таблице "СписокЗапасы" я перехожу к строке:
		| Наименование |
		| Доставка     |
	Тогда в таблице "СписокЗапасы" я выбираю текущую строку
	Тогда в поле 'Стоимость' я ввожу текст "СтоимостьДоставки"

Сценарий: Я указываю стоимость доставки "СтоимостьДоставки"
	Когда я перехожу к закладке "Доставка"
	Тогда я нажимаю кнопку выбора у поля "Услуга"

	Когда открылось окно 'Номенклатура'
	И я разворачиваю группу "Фильтры"
	И я меняю значение переключателя 'ОтборКатегорииИерархияПереключатель' на 'Иерархия'
	И в таблице 'ОтборИерархия' я перехожу к строке:
	| Представление  |
	| "<Все группы>" |
	И в таблице "СписокЗапасы" я перехожу к строке:
		| Наименование |
		| Доставка     |
	Тогда в таблице "СписокЗапасы" я выбираю текущую строку
	Тогда в поле 'Стоимость доставки' я ввожу текст "СтоимостьДоставки"

Сценарий: Я создаю новый заказ поставщику
	Дано В командном интерфейсе я выбираю 'Закупки' 'Заказы поставщикам'
	И открылось окно 'Заказы поставщикам'

	Когда я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно 'Заказ поставщику (создание)'
	И в поле 'Поступление' я ввожу текущую дату

Сценарий: Я создаю новую приходную накладную
	Дано В командном интерфейсе я выбираю 'Закупки' 'Приходные накладные'
	И открылось окно 'Приходные накладные'

	Когда я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно 'Приходная накладная (создание)'

Сценарий: Я выбираю поставщика "НаименованиеПоставщика"
	Когда я нажимаю кнопку выбора у поля "Поставщик"
	Тогда открылось окно 'Контрагенты: Поставщики'

	Когда в таблице "Список" я перехожу к строке
		| Представление            |
		| "НаименованиеПоставщика" |
	И в таблице "Список" я выбираю текущую строку

Сценарий: Я создаю новый заказ-наряд
	Дано В командном интерфейсе я выбираю 'Работы' 'Заказ-наряды'
	И открылось окно 'Заказ-наряды'

	Когда я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно 'Заказ-наряд (создание)'

	Когда я нажимаю на кнопку с именем 'ШапкаТабличнаяЧасть'
	Тогда открылось окно 'Шапка / табличная часть'
	И я изменяю флаг 'Использовать товары'
	И я нажимаю на кнопку 'ОК'

Сценарий: Я включаю Корректировки поступлений
	Дано В командном интерфейсе я выбираю 'Закупки' 'Еще больше возможностей'
	И открылось окно 'Больше возможностей: настройка программы'

	Когда я устанавливаю флаг 'Корректировки поступлений'
	Тогда не появилось окно предупреждения системы
	И Я закрываю окно 'Больше возможностей: настройка программы'

Сценарий: Я включаю Корректировки реализаций
	Дано В командном интерфейсе я выбираю 'Продажи' 'Еще больше возможностей'
	И открылось окно 'Больше возможностей: настройка программы'

	Когда я устанавливаю флаг 'Корректировки реализаций'
	Тогда не появилось окно предупреждения системы
	И Я закрываю окно 'Больше возможностей: настройка программы'

Сценарий: Я включаю Несколько валют
	Дано В командном интерфейсе я выбираю 'Деньги' 'Еще больше возможностей'
	И открылось окно 'Больше возможностей: настройка программы'

	Когда я устанавливаю флаг 'Несколько валют'
	Тогда не появилось окно предупреждения системы
	И пауза 1
	И Я закрываю окно 'Больше возможностей: настройка программы'

Сценарий: Я добавляю валюту "НаименованиеВалюты" и устанавливаю курс "КурсВалюты"
	Дано В командном интерфейсе я выбираю 'Деньги' 'Валюты'
	И открылось окно 'Валюты'

	Когда я нажимаю на кнопку с именем 'ДобавитьВалюту'
	Тогда открылось окно 'Подбор валют из классификатора'

	Когда в таблице "СписокВалют" я перехожу к строке:
		| Представление        |
		| "НаименованиеВалюты" |
	Тогда в таблице "СписокВалют" я выбираю текущую строку

	Когда открылось окно 'Валюты'
	Тогда в таблице "Валюты" я выбираю текущую строку

	Когда открылось окно 'USD (Валюта)'
	И В текущем окне я нажимаю кнопку командного интерфейса 'Курсы валют'
	Тогда я нажимаю на кнопку с именем 'ФормаСоздать'

	Когда открылось окно 'Курс валюты (создание)'
	Тогда в поле 'Курс' я ввожу текст "КурсВалюты"

	Когда я нажимаю на кнопку 'Записать и закрыть'
	Тогда я жду закрытия окна 'Курс валюты (создание) *' в течение 20 секунд

Сценарий: Я создаю новую расходную накладную
	Дано В командном интерфейсе я выбираю 'Продажи' 'Расходные накладные'
	И открылось окно 'Расходные накладные'

	Когда я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно 'Расходная накладная (создание)'

Сценарий: Я создаю новый счет на оплату
	Дано В командном интерфейсе я выбираю 'Продажи' 'Счета на оплату'
	И открылось окно 'Счета на оплату'

	Когда я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно 'Счет на оплату (создание)'

Сценарий: Я включаю ордерные склады
	Дано В командном интерфейсе я выбираю 'Закупки' 'Еще больше возможностей'
	И открылось окно 'Больше возможностей: настройка программы'
	Когда я устанавливаю флаг 'Ордерные склады'
	Тогда Я закрываю окно 'Больше возможностей: настройка программы'

Сценарий: Я добавляю склад "НаименованиеСклада"
	Дано В командном интерфейсе я выбираю 'Компания' 'Склады'
	И открылось окно 'Склады'

	Когда я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно 'Организационно-структурная единица компании (создание)'
	И в поле 'Наименование' я ввожу текст "НаименованиеСклада"
	И я нажимаю на кнопку 'Записать и закрыть'
	И я жду закрытия окна 'Организационно-структурная единица компании (создание)' в течение 20 секунд

Сценарий: Я добавляю ордерный склад "ОрдерныйСклад"
	Дано В командном интерфейсе я выбираю 'Компания' 'Склады'
	И открылось окно 'Склады'

	Когда я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно 'Организационно-структурная единица компании (создание)'
	И в поле 'Наименование' я ввожу текст "ОрдерныйСклад"
	И я устанавливаю флаг 'Ордерный'
	И я нажимаю на кнопку 'Записать и закрыть'
	И я жду закрытия окна 'Организационно-структурная единица компании (создание)' в течение 20 секунд

Сценарий: Я выбираю склад "НаименованиеСклада"
	Когда я нажимаю кнопку выбора у поля "Склад"
	Тогда открылось окно 'Склады'

	Когда в таблице "Список" я перехожу к строке:
		| Наименование         |
		| "НаименованиеСклада" |
	Тогда в таблице "Список" я выбираю текущую строку

Сценарий: Я устанавливаю склад "НаименованиеСклада" как основной
	Дано В командном интерфейсе я выбираю 'Компания' 'Склады'
	И открылось окно 'Склады'

	Когда в таблице "Список" я перехожу к строке:
		| Наименование         |
		| "НаименованиеСклада" |
	Тогда я нажимаю на кнопку 'Использовать как основной склад'

Сценарий: В таблице "ТаблицаЗапасы" в поле "Номенклатура" я выбираю номенклатуру "НаименованиеНоменклатуры"
	Когда в таблице "ТаблицаЗапасы" я нажимаю кнопку выбора у реквизита "Номенклатура"
	Тогда открылось окно 'Номенклатура'

	Когда в таблице "СписокЗапасы" я перехожу к строке:
		| Наименование         |
		| "НаименованиеНоменклатуры" |
	Тогда в таблице "СписокЗапасы" я выбираю текущую строку

Сценарий: В таблице "ТаблицаЗапасы" в поле "Склад" я выбираю склад "НаименованиеСклада"
	Когда в таблице "ТаблицаЗапасы" я нажимаю кнопку выбора у реквизита "Склад"
	Тогда открылось окно 'Склады'

	Когда в таблице "Список" я перехожу к строке:
		| Наименование         |
		| "НаименованиеСклада" |
	Тогда в таблице "Список" я выбираю текущую строку

Сценарий: Я устанавливаю вес номенклатуры "НаименованиеНоменклатуры" равным "ВесНоменклатуры"
	Дано В командном интерфейсе я выбираю 'Продажи' 'Номенклатура'
	И открылось окно 'Номенклатура'
	И я разворачиваю группу "Фильтры"
	И я снимаю флаг 'Остатки'
	И я меняю значение переключателя 'ОтборКатегорииИерархияПереключатель' на 'Иерархия'
	И в таблице 'ОтборИерархия' я перехожу к строке:
	| Представление  |
	| "<Все группы>" |
	И в таблице "СписокЗапасы" я перехожу к строке:
		| Наименование               |
		| "НаименованиеНоменклатуры" |
	Тогда в таблице "СписокЗапасы" я выбираю текущую строку

	Когда открылось окно "*(Номенклатура)"
	Тогда в поле 'Вес (кг)' я ввожу текст "ВесНоменклатуры"
	
	Когда я нажимаю на кнопку 'Записать и закрыть'
	Тогда я жду закрытия окна '* (Номенклатура)' в течение 20 секунд

Сценарий: Я добавляю учетную запись "УчетнаяЗапись"
	Допустим Я открываю навигационную ссылку "e1cib/list/Справочник.УчетныеЗаписиЭлектроннойПочты"
	Тогда открылось окно 'Учетные записи электронной почты'

	Когда я нажимаю на кнопку с именем 'ФормаСоздать'
	И открылось окно 'Создание учетной записи электронной почты'
	И в поле 'Адрес почты' я ввожу текст "УчетнаяЗапись"
	И в поле с именем 'Пароль' я ввожу текст "УчетнаяЗапись"
	И в поле 'Имя отправителя' я ввожу текст "УчетнаяЗапись"
	И я меняю значение переключателя 'Настроить' на 'Настроить параметры подключения вручную'
	И я нажимаю на кнопку 'Далее >'
	И в поле с именем 'СерверИсходящейПочты' я ввожу текст 'localhost'
	И я нажимаю на кнопку 'Далее >'
	И в поле с именем 'СерверВходящейПочты' я ввожу текст 'localhost'
	И я нажимаю на кнопку 'Далее >'
	И я нажимаю на кнопку 'Далее >'
	И я нажимаю на кнопку 'Перейти к учетной записи'

	Когда открылось окно '*(Учетная запись электронной почты)'
	И я нажимаю на кнопку 'Записать и закрыть'
	Тогда не появилось окно предупреждения системы

Сценарий: Я отключаю проверку расхождений в приходных накладных
	Дано В командном интерфейсе я выбираю 'Закупки' 'Приходные накладные'
	И открылось окно 'Приходные накладные'

	Когда я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно 'Приходная накладная (создание)'

	Когда я нажимаю на кнопку с именем 'ШапкаТабличнаяЧасть'
	И открылось окно 'Шапка / табличная часть'
	Тогда я снимаю флаг 'Проверять расхождения с входящим документом'
	И я снимаю флаг 'Проверять расхождения с заказом'
	И я нажимаю на кнопку 'Запомнить выбор'

	Когда открылось окно 'Приходная накладная (создание) *'
	Тогда флаг 'Проверять расхождения с входящим документом' равен 'Нет'
	И флаг 'Проверять расхождения с заказом' равен 'Нет'
	
	Когда Я закрываю окно 'Приходная накладная (создание) *'
	Тогда открылось окно '1С:Предприятие'
	И я нажимаю на кнопку 'Нет'

Сценарий: Я устанавливаю положение склада в документах отгрузки "ПоложениеСклада"
	Дано В командном интерфейсе я выбираю 'Продажи' 'Расходные накладные'
	И открылось окно 'Расходные накладные'

	Когда я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно 'Расходная накладная (создание)'

	Когда я нажимаю на кнопку с именем 'ШапкаТабличнаяЧасть'
	И открылось окно 'Шапка / табличная часть'
	И я меняю значение переключателя 'Положение склада в документах отгрузки' на "ПоложениеСклада"
	И я нажимаю на кнопку 'Запомнить выбор'
	Тогда открылось окно 'Расходная накладная (создание) *'

	Когда Я закрываю окно 'Расходная накладная (создание) *'
	Тогда открылось окно '1С:Предприятие'
	И я нажимаю на кнопку 'Нет'
	
Сценарий: Я устанавливаю положение склада в документах поступления "ПоложениеСклада"
	Дано В командном интерфейсе я выбираю 'Закупки' 'Приходные накладные'
	И открылось окно 'Приходные накладные'

	Когда я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно 'Приходная накладная (создание)'

	Когда я нажимаю на кнопку с именем 'ШапкаТабличнаяЧасть'
	И открылось окно 'Шапка / табличная часть'
	И я меняю значение переключателя 'Положение склада в документах поступления' на "ПоложениеСклада"
	И я нажимаю на кнопку 'Запомнить выбор'
	Тогда открылось окно 'Приходная накладная (создание) *'

	Когда Я закрываю окно 'Приходная накладная (создание) *'
	Тогда открылось окно '1С:Предприятие'
	И я нажимаю на кнопку 'Нет'

Сценарий: Я ограничиваю доступ пользователю "ИмяПользователя" в окне "ЗаголовокОкна" для профиля "НаименованиеПрофиля" по группе контрагентов "ГруппаДоступа"
	Допустим Я открываю навигационную ссылку "e1cib/list/Справочник.Пользователи"
	И открылось окно 'Пользователи'
	И в таблице "ПользователиСписок" я перехожу к строке:
		| Полное имя        |
		| "ИмяПользователя" |
	И в таблице "ПользователиСписок" я выбираю текущую строку

	Когда открылось окно "ЗаголовокОкна"
	Тогда В текущем окне я нажимаю кнопку командного интерфейса 'Права доступа'
	И в таблице "Профили" я перехожу к строке:
		| Профиль               |
		| "НаименованиеПрофиля" |
	И в таблице "ВидыДоступа" я перехожу к строке:
		| Вид доступа                     |
		| Группы контактов и контрагентов |
	И в таблице "ВидыДоступа" я выбираю текущую строку
	И в таблице "ВидыДоступа" из выпадающего списка "Значения доступа" я выбираю точное значение 'Все запрещены'
	И в таблице "ВидыДоступа" я завершаю редактирование строки
	И в таблице "ЗначенияДоступа" я нажимаю на кнопку с именем 'ЗначенияДоступаДобавить'

	Когда открылось окно 'Группы доступа контактов и контрагентов'
	И в таблице "Список" я перехожу к строке:
		| Наименование    |
		| "ГруппаДоступа" |
	Тогда я нажимаю на кнопку с именем 'ФормаВыбрать'

	Когда открылось окно "ЗаголовокОкна"
	И я нажимаю на кнопку 'Записать'
	Тогда не появилось окно предупреждения системы

Сценарий: Я устанавливаю доступ "ГруппаДоступа" контрагенту "НаименованиеКонтрагента" в окне "ЗаголовокОкна"
	Допустим Я открываю навигационную ссылку "e1cib/list/Справочник.Контрагенты"
	Тогда открылось окно 'Контрагенты'
	И в таблице "Список" я перехожу к строке:
		| Представление                 |
		| "НаименованиеКонтрагента"     |
	И в таблице "Список" я выбираю текущую строку
	
	Когда открылось окно "ЗаголовокОкна"
	Тогда из выпадающего списка "Доступ" я выбираю точное значение "ГруппаДоступа"
	И я нажимаю на кнопку 'Записать и закрыть'
	И я жду закрытия окна "ЗаголовокОкна" в течение 20 секунд

Сценарий: Я устанавливаю период отчета 'за все время'
	Когда я нажимаю на гиперссылку 'Период'
	Тогда открылось окно 'Выберите период'
	И я нажимаю на кнопку 'Очистить период'
	И я нажимаю на кнопку 'Выбрать'

Сценарий: Я отключаю вывод колонки 'Номенклатура' в отчете
	Когда я разворачиваю группу "Строки"
	Тогда я снимаю флаг 'Номенклатура, Ед.'
	
Сценарий: Я включаю автоскидку "НаименованиеАвтоскидки"
	Допустим В командном интерфейсе я выбираю 'Продажи' 'Скидки'
	Когда открылось окно 'Скидки и наценки'
	Тогда я перехожу к закладке "Автоматические скидки"
	И в таблице "АвтоматическиеСкидки" я перехожу к строке:
		| Наименование             |
		| "НаименованиеАвтоскидки" |
	И в таблице "АвтоматическиеСкидки" я выбираю текущую строку

	Когда открылось окно '*(Вид автоматической скидки, наценки)'
	Тогда я устанавливаю флаг 'Действует'
	И я нажимаю на кнопку 'Записать и закрыть'
	И я жду закрытия окна '*(Вид автоматической скидки, наценки) *' в течение 20 секунд

Сценарий: Я отключаю автоскидку "НаименованиеАвтоскидки"
	Допустим В командном интерфейсе я выбираю 'Продажи' 'Скидки'
	Когда открылось окно 'Скидки и наценки'
	Тогда я перехожу к закладке "Автоматические скидки"
	И в таблице "АвтоматическиеСкидки" я перехожу к строке:
		| Наименование             |
		| "НаименованиеАвтоскидки" |
	И в таблице "АвтоматическиеСкидки" я выбираю текущую строку

	Когда открылось окно '*(Вид автоматической скидки, наценки)'
	Тогда я снимаю флаг 'Действует'
	И я нажимаю на кнопку 'Записать и закрыть'
	И я жду закрытия окна '*(Вид автоматической скидки, наценки) *' в течение 20 секунд

Сценарий: Я включаю автоокругление "НаименованиеОкругления"
	Допустим В командном интерфейсе я выбираю 'Продажи' 'Скидки'
	Когда открылось окно 'Скидки и наценки'
	Тогда я перехожу к закладке "Округления"
	И в таблице "АвтоматическиеОкругления" я перехожу к строке:
		| Наименование             |
		| "НаименованиеОкругления" |
	И в таблице "АвтоматическиеОкругления" я выбираю текущую строку

	Когда открылось окно '*(Вид автоматической скидки, наценки)'
	Тогда я устанавливаю флаг 'Действует'
	И я нажимаю на кнопку 'Записать и закрыть'
	И я жду закрытия окна '*(Вид автоматической скидки, наценки) *' в течение 20 секунд

Сценарий: Я отключаю автоокругление "НаименованиеОкругления"
	Допустим В командном интерфейсе я выбираю 'Продажи' 'Скидки'
	Когда открылось окно 'Скидки и наценки'
	Тогда я перехожу к закладке "Округления"
	И в таблице "АвтоматическиеОкругления" я перехожу к строке:
		| Наименование             |
		| "НаименованиеОкругления" |
	И в таблице "АвтоматическиеОкругления" я выбираю текущую строку

	Когда открылось окно '*(Вид автоматической скидки, наценки)'
	Тогда я снимаю флаг 'Действует'
	И я нажимаю на кнопку 'Записать и закрыть'
	И я жду закрытия окна '*(Вид автоматической скидки, наценки) *' в течение 20 секунд

Сценарий: Я добавляю прочего контрагента "НаименованиеКонтрагента"
	Допустим В командном интерфейсе я выбираю 'Компания' 'Все справочники'
	И открылось окно 'Справочники'
	И я нажимаю на кнопку 'Контрагенты'

	Когда открылось окно 'Контрагенты'
	Тогда я нажимаю на кнопку с именем 'Создать'

	Когда открылось окно 'Контрагент (создание)'
	Тогда в поле 'В программе' я ввожу текст "НаименованиеКонтрагента"
	И в поле 'НаименованиеПолное' я ввожу текст "НаименованиеКонтрагента"
	И в поле 'ПредставлениеКИ_1' я ввожу текст 'etc@localhost'
	И я устанавливаю флаг 'Прочие отношения'
	И я нажимаю на кнопку 'Записать и закрыть'
	И я жду закрытия окна 'Контрагент (создание)' в течение 20 секунд

Сценарий: Я добавляю номер ГТД "НомерГТД"
	Допустим В командном интерфейсе я выбираю 'Компания' 'Все справочники'
	И открылось окно 'Справочники'
	И я нажимаю на кнопку 'Номера ГТД'
	
	Когда открылось окно "Номера ГТД"
	И я нажимаю на кнопку 'Создать'
	И открылось окно 'Номера ГТД (создание)'
	Тогда в поле 'Код' я ввожу текст "НомерГТД"
	И я устанавливаю флаг 'Допускается запись с ошибкой'
	И я нажимаю на кнопку 'Записать и закрыть'
	И я жду закрытия окна 'Номера ГТД (создание) *' в течение 20 секунд

Сценарий: В таблице "ТаблицаЗапасы" я выбираю страну происхождения "СтранаПроисхождения"
	Когда в таблице "ТаблицаЗапасы" я нажимаю кнопку выбора у реквизита "Страна происхождения"
	Тогда открылось окно "Страны мира"

	Когда в таблице "Список" я перехожу к строке:
		| Наименование          |
		| "СтранаПроисхождения" |
	Тогда в таблице "Список" я выбираю текущую строку

Сценарий: В таблице "ТаблицаЗапасы" я выбираю номер ГТД "НомерГТД"
	Когда в таблице "ТаблицаЗапасы" я нажимаю кнопку выбора у реквизита "Номер ГТД"
	Тогда открылось окно "Номера ГТД"

	Когда в таблице "Список" я перехожу к строке:
		| Номер ГТД  |
		| "НомерГТД" |
	Тогда в таблице "Список" я выбираю текущую строку

Сценарий: Я устанавливаю склад по-умолчанию "НаименованиеСклада" для пользователя "ИмяПользователя"
	Допустим Я открываю навигационную ссылку "e1cib/list/Справочник.Пользователи"

	Когда открылось окно 'Пользователи'
	Тогда в таблице "ПользователиСписок" я перехожу к строке
		| Полное имя      |
		| "ИмяПользователя" |
	И в таблице "ПользователиСписок" я выбираю текущую строку
	
	Когда открылось окно '* (Пользователь)'
	И В текущем окне я нажимаю кнопку командного интерфейса 'Настройки пользователя'
	И в таблице "ДеревоНастроек" я перехожу к строке:
		| Настройка      |
		| Основной склад |
	И в таблице "ДеревоНастроек" я активизирую поле "Значение"
	И в таблице "ДеревоНастроек" я выбираю текущую строку
	И в таблице "ДеревоНастроек" я нажимаю кнопку выбора у реквизита "Значение"

	Когда открылось окно 'Склады'
	Тогда в таблице "Список" я перехожу к строке:
		| Наименование      |
		| "НаименованиеСклада" |
	И в таблице "Список" я выбираю текущую строку

	Когда открылось окно '* (Пользователь)'
	Тогда в таблице "ДеревоНастроек" я завершаю редактирование строки
	И Я закрываю окно '* (Пользователь)'
