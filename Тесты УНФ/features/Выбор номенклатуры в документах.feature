#language: ru
@Tree

Функциональность: Выбор номенклатуры в документах

Как пользователь УНФ
Я хочу выбирать номенклатуру из формы выбора
Чтобы удостовериться что выбор во всех документах работает корректно

Контекст:
	Допустим Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Установка настроек тестирования
	Допустим В командном интерфейсе я выбираю 'Компания' 'Администрирование'
	И открылось окно 'Больше возможностей: настройка программы'

	Я включаю ручной способ распределения материалов
		Когда в таблице "ДеревоРазделов" я разворачиваю текущую строку
		И в таблице "ДеревоРазделов" я перехожу к строке:
			| Представление |
			| Производство  |
		И я перехожу к закладке "Производство"
		Тогда я меняю значение переключателя "Способ распределения материалов по умолчанию" на 'Вручную'

	Я включаю корректировки реализации и поступления
		Когда в таблице "ДеревоРазделов" я перехожу к строке:
			| Представление |
			| Продажи       |
		Тогда я перехожу к закладке "Продажи"
		И я устанавливаю флаг "Корректировки реализаций"
		
		Когда в таблице "ДеревоРазделов" я перехожу к строке:
			| Представление |
			| Закупки       |
		Тогда я перехожу к закладке "Закупки"
		И я устанавливаю флаг "Корректировки поступлений"

	Я включаю ордерные склады
		Когда в таблице "ДеревоРазделов" я перехожу к строке:
			| Представление |
			| Закупки       |
		Тогда я перехожу к закладке "Закупки"
		И я устанавливаю флаг "Ордерные склады"

	Я очищаю основной склад и основное подразделение у пользователя
		Когда в таблице "ДеревоРазделов" я перехожу к строке:
			| Представление                  |
			| Настройки пользователей и прав |
		И я перехожу к закладке "Настройки пользователей и прав"
		Тогда я нажимаю на кнопку 'Пользователи'

		Когда открылось окно 'Пользователи'
		Тогда в таблице "ПользователиСписок" я выбираю текущую строку

	Тогда открылось окно 'Абдулов Юрий Владимирович (Пользователь)'
	И В текущем окне я нажимаю кнопку командного интерфейса 'Настройки пользователя'
	И в таблице "ДеревоНастроек" я перехожу к строке:
		| Настройка              |
		| Основное подразделение |
	И в таблице "ДеревоНастроек" я активизирую поле "Значение"
	И в таблице "ДеревоНастроек" я выбираю текущую строку
	И в таблице "ДеревоНастроек" я выбираю текущую строку
	И в таблице "ДеревоНастроек" я нажимаю кнопку очистить у поля "Значение"
	И в таблице "ДеревоНастроек" я завершаю редактирование строки
	И в таблице "ДеревоНастроек" я перехожу к строке:
		| Настройка      |
		| Основной склад |
	И в таблице "ДеревоНастроек" я выбираю текущую строку
	И в таблице "ДеревоНастроек" я нажимаю кнопку очистить у поля "Значение"
	И в таблице "ДеревоНастроек" я завершаю редактирование строки
	И Я закрываю окно 'Абдулов Юрий Владимирович (Пользователь)'

	Когда открылось окно 'Пользователи'
	Тогда Я закрываю окно 'Пользователи'

	Тогда открылось окно 'Больше возможностей: настройка программы'
	И Я закрываю окно 'Больше возможностей: настройка программы'

Структура сценария: Выбор номенклатуры в документах
	Допустим Я открываю основную форму списка документа <Документ>
	
	Когда я нажимаю на кнопку 'Создать'
	Тогда открылось окно <Окно>
	И я перехожу к закладке <Закладка>

	Когда я нажимаю на кнопку с именем <Кнопка>
	Тогда открылось окно <Окно>
	И в таблице <Таблица> я нажимаю кнопку выбора у реквизита <Реквизит>
	
	Когда открылось окно 'Номенклатура'
	И в таблице 'ОтборИерархия' я перехожу к строке:
	| Представление  |
	| "<Все группы>" |

	И я нажимаю на кнопку с именем 'Выбрать'
	Тогда открылось окно <Окно>

