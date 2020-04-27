#language: ru
@tree

Функциональность: Строка доставки в печатных документах

Как пользователь УНФ
Я хочу выставлять стоимость доставки в печатных документах
Чтобы получать оплату доставки от клиентов

Контекст:
	Допустим Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Подготовить данные для сценария
	Допустим Я включаю автоскидку "5% (Сумма в документе > 10 000 руб.)"
	И Я добавляю покупателя "Покупатель для доставки"
	И Я добавляю поставщика "Поставщик для доставки"
	И Я добавляю номенклатуру "Позиция для доставки"
	И Я включаю Корректировки реализаций
	И Я отключаю проверку расхождений в приходных накладных

Сценарий: Печать Сводно о заказе
	Допустим Я создаю новый заказ покупателя
	И я выбираю покупателя "Покупатель для доставки"
	И я устанавливаю НДС в том числе
	И в таблице "Запасы" по кнопке "ЗапасыДобавить" я добавляю позицию "Позиция для доставки" "6" "7 750,00" "-5,00"
	И я указываю стоимость доставки в заказе покупателя "1 000,00"

	Когда я нажимаю на кнопку с именем 'СводныйОтчет'
	И открылось окно '1С:Предприятие'
	И я нажимаю на кнопку 'Записать и продолжить'
	Тогда открылось окно "Печать документа"
	И в табличном документе "ТекущаяПечатнаяФорма" ячейка с адресом "R39C5" равна "47 500,00"

Сценарий: Печать заказа покупателя с доставкой, сумма включает НДС
	Допустим Я создаю новый заказ покупателя
	И я выбираю покупателя "Покупатель для доставки"
	И я устанавливаю НДС в том числе
	И в таблице "Запасы" по кнопке "ЗапасыДобавить" я добавляю позицию "Позиция для доставки" "6" "7 750,00" "-5,00"
	И я указываю стоимость доставки в заказе покупателя "1 000,00"

	Затем Я печатаю заказ покупателя
		Когда я нажимаю на кнопку 'Заказ покупателя'
		И открылось окно '1С:Предприятие'
		И я нажимаю на кнопку 'Записать и продолжить'
		Тогда открылось окно "Заказ покупателя *"
		И в табличном документе "ТекущаяПечатнаяФорма" ячейка с адресом "R14C30:R14C33" равна "47 500,00"
		И в табличном документе "ТекущаяПечатнаяФорма" ячейка с адресом "R15C29" равна "В том числе НДС:"
		И в табличном документе "ТекущаяПечатнаяФорма" ячейка с адресом "R15C30:R15C33" равна "7 916,67"

Сценарий: Печать заказа покупателя с доставкой НДС сверху
	Допустим Я создаю новый заказ покупателя
	И я выбираю покупателя "Покупатель для доставки"
	И я устанавливаю НДС сверху
	И в таблице "Запасы" по кнопке "ЗапасыДобавить" я добавляю позицию "Позиция для доставки" "6" "7 750,00" "-5,00"
	И я указываю стоимость доставки в заказе покупателя "1 000,00"

	Затем Я печатаю заказ покупателя
		Когда я нажимаю на кнопку 'Заказ покупателя'
		И открылось окно '1С:Предприятие'
		И я нажимаю на кнопку 'Записать и продолжить'
		Тогда открылось окно "Заказ покупателя *"
		И в табличном документе "ТекущаяПечатнаяФорма" ячейка с адресом "R14C30:R14C33" равна "47 500,00"
		И в табличном документе "ТекущаяПечатнаяФорма" ячейка с адресом "R15C29" равна "Сумма НДС:"
		И в табличном документе "ТекущаяПечатнаяФорма" ячейка с адресом "R15C30:R15C33" равна "9 500,00"

Сценарий: Печать счета на оплату из заказа с доставкой, сумма включает НДС
	Допустим Я создаю новый заказ покупателя
	И я выбираю покупателя "Покупатель для доставки"
	И я устанавливаю НДС в том числе
	И в таблице "Запасы" по кнопке "ЗапасыДобавить" я добавляю позицию "Позиция для доставки" "6" "7 750,00" "-5,00"
	И я указываю стоимость доставки в заказе покупателя "1 000,00"

	Затем Я печатаю счет на оплату
		Когда я нажимаю на кнопку 'Счет на оплату'
		И открылось окно '1С:Предприятие'
		И я нажимаю на кнопку 'Записать и продолжить'
		Тогда открылось окно "Заказ покупателя *"
		И в табличном документе "ТекущаяПечатнаяФорма" ячейка с адресом "R32C8:R32C12" равна "47 500,00"