Примеры:
	| Документ                 | Окно                        | Закладка        | Кнопка            | Таблица       | Реквизит                     |
	| АктВыполненныхРабот      | Акт выполненных работ *     | Работы и услуги | Добавить          | РаботыИУслуги | Номенклатура                 |
	| АвансовыйОтчет           | Авансовый отчет *           | Запасы          | Добавить          | Запасы        | Номенклатура                 |
	| АвансовыйОтчет           | Авансовый отчет *           | Услуги          | Добавить1         | Расходы       | Номенклатура                 |
	| ДополнительныеРасходы    | Дополнительные расходы *    | Запасы          | Добавить          | Запасы        | Номенклатура                 |
	| ДополнительныеРасходы    | Дополнительные расходы *    | Услуги          | Добавить          | Запасы        | Номенклатура                 |
	| ЗаказНаПроизводство      | Заказ на производство *     | Продукция       | ПродукцияДобавить | Продукция     | Номенклатура                 |
	| ЗаказНаПроизводство      | Заказ на производство *     | Материалы       | ЗапасыДобавить    | Запасы        | Номенклатура                 |
	| ЗаказНаПроизводство      | Заказ на производство *     | Операции        | ОперацииДобавить  | Операции      | Операция                     |
	| ЗаказПоставщику          | Заказ поставщику *          | Товары и услуги | Добавить          | Запасы        | Номенклатура                 |
	| ЗаказПокупателя          | Заказ покупателя *          | Товары, услуги  | ЗапасыДобавить    | Запасы        | Номенклатура                 |
	| ИнвентаризацияЗапасов    | Инвентаризация запасов *    | Запасы          | ЗапасыДобавить    | Запасы        | Номенклатура                 |
	| КорректировкаПоступления | Корректировка поступления * | Товары          | ЗапасыДобавить    | Запасы        | Номенклатура                 |
	| КорректировкаПоступления | Корректировка поступления * | Услуги          | РасходыДобавить   | Расходы       | Номенклатура                 |
	| КорректировкаРеализации  | Корректировка реализации *  | Товары и услуги | ЗапасыДобавить    | Запасы        | Номенклатура                 |
	| ОприходованиеЗапасов     | Оприходование запасов *     | Запасы          | ЗапасыДобавить    | Запасы        | Номенклатура                 |
	| ОтчетКомитенту           | Отчет комитенту *           | Запасы          | Добавить          | Запасы        | Номенклатура                 |
	| ОтчетОПереработке        | Отчет о переработке *       | Продукция       | Добавить          | Продукция     | Номенклатура                 |
	| ОтчетОПереработке        | Отчет о переработке *       | Материалы       | Добавить1         | Запасы        | Номенклатура                 |
	| ОтчетПереработчика       | Отчет переработчика *       | Продукция       | Добавить1         | Продукция     | Номенклатура                 |
	| ОтчетПереработчика       | Отчет переработчика *       | Материалы       | Добавить          | Запасы        | Номенклатура                 |
	| ОтчетПереработчика       | Отчет переработчика *       | Отходы          | ОтходыДобавить    | Отходы        | Номенклатура                 |
	| ПересортицаЗапасов       | Пересортица запасов *       | Запасы          | ЗапасыДобавить    | Запасы        | Номенклатура (списание)      |
	| ПересортицаЗапасов       | Пересортица запасов *       | Запасы          | ЗапасыДобавить    | Запасы        | Номенклатура (оприходование) |
	| ПеремещениеЗапасов       | Перемещение запасов *       | Запасы          | ЗапасыДобавить    | Запасы        | Номенклатура                 |
	| ПриходнаяНакладная       | Приходная накладная *       | Товары          | Добавить          | Запасы        | Номенклатура                 |
	| ПриходнаяНакладная       | Приходная накладная *       | Услуги          | Добавить1         | Расходы       | Номенклатура                 |
	| ПриходныйОрдер           | Приходный ордер *           | Запасы          | ЗапасыДобавить    | Запасы        | Номенклатура                 |
	| РасходнаяНакладная       | Расходная накладная *       | Товары и услуги | Добавить          | Запасы        | Номенклатура                 |
	| РасходныйОрдер           | Расходный ордер *           | Запасы          | ЗапасыДобавить    | Запасы        | Номенклатура                 |
	| РезервированиеЗапасов    | Резервирование запасов *    | Запасы          | Добавить          | Запасы        | Номенклатура                 |
	| СборкаЗапасов            | Производство *              | Продукция       | ПродукцияДобавить | Продукция     | Номенклатура                 |
	| СборкаЗапасов            | Производство *              | Материалы       | ЗапасыДобавить    | Запасы        | Номенклатура                 |
	| СборкаЗапасов            | Производство *              | Отходы          | ОтходыДобавить    | Отходы        | Номенклатура                 |
	| СчетНаОплату             | Счет на оплату *            | Товары и услуги | Добавить          | Запасы        | Номенклатура                 |
	| ЧекККМ                   | Чек ККМ *                   | Товары и услуги | ЗапасыДобавить    | Запасы        | Номенклатура                 |
	