Сценарий: Печать счета на оплату из заказа с доставкой НДС сверху
	Допустим Я создаю новый заказ покупателя
	И я выбираю покупателя "Покупатель для доставки"
	И я устанавливаю НДС сверху
	И в таблице "Запасы" по кнопке "ЗапасыДобавить" я добавляю позицию "Позиция для доставки" "6" "7 750,00" "-5,00"
	И я указываю стоимость доставки в заказе покупателя "1 000,00"

	Затем Я печатаю счет на оплату
		Когда я нажимаю на кнопку 'Счет на оплату'
		И открылось окно '1С:Предприятие'
		И я нажимаю на кнопку 'Записать и продолжить'
		Тогда открылось окно "Заказ покупателя *"
		И в табличном документе "ТекущаяПечатнаяФорма" ячейка с адресом "R32C8:R32C12" равна "57 000,00"

Сценарий: Поступление позиции для доставки
	Допустим Я создаю новую приходную накладную
	
	Когда открылось окно 'Приходная накладная (создание)'
	Тогда Я выбираю поставщика "Поставщик для доставки"

	Когда открылось окно 'Приходная накладная *'
	И я нажимаю на кнопку с именем 'Добавить'
	Тогда в таблице "Запасы" я нажимаю кнопку выбора у реквизита "Номенклатура"

	Когда открылось окно 'Номенклатура'
	И я разворачиваю группу "Фильтры"
	И я снимаю флаг 'Остатки'
	И в таблице "СписокЗапасы" я перехожу к строке:
		| Наименование           |
		| "Позиция для доставки" |
	Тогда в таблице "СписокЗапасы" я выбираю текущую строку

	Когда открылось окно 'Приходная накладная *'
	И в таблице "Запасы" я активизирую поле "Цена"
	И в таблице "Запасы" в поле 'Количество' я ввожу текст "12"
	И в таблице "Запасы" в поле 'Цена' я ввожу текст "5 425,00"
	Тогда в таблице "Запасы" я завершаю редактирование строки

	Когда я нажимаю на кнопку 'Провести'
	Тогда не появилось окно предупреждения системы

Сценарий: Печать ТОРГ-12 из заказ-наряда НДС сверху
	Допустим Я создаю новый заказ-наряд
	Тогда открылось окно 'Заказ-наряд *'

	Когда я нажимаю кнопку выбора у поля "Покупатель"
	Тогда открылось окно 'Контрагенты: Покупатели'

	Когда в таблице "Список" я перехожу к строке
		| Представление             |
		| "Покупатель для доставки" |
	Тогда в таблице "Список" я выбираю текущую строку

	Когда открылось окно 'Заказ-наряд *'
	И я перехожу к закладке "Товары"
	И я нажимаю на кнопку с именем 'Добавить1'
	Тогда в таблице "Запасы" я нажимаю кнопку выбора у реквизита с именем "ЗапасыНоменклатура"

	Когда открылось окно 'Номенклатура'
	И я разворачиваю группу "Фильтры"
	И я снимаю флаг 'Остатки'
	И в таблице "СписокЗапасы" я перехожу к строке:
		| Наименование           |
		| "Позиция для доставки" |
	Тогда в таблице "СписокЗапасы" я выбираю текущую строку

	Когда открылось окно 'Заказ-наряд *'
	Тогда в таблице "Запасы" я активизирую поле с именем "ЗапасыКоличество"
	И в таблице "Запасы" я выбираю текущую строку
	И в таблице "Запасы" в поле 'Количество' я ввожу текст '6,000'
	И в таблице "Запасы" я активизирую поле с именем "ЗапасыЦена"
	И в таблице "Запасы" в поле 'Цена' я ввожу текст '7 750,00'
	И в таблице "Запасы" я активизирую поле с именем "ЗапасыПроцентСкидкиНаценки"
	И в таблице "Запасы" в поле '% Скидки' я ввожу текст '-5,00'
	И в таблице "Запасы" я завершаю редактирование строки
	
	Когда я нажимаю на кнопку 'ТОРГ-12 (Товарная накладная)'
	И открылось окно '1С:Предприятие'
	И я нажимаю на кнопку 'Записать и продолжить'
	Тогда открылось окно "Заказ-наряд *"
	И в табличном документе "ТекущаяПечатнаяФорма" ячейка с адресом "R25C16" равна "46 500,00"