Структура сценария: Выбор номенклатуры в шапке документа
	Допустим Я открываю основную форму списка документа <Документ>
	
	Когда я нажимаю на кнопку 'Создать'
	Тогда открылось окно <Окно>

	Когда я нажимаю кнопку выбора у поля <Реквизит>
	И открылось окно 'Номенклатура'
	И я нажимаю на кнопку с именем 'Выбрать'
	Тогда открылось окно <Окно>

Примеры:
	| Документ              | Окно                        | Закладка        | Реквизит       |
	| ЗаданиеНаРаботу       | Задание на работу *         | Основные данные | Работа, услуга |
	| СчетНаОплату          | Счет на оплату *            | Доставка        | Услуга         |
	| ПриемИПередачаВРемонт | Прием и передача в ремонт * | Прием в ремонт  | Номенклатура   |

Сценарий: Выбор номенклатуры в Заказ-наряде
	Допустим В командном интерфейсе я выбираю 'Работы' 'Заказ-наряды'
	И открылось окно 'Заказ-наряды'
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	И открылось окно 'Заказ-наряд (создание)'

	Когда я нажимаю на кнопку с именем 'ШапкаТабличнаяЧасть'
	И открылось окно 'Шапка / табличная часть'
	И я устанавливаю флаг 'Использовать товары'
	И я устанавливаю флаг 'Использовать материалы заказчика'
	И я устанавливаю флаг 'Использовать материалы'
	И я нажимаю на кнопку 'ОК'
	Тогда открылось окно 'Заказ-наряд (Создание) *'

	Когда я перехожу к закладке "Работы"
	И я нажимаю на кнопку с именем 'Добавить'
	И в таблице "Работы" я нажимаю кнопку выбора у реквизита "Работа, услуга"
	И открылось окно 'Номенклатура'
	И я разворачиваю группу "Фильтры"
	И я изменяю флаг 'Услуга'
	И я нажимаю на кнопку с именем 'Выбрать'
	Тогда открылось окно 'Заказ-наряд (Создание) *'

	Когда я нажимаю на кнопку с именем 'ЗНМатериалыДобавить'
	И в таблице "ЗНМатериалы" я нажимаю кнопку выбора у реквизита "Номенклатура"
	И открылось окно 'Номенклатура'
	И я нажимаю на кнопку с именем 'Выбрать'
	Тогда открылось окно 'Заказ-наряд (Создание) *'

	Когда я перехожу к закладке "Товары"
	И я нажимаю на кнопку с именем 'Добавить1'
	И в таблице "Запасы" я нажимаю кнопку выбора у реквизита "Номенклатура"
	И открылось окно 'Номенклатура'
	И я нажимаю на кнопку с именем 'Выбрать'	
	Тогда открылось окно 'Заказ-наряд (Создание) *'

	Когда я перехожу к закладке "Материалы заказчика"
	И в таблице "Запасы" я завершаю редактирование строки
	И в таблице "ЗНМатериалыЗаказчика" я нажимаю на кнопку с именем 'ЗНМатериалыЗаказчикаДобавить'
	И в таблице "ЗНМатериалыЗаказчика" я нажимаю кнопку выбора у реквизита "Номенклатура"
	И открылось окно 'Номенклатура'
	И я нажимаю на кнопку с именем 'Выбрать'
	Тогда открылось окно 'Заказ-наряд (Создание) *'
	И Я закрываю окно 'Заказ-наряд (Создание) *'
	
	Тогда открылось окно '1С:Предприятие'
	И я нажимаю на кнопку 'Нет'