Сценарий: Печать приложения к договору из заказа покупателя НДС сверху
	Допустим Я создаю новый заказ покупателя
	И я выбираю покупателя "Покупатель для доставки"
	И я устанавливаю НДС сверху
	И в таблице "Запасы" по кнопке "ЗапасыДобавить" я добавляю позицию "Позиция для доставки" "6" "7 750,00" "-5,00"
	И я указываю стоимость доставки в заказе покупателя "1 000,00"

	Затем Я печатаю приложение к договору
		Когда я нажимаю на кнопку 'Приложение к договору (устарела)'
		И открылось окно '1С:Предприятие'
		И я нажимаю на кнопку 'Записать и продолжить'
		Тогда открылось окно "Заказ покупателя *"
		И в табличном документе "ТекущаяПечатнаяФорма" ячейка с адресом "R16C30:R16C33" равна "47 500,00"
		И в табличном документе "ТекущаяПечатнаяФорма" ячейка с адресом "R17C30:R17C33" равна "9 500,00"

Сценарий: Печать коммерческого предложения из заказа покупателя
	Допустим Я создаю новый заказ покупателя
	И я выбираю покупателя "Покупатель для доставки"
	И я устанавливаю НДС сверху
	И в таблице "Запасы" по кнопке "ЗапасыДобавить" я добавляю позицию "Позиция для доставки" "6" "7 750,00" "-5,00"
	И я указываю стоимость доставки в заказе покупателя "1 000,00"

	Затем Я печатаю коммерческое предложение
		Когда я нажимаю на кнопку 'Коммерческое предложение'
		И открылось окно '1С:Предприятие'
		И я нажимаю на кнопку 'Записать и продолжить'
		Тогда открылось окно "Заказ покупателя *"
		И в табличном документе "ТекущаяПечатнаяФорма" ячейка с адресом "R24C30:R24C34" равна "47 500,00"
		И в табличном документе "ТекущаяПечатнаяФорма" ячейка с адресом "R25C30:R25C34" равна "9 500,00"
		И Я закрываю окно 'Заказ покупателя *'

	Затем Я печатаю коммерческое предложение (.docx)
		Когда открылось окно 'Заказ покупателя *'
		И я нажимаю на кнопку "Коммерческое предложение (.docx)"
		И открылось окно 'Сохранение печатной формы'
		Тогда я нажимаю на кнопку 'Отменить'

Сценарий: Печать Расходной накладной с услугами НДС сверху
	Допустим Я создаю новую расходную накладную
	И я выбираю покупателя "Покупатель для доставки"
	И я устанавливаю НДС сверху

	Когда открылось окно 'Расходная накладная *'
	И я нажимаю на кнопку с именем 'Добавить'
	Тогда в таблице "Запасы" я нажимаю кнопку выбора у реквизита с именем "ЗапасыНоменклатура"

	Когда открылось окно 'Номенклатура'
	И я разворачиваю группу "Фильтры"
	И я снимаю флаг 'Остатки'
	И в таблице "СписокЗапасы" я перехожу к строке:
		| Наименование           |
		| "Позиция для доставки" |
	Тогда в таблице "СписокЗапасы" я выбираю текущую строку

	Когда открылось окно 'Расходная накладная *'
	Тогда в таблице "Запасы" я активизирую поле с именем "ЗапасыКоличество"
	И в таблице "Запасы" я выбираю текущую строку
	И в таблице "Запасы" в поле 'Количество' я ввожу текст '6,000'
	И в таблице "Запасы" я активизирую поле с именем "ЗапасыЦена"
	И в таблице "Запасы" в поле 'Цена' я ввожу текст '7 750,00'
	И в таблице "Запасы" я активизирую поле с именем "ЗапасыПроцентСкидкиНаценки"
	И в таблице "Запасы" в поле '%' я ввожу текст '-5,00'
	И в таблице "Запасы" я завершаю редактирование строки

	Затем я указываю стоимость доставки "1 000,00"

	Когда я нажимаю на кнопку 'Провести'
	Тогда не появилось окно предупреждения системы

	Когда я нажимаю на кнопку 'Накладная (с услугами)'
	Тогда открылось окно 'Расходная накладная *'
	И я жду когда в табличном документе 'ТекущаяПечатнаяФорма' заполнится ячейка "R3C2" в течение 120 секунд
	И в табличном документе 'ТекущаяПечатнаяФорма' ячейка с адресом "R15C14" равна "47 500,00"
	И в табличном документе 'ТекущаяПечатнаяФорма' ячейка с адресом "R16C14" равна "9 500,00"
	И в табличном документе 'ТекущаяПечатнаяФорма' ячейка с адресом "R17C14" равна "57 000,00"
	И Я закрываю окно 'Расходная накладная *'

	Когда я нажимаю на кнопку 'Акт об оказании услуг'
	Тогда открылось окно 'Расходная накладная *'
	И я жду когда в табличном документе 'ТекущаяПечатнаяФорма' заполнится ячейка "R3C2:R3C32" в течение 120 секунд
	И в табличном документе 'ТекущаяПечатнаяФорма' ячейка с адресом "R14C30:R14C33" равна "1 000,00"
	И в табличном документе 'ТекущаяПечатнаяФорма' ячейка с адресом "R15C30:R15C33" равна "200,00"
	И Я закрываю окно 'Расходная накладная *'

	Когда я нажимаю на кнопку 'Товарный чек'
	Тогда открылось окно 'Расходная накладная *'
	И я жду когда в табличном документе 'ТекущаяПечатнаяФорма' заполнится ячейка "R2C2:R2C33" в течение 120 секунд
	И в табличном документе 'ТекущаяПечатнаяФорма' ячейка с адресом "R14C10" равна "47 500,00"
	И в табличном документе 'ТекущаяПечатнаяФорма' ячейка с адресом "R15C10" равна "9 500,00"
	И в табличном документе 'ТекущаяПечатнаяФорма' ячейка с адресом "R16C10" равна "57 000,00"
	И Я закрываю окно 'Расходная накладная *'

Сценарий: Я создаю счет-фактуру на основании расходной накладной
	Допустим В командном интерфейсе я выбираю 'Продажи' 'Расходные накладные'
	И открылось окно 'Расходные накладные'
	И в таблице "Список" я перехожу к последней строке

	Когда я нажимаю на кнопку 'Счет-фактура: создать на основании'
	Тогда открылось окно 'Счет-фактура (создание)'
	И я нажимаю на кнопку 'Провести и закрыть'
	И я жду закрытия окна 'Счет-фактура (создание)' в течение 20 секунд

Сценарий: Печать ТОРГ-12 из корректировки реализации НДС сверху
	Допустим В командном интерфейсе я выбираю 'Продажи' 'Расходные накладные'
	И открылось окно 'Расходные накладные'
	И в таблице "Список" я перехожу к последней строке

	Когда я нажимаю на кнопку 'Корректировка реализации: создать на основании'
	Тогда открылось окно 'Корректировка реализации (создание)'
	
	Когда я нажимаю на кнопку 'ТОРГ-12 (Товарная накладная с услугами)'
	И открылось окно '1С:Предприятие'
	И я нажимаю на кнопку 'Записать и продолжить'
	Тогда открылось окно 'Корректировка реализации *'
	И я жду когда в табличном документе 'ТекущаяПечатнаяФорма' заполнится ячейка "R26C16" в течение 120 секунд
	И в табличном документе 'ТекущаяПечатнаяФорма' ячейка с адресом "R26C16" равна "57 000,00"
	И Я закрываю окно 'Корректировка реализации *'

Сценарий: Печать Акт об оказании услуг из корректировки реализации НДС сверху
	Допустим В командном интерфейсе я выбираю 'Продажи' 'Расходные накладные'
	И открылось окно 'Расходные накладные'
	И в таблице "Список" я перехожу к последней строке

	Когда я нажимаю на кнопку 'Корректировка реализации: создать на основании'
	Тогда открылось окно 'Корректировка реализации (создание)'
	
	Когда я нажимаю на кнопку 'Акт об оказании услуг'
	И открылось окно '1С:Предприятие'
	И я нажимаю на кнопку 'Записать и продолжить'
	Тогда открылось окно 'Корректировка реализации *'
	И я жду когда в табличном документе 'ТекущаяПечатнаяФорма' заполнится ячейка "R3C2:R3C32" в течение 120 секунд
	И в табличном документе 'ТекущаяПечатнаяФорма' ячейка с адресом "R14C30:R14C33" равна "1 000,00"
	И в табличном документе 'ТекущаяПечатнаяФорма' ячейка с адресом "R15C30:R15C33" равна "200,00"
	И Я закрываю окно 'Корректировка реализации *'