Сценарий: Выбор номенклатуры в Отчете комиссионера о продажах
	Допустим Я открываю основную форму списка документа "ОтчетКомиссионера"
	И открылось окно 'Отчеты комиссионеров'
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	
	Когда открылось окно 'Отчет комиссионера о продажах (создание)'
	Тогда в таблице "Покупатели" я нажимаю на кнопку с именем 'ПокупателиДобавить'
	И открылось окно 'Отчет комиссионера о продажах (создание) *'
	И в таблице "Покупатели" я нажимаю кнопку выбора у реквизита "Покупатель"
	И открылось окно 'Контрагенты: Покупатели'
	И я нажимаю на кнопку с именем 'Выбрать'

	Когда открылось окно 'Отчет комиссионера о продажах (создание) *'
	И я нажимаю на кнопку с именем 'Добавить'
	И в таблице "Запасы" я нажимаю кнопку выбора у реквизита "Номенклатура"
	И открылось окно 'Номенклатура'
	И я нажимаю на кнопку с именем 'Выбрать'
	
	Тогда открылось окно 'Отчет комиссионера о продажах (создание) *'
	И Я закрываю окно 'Отчет комиссионера о продажах (создание) *'
	
	Тогда открылось окно '1С:Предприятие'
	И я нажимаю на кнопку 'Нет'

Сценарий: Выбор номенклатуры в Заказе поставщику Операция Заказ на переработку
	Допустим В командном интерфейсе я выбираю 'Закупки' 'Заказы поставщикам'
	И открылось окно 'Заказы поставщикам'
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	И открылось окно 'Заказ поставщику (создание)'

	Когда из выпадающего списка "Операция" я выбираю точное значение 'Заказ на переработку'
	И я перехожу к закладке "Материалы в переработку"
	И я выбираю пункт контекстного меню с именем 'МатериалыКонтекстноеМенюДобавить' на элементе формы с именем "Материалы"
	И в таблице "Материалы" я нажимаю кнопку выбора у реквизита "Номенклатура"
	Тогда открылось окно 'Номенклатура'

	Когда я нажимаю на кнопку с именем 'Выбрать'
	Тогда открылось окно 'Заказ поставщику (создание) *'
	И Я закрываю окно 'Заказ поставщику (создание) *'
	
	Тогда открылось окно '1С:Предприятие'
	И я нажимаю на кнопку 'Нет'

Сценарий: Выбор номенклатуры в Перемещение Запасов Операция Передача в эксплуатацию
	Допустим В командном интерфейсе я выбираю 'Закупки' 'Перемещения запасов'
	Тогда открылось окно 'Перемещения запасов'
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	И открылось окно 'Перемещение запасов (создание)'

	Когда из выпадающего списка "Операция" я выбираю точное значение 'Передача в эксплуатацию'
	И я перехожу к закладке "Спецодежда"
	И я выбираю пункт контекстного меню с именем 'ЗапасыКонтекстноеМенюДобавить' на элементе формы с именем "Запасы"
	И в таблице "Запасы" я нажимаю кнопку выбора у реквизита "Номенклатура"
	Тогда открылось окно 'Номенклатура'

	Когда я нажимаю на кнопку с именем 'Выбрать'
	Тогда открылось окно 'Перемещение запасов (создание) *'

	Когда я перехожу к закладке "Спецоснастка"
	И я выбираю пункт контекстного меню с именем 'СпецоснасткаКонтекстноеМенюДобавить' на элементе формы с именем "Спецоснастка"
	И в таблице "Спецоснастка" я нажимаю кнопку выбора у реквизита "Номенклатура"
	Тогда открылось окно 'Номенклатура'

	Когда я нажимаю на кнопку с именем 'Выбрать'
	Тогда открылось окно 'Перемещение запасов (создание) *'

	Когда я перехожу к закладке "Инвентарь и хозяйственные принадлежности"
	И я выбираю пункт контекстного меню с именем 'ИнвентарьИХозяйственныеПринадлежностиКонтекстноеМенюДобавить' на элементе формы с именем "ИнвентарьИХозяйственныеПринадлежности"
	И в таблице "ИнвентарьИХозяйственныеПринадлежности" я нажимаю кнопку выбора у реквизита "Номенклатура"
	Тогда открылось окно 'Номенклатура'

	Когда я нажимаю на кнопку с именем 'Выбрать'
	Тогда открылось окно 'Перемещение запасов (создание) *'

Сценарий: Выбор номенклатуры в Приходной накладной операции приема
	Допустим В командном интерфейсе я выбираю 'Закупки' 'Приходные накладные'
	Тогда открылось окно 'Приходные накладные'
	И я нажимаю на кнопку с именем 'ФормаСоздать'

	Тогда открылось окно 'Приходная накладная (создание)'
	И в табличном документе 'ТаблицаДляПросмотра' я перехожу к ячейке "R1C1"
	И из выпадающего списка "Операция" я выбираю точное значение 'Прием на комиссию'

	Тогда открылось окно 'Приходная накладная (создание) *'
	И я нажимаю на кнопку с именем 'Добавить'
	И в таблице "Запасы" я нажимаю кнопку выбора у реквизита "Номенклатура"

	Тогда открылось окно 'Номенклатура'
	И я нажимаю на кнопку с именем 'Выбрать'

	Тогда открылось окно 'Приходная накладная (создание) *'
	И в таблице "Запасы" я завершаю редактирование строки
	И из выпадающего списка "Операция" я выбираю точное значение 'Прием в переработку'
	И я нажимаю на кнопку с именем 'Добавить'
	И в таблице "Запасы" я нажимаю кнопку выбора у реквизита "Номенклатура"

	Тогда открылось окно 'Номенклатура'
	И я нажимаю на кнопку с именем 'Выбрать'

	Тогда открылось окно 'Приходная накладная (создание) *'
	И в таблице "Запасы" я завершаю редактирование строки
	И из выпадающего списка "Операция" я выбираю точное значение 'Прием на ответственное хранение'
	И я нажимаю на кнопку с именем 'Добавить'
	И в таблице "Запасы" я нажимаю кнопку выбора у реквизита "Номенклатура"

	Тогда открылось окно 'Номенклатура'
	И я нажимаю на кнопку с именем 'Выбрать'
	
	Тогда открылось окно 'Приходная накладная (создание) *'
	И Я закрываю окно 'Приходная накладная (создание) *'

	Тогда открылось окно '1С:Предприятие'
	И я нажимаю на кнопку 'Нет'
	Тогда открылось окно 'Приходные накладные'
	И Я закрываю окно 'Приходные накладные'

Сценарий: Выбор номенклатуры Ввод начальных остатков
	Допустим В командном интерфейсе я выбираю 'Компания' 'Ввод начальных остатков'
	Тогда открылось окно 'Ввод начальных остатков'
	И я выбираю пункт контекстного меню "Создать" на элементе формы с именем "Список"

	Тогда открылось окно 'Помощник ввода начальных остатков (Шаг 0/5)'
	И я нажимаю на кнопку 'Далее'

	Тогда открылось окно 'Помощник ввода начальных остатков (Шаг 1/5)'
	И я нажимаю на кнопку 'Далее'

	Тогда открылось окно 'Помощник ввода начальных остатков (Шаг 2/5)'
	И в таблице "ВводНачальныхОстатковТоварыЗапасы" я нажимаю на кнопку 'Добавить'

	Тогда открылось окно 'Номенклатура'
	И я нажимаю на кнопку с именем 'Выбрать'
	И пауза 1
	
	Тогда открылось окно 'Помощник ввода начальных остатков (Шаг 2/5)'
	И я перехожу к закладке "Принятые"
	И в таблице "ВводНачальныхОстатковТоварыЗапасыПринятые" я нажимаю на кнопку 'Добавить'

	Тогда открылось окно 'Номенклатура'
	И я нажимаю на кнопку с именем 'Выбрать'

	Тогда открылось окно 'Помощник ввода начальных остатков (Шаг 2/5)'
	И в таблице "ВводНачальныхОстатковТоварыЗапасыПринятые" я нажимаю кнопку выбора у реквизита "Вид операции"
	И я перехожу к закладке "Переданные"
	И в таблице "ВводНачальныхОстатковТоварыЗапасыПереданные" я нажимаю на кнопку 'Добавить'

	Тогда открылось окно 'Номенклатура'
	И я нажимаю на кнопку с именем 'Выбрать'

	Тогда открылось окно 'Помощник ввода начальных остатков (Шаг 2/5)'
	И в таблице "ВводНачальныхОстатковТоварыЗапасыПереданные" я нажимаю кнопку выбора у реквизита "Вид операции"
	И Я закрываю окно 'Помощник ввода начальных остатков (Шаг 2/5)'