Сценарий: Печать ТТН из корректировки реализации НДС сверху
	Допустим В командном интерфейсе я выбираю 'Продажи' 'Расходные накладные'
	И открылось окно 'Расходные накладные'
	И в таблице "Список" я перехожу к последней строке

	Когда я нажимаю на кнопку 'Корректировка реализации: создать на основании'
	Тогда открылось окно 'Корректировка реализации (создание)'
	
	Когда я нажимаю на кнопку '1-Т (Товарно-транспортная накладная)'
	И открылось окно '1С:Предприятие'
	И я нажимаю на кнопку 'Записать и продолжить'
	Тогда открылось окно 'Корректировка реализации *'
	И я жду когда в табличном документе 'ТекущаяПечатнаяФорма' заполнится ячейка "R19C12" в течение 120 секунд
	И в табличном документе 'ТекущаяПечатнаяФорма' ячейка с адресом "R19C12" равна "57 000,00"
	И Я закрываю окно 'Корректировка реализации *'

Сценарий: Печать Универсального корректировочного документа НДС сверху
	Допустим В командном интерфейсе я выбираю 'Продажи' 'Расходные накладные'
	И открылось окно 'Расходные накладные'
	И в таблице "Список" я перехожу к последней строке

	Когда я нажимаю на кнопку 'Корректировка реализации: создать на основании'
	Тогда открылось окно 'Корректировка реализации (создание)'

	Когда в таблице "Запасы" я активизирую поле "Количество"
	И в таблице "Запасы" я выбираю текущую строку
	Тогда в таблице "Запасы" в поле 'Количество' я ввожу текст '7,000'

	Когда я перехожу к закладке "Доставка"
	И в таблице "Запасы" я завершаю редактирование строки
	И в поле с именем 'СтоимостьДоставки' я ввожу текст '1 100,00'
	Тогда я перехожу к следующему реквизиту
	
	Когда я нажимаю на кнопку 'Универсальный корректировочный документ'
	И открылось окно '1С:Предприятие'
	И я нажимаю на кнопку 'Записать и продолжить'
	Тогда открылось окно 'Счет-фактура *'
	И я жду когда в табличном документе 'ТекущаяПечатнаяФорма' заполнится ячейка "R18C2" в течение 120 секунд
	И табличный документ "ТекущаяПечатнаяФорма" содержит значения:
		| Всего увеличение (сумма строк В) |
		| 7850.00 |
		| 1570.00 |
		| 9420.00 |

Сценарий: Печать счета на оплату с доставкой НДС сверху
	Допустим Я создаю новый счет на оплату
	И я выбираю покупателя "Покупатель для доставки"
	И я устанавливаю НДС сверху
	И в таблице "Запасы" по кнопке "Добавить" я добавляю позицию "Позиция для доставки" "6" "7 750,00" "-5,00"
	И я указываю стоимость доставки "1 000,00"

	Затем Я печатаю счет на оплату
		Когда я нажимаю на кнопку 'Счет на оплату'
		И открылось окно '1С:Предприятие'
		И я нажимаю на кнопку 'Записать и продолжить'
		Тогда открылось окно "Счет на оплату *"
		И в табличном документе "ТекущаяПечатнаяФорма" ячейка с адресом "R32C8:R32C12" равна "57 000,00"

Сценарий: Печать приложения к договору из заказа покупателя НДС сверху
	Допустим Я создаю новый счет на оплату
	И я выбираю покупателя "Покупатель для доставки"
	И я устанавливаю НДС сверху
	И в таблице "Запасы" по кнопке "Добавить" я добавляю позицию "Позиция для доставки" "6" "7 750,00" "-5,00"
	И я указываю стоимость доставки "1 000,00"

	Затем Я печатаю приложение к договору
		Когда я нажимаю на кнопку 'Приложение к договору (устарела)'
		И открылось окно '1С:Предприятие'
		И я нажимаю на кнопку 'Записать и продолжить'
		Тогда открылось окно "Счет на оплату *"
		И в табличном документе "ТекущаяПечатнаяФорма" ячейка с адресом "R13C7:R13C9" равна "47 500,00"
		И в табличном документе "ТекущаяПечатнаяФорма" ячейка с адресом "R14C7:R14C9" равна "9 500,00"
		И в табличном документе "ТекущаяПечатнаяФорма" ячейка с адресом "R15C7:R15C9" равна "57 000,00"