Сценарий: Выбор номенклатуры Заказ покупателя Операция Заказ на переработку
	Допустим В командном интерфейсе я выбираю 'Продажи' 'Заказы покупателей'
	Тогда открылось окно 'Заказы покупателей'
	И я нажимаю на кнопку с именем 'ФормаСоздать'

	Тогда открылось окно 'Заказ покупателя (создание)'
	И из выпадающего списка "Операция" я выбираю точное значение 'Заказ на переработку'

	Тогда открылось окно 'Заказ покупателя (создание) *'
	И я нажимаю на кнопку с именем 'ЗапасыДобавить'
	И в таблице "Запасы" я нажимаю кнопку выбора у реквизита "Номенклатура"

	Тогда открылось окно 'Номенклатура'
	И я нажимаю на кнопку с именем 'Выбрать'

	Тогда открылось окно 'Заказ покупателя (создание) *'
	И я перехожу к закладке "Материалы заказчика"
	И я нажимаю на кнопку с именем 'МатериалыЗаказчикаДобавить'
	И в таблице "МатериалыЗаказчика" я нажимаю кнопку выбора у реквизита "Номенклатура"

	Тогда открылось окно 'Номенклатура'
	И я нажимаю на кнопку с именем 'Выбрать'

	Тогда открылось окно 'Заказ покупателя (создание) *'
	И Я закрываю окно 'Заказ покупателя (создание) *'

	Тогда открылось окно '1С:Предприятие'
	И я нажимаю на кнопку 'Нет'

Сценарий: Выбор номенклатуры Произвоство по всем операциям
	Допустим  В командном интерфейсе я выбираю 'Производство' 'Производство'
	Тогда открылось окно 'Производство'
	И я нажимаю на кнопку с именем 'ФормаСоздать'

	Тогда открылось окно 'Производство (создание)'
	И в таблице "Продукция" я нажимаю на кнопку с именем 'ПродукцияДобавить'

	Тогда открылось окно 'Производство (создание) *'
	И в таблице "Продукция" я нажимаю кнопку выбора у реквизита "Номенклатура"

	Тогда открылось окно 'Номенклатура'
	И я нажимаю на кнопку с именем 'Выбрать'

	Тогда открылось окно 'Производство (создание) *'
	И я перехожу к закладке "Материалы"
	И я нажимаю на кнопку с именем 'ЗапасыДобавить'
	И в таблице "Запасы" я нажимаю кнопку выбора у реквизита "Номенклатура"

	Тогда открылось окно 'Номенклатура'
	И в таблице "СписокЗапасы" я выбираю текущую строку

	Тогда открылось окно 'Производство (создание) *'
	И я перехожу к закладке "Распределение"
	И я перехожу к закладке "Распределение"
	И в таблице "РаспределениеЗапасов" я нажимаю на кнопку с именем 'РаспределениеЗапасовДобавить'
	И в таблице "РаспределениеЗапасов" я нажимаю кнопку выбора у реквизита "Продукция"
	И в таблице "РаспределениеЗапасов" я нажимаю кнопку выбора у реквизита "Номенклатура"

	Тогда открылось окно 'Номенклатура'
	И я нажимаю на кнопку с именем 'Выбрать'

	Тогда открылось окно 'Производство (создание) *'
	И я перехожу к закладке "Отходы"
	И в таблице "Отходы" я нажимаю на кнопку с именем 'ОтходыДобавить'
	И в таблице "Отходы" я нажимаю кнопку выбора у реквизита "Номенклатура"

	Тогда открылось окно 'Номенклатура'
	И я нажимаю на кнопку с именем 'Выбрать'

	Тогда открылось окно 'Производство (создание) *'
	И Я закрываю окно 'Производство (создание) *'

	Тогда открылось окно '1С:Предприятие'
	И я нажимаю на кнопку 'Нет'

