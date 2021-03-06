#language: ru
@Tree

Функциональность: Работа с формой списка номенклатуры

Как пользователь УНФ
Я хочу протестировать работу с формой списка номенклатуры. Корзина, группировки дин. списка, создание Документов
Проверить работу отбора по группам и категориям. + фильтры по остаткам и ценам.

Контекст:
	Допустим Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Проверка установки настроек формы Списка
	Допустим В командном интерфейсе я выбираю 'Продажи' 'Номенклатура'
	И открылось окно 'Номенклатура'
	И я разворачиваю группу "Фильтры"

	Когда я нажимаю на кнопку 'Настройки'
	Тогда открылось окно 'Настройки'
	И я снимаю флаг 'Корзину'
	И я снимаю флаг 'Изображение'
	И я снимаю флаг 'Аналоги'
	И я снимаю флаг 'Сопутствующие товары'
	И я снимаю флаг 'Количество'
	И я снимаю флаг 'Цену'
	И я нажимаю на кнопку 'ОК'
	И Пауза 1

	Когда я нажимаю на кнопку 'Настройки'
	Тогда открылось окно 'Настройки'
	И я устанавливаю флаг 'Корзину'
	И я устанавливаю флаг 'Изображение'
	И я устанавливаю флаг 'Аналоги'
	И я устанавливаю флаг 'Сопутствующие товары'
	И я нажимаю на кнопку 'ОК'
	И Пауза 1
	И Я закрываю окно 'Номенклатура'

Сценарий: Проверка группировок списка и переход между группами/категориями
	Допустим В командном интерфейсе я выбираю 'Продажи' 'Номенклатура'
	И открылось окно 'Номенклатура'
	
	Когда я нажимаю на кнопку 'Настройки'
	Тогда открылось окно 'Настройки'
	И я устанавливаю флаг 'Корзину'
	И я устанавливаю флаг 'Изображение'
	И я устанавливаю флаг 'Аналоги'
	И я устанавливаю флаг 'Сопутствующие товары'
	И я нажимаю на кнопку 'ОК'
	И Пауза 1

	Когда я нажимаю на кнопку 'Настроить список...'
	И открылось окно 'Настройка списка'
	Тогда я перехожу к закладке "Группировка"
	И в таблице "КомпоновщикНастроекПользовательскиеНастройкиЭлемент3ДоступныеПоляТаблица" я перехожу к строке:
		| Доступные поля |
		| Категория      |
	И я нажимаю на кнопку с именем 'КомпоновщикНастроекПользовательскиеНастройкиЭлемент3ДоступныеПоляВыбрать'
	И я нажимаю на кнопку 'Завершить редактирование'
	
	Когда я меняю значение переключателя 'ОтборКатегорииИерархияПереключатель' на 'Иерархия'
	Тогда я перехожу к закладке "Иерархия (группы)"

	Когда открылось окно 'Номенклатура'
	И я меняю значение переключателя 'ОтборКатегорииИерархияПереключатель' на 'Иерархия'
	Тогда я перехожу к закладке "Иерархия (группы)"
	И в таблице "ОтборИерархия" я перехожу к строке:
		| Представление   |
		| Бытовая техника |
	И Пауза 1
	И в таблице "ОтборИерархия" я перехожу к строке:
		| Представление |
		| <Все группы>  |
	И Пауза 1

	Когда я меняю значение переключателя 'ОтборКатегорииИерархияПереключатель' на 'Категории'
	Тогда я перехожу к закладке "Категории отбор"
	И в таблице "ОтборКатегории" я перехожу к строке:
		| Представление   |
		| Бытовая техника |
	И Пауза 1
	И в таблице "ОтборКатегории" я перехожу к строке:
		| Представление   |
		| <Все категории> |
	И Пауза 1

	Когда я нажимаю на кнопку 'Настроить список...'
	Тогда открылось окно 'Настройка списка'
	И я перехожу к закладке "Группировка"
	И в таблице "КомпоновщикНастроекПользовательскиеНастройкиЭлемент3Группировка" я нажимаю на кнопку с именем 'КомпоновщикНастроекПользовательскиеНастройкиЭлемент3ГруппировкаУдалить'
	И Пауза 1
	И я нажимаю на кнопку 'Завершить редактирование'
	И Я закрываю окно 'Номенклатура'
	И Пауза 1

Сценарий: Проверка установки отборов
	Допустим В командном интерфейсе я выбираю 'Продажи' 'Номенклатура'
	И открылось окно 'Номенклатура'

	Когда я устанавливаю флаг 'Остатки'
	Тогда из выпадающего списка с именем "ОтборОстатки" я выбираю точное значение 'Все'
	И Пауза 1
	И из выпадающего списка с именем "ОтборОстатки" я выбираю точное значение 'В наличии'
	И Пауза 1
	И из выпадающего списка "На складе" я выбираю точное значение 'Хозяйственные товары'
	И Пауза 1
	И из выпадающего списка с именем "ОтборОстатки" я выбираю точное значение 'Отсутствуют'
	И Пауза 1
	И из выпадающего списка с именем "ОтборОстатки" я выбираю точное значение 'Все'
	И Пауза 1

	Когда я устанавливаю флаг 'Цены'
	И Пауза 1
	Тогда из выпадающего списка "Цена" я выбираю точное значение 'Розничная'
	И Пауза 1
	И в поле 'От' я ввожу текст '5,00'
	И Пауза 1
	И я перехожу к следующему реквизиту
	И Пауза 1
	И в поле 'до' я ввожу текст '10,00'
	И Пауза 1
	И я перехожу к следующему реквизиту
	И я нажимаю кнопку очистить у поля "до"
	И Пауза 1
	И я нажимаю кнопку очистить у поля "От"
	И Пауза 1

	И я Устанавливаю флаг 'Запас'
	И я Устанавливаю флаг 'Услуга'
	И я Устанавливаю флаг 'Работа'
	И я Устанавливаю флаг 'Операция'
	И я Устанавливаю флаг 'Вид работ'
	И я Устанавливаю флаг 'Сертификат'
	И я Устанавливаю флаг 'Набор / комплект'

	И я Снимаю флаг 'Запас'
	И я Снимаю флаг 'Услуга'
	И я Снимаю флаг 'Работа'
	И я Снимаю флаг 'Операция'
	И я Снимаю флаг 'Вид работ'
	И я Снимаю флаг 'Сертификат'
	И я Снимаю флаг 'Набор / комплект'
	И Я закрываю окно 'Номенклатура'
	И Пауза 2

Сценарий: Создание документов из корзины в форме списка
	Допустим В командном интерфейсе я выбираю 'Продажи' 'Номенклатура'
	Когда открылось окно 'Номенклатура'
	И в таблице "СписокЗапасы" я активизирую поле с именем "КартинкаКорзина"
	И в таблице "СписокЗапасы" я выбираю текущую строку
	И я нажимаю на кнопку с именем 'ДокументСчетНаОплатуСоздатьИзКорзины'
	Тогда открылось окно 'Счет на оплату (создание)'
	И Я закрываю окно 'Счет на оплату (создание)'
	
	Когда открылось окно 'Номенклатура'
	И в таблице "СписокЗапасы" я активизирую поле с именем "КартинкаКорзина"
	И в таблице "СписокЗапасы" я выбираю текущую строку
	И я нажимаю на кнопку с именем 'ДокументЗаказПокупателяСоздатьИзКорзиныЗаказПокупателя'
	Тогда открылось окно 'Заказ покупателя (создание)'
	И Я закрываю окно 'Заказ покупателя (создание)'
	
	Когда открылось окно 'Номенклатура'
	И в таблице "СписокЗапасы" я активизирую поле с именем "КартинкаКорзина"
	И в таблице "СписокЗапасы" я выбираю текущую строку
	И я нажимаю на кнопку с именем 'ДокументЗаказПокупателяСоздатьИзКорзиныЗаказНаряд'
	Тогда открылось окно 'Заказ-наряд (Создание)'
	И Я закрываю окно 'Заказ-наряд (Создание)'
	
	Когда открылось окно 'Номенклатура'
	И в таблице "СписокЗапасы" я активизирую поле с именем "КартинкаКорзина" 
	И я выбираю пункт контекстного меню с именем 'СписокЗапасыКонтекстноеМенюДобавитьВКорзину' на элементе формы с именем "СписокЗапасы"
	И я нажимаю на кнопку с именем 'ДокументРасходнаяНакладнаяСоздатьИзКорзины'
	Тогда открылось окно 'Расходная накладная (создание)'
	И Я закрываю окно 'Расходная накладная (создание)'
	
	Когда открылось окно 'Номенклатура'
	И в таблице "СписокЗапасы" я активизирую поле с именем "КартинкаКорзина"
	И я выбираю пункт контекстного меню с именем 'СписокЗапасыКонтекстноеМенюДобавитьВКорзину' на элементе формы с именем "СписокЗапасы"
	И я нажимаю на кнопку 'Чек ККМ'
	Тогда открылось окно 'Чек ККМ (создание)'
	И Я закрываю окно 'Чек ККМ (создание)'
	
	Когда открылось окно 'Номенклатура'
	И в таблице "СписокЗапасы" я активизирую поле с именем "КартинкаКорзина"
	И я выбираю пункт контекстного меню с именем 'СписокЗапасыКонтекстноеМенюДобавитьВКорзину' на элементе формы с именем "СписокЗапасы"
	И я нажимаю на кнопку с именем 'ДокументЗаказПоставщикуСоздатьИзКорзины'
	Тогда открылось окно 'Заказ поставщику (создание)'
	И Я закрываю окно 'Заказ поставщику (создание)'
	
	Когда открылось окно 'Номенклатура'
	И в таблице "СписокЗапасы" я активизирую поле с именем "КартинкаКорзина"
	И я выбираю пункт контекстного меню с именем 'СписокЗапасыКонтекстноеМенюДобавитьВКорзину' на элементе формы с именем "СписокЗапасы"
	И я нажимаю на кнопку с именем 'ДокументПриходнаяНакладнаяСоздатьИзКорзины'
	Тогда открылось окно 'Приходная накладная (создание)'
	И Я закрываю окно 'Приходная накладная (создание)'
	
	Когда открылось окно 'Номенклатура'
	Тогда в таблице "СписокЗапасы" я активизирую поле с именем "КартинкаКорзина"
	И я выбираю пункт контекстного меню с именем 'СписокЗапасыКонтекстноеМенюДобавитьВКорзину' на элементе формы с именем "СписокЗапасы"
	
	Когда в таблице "СписокЗапасы" я активизирую поле с именем "КартинкаКорзина"
	И я выбираю пункт контекстного меню с именем 'СписокЗапасыКонтекстноеМенюУдалитьИзКорзины' на элементе формы с именем "СписокЗапасы"
	И открылось окно '1С:Предприятие'
	И я нажимаю на кнопку 'Да'
	Тогда Я закрываю окно 'Номенклатура'

Сценарий: Закрыть подбор товаров
	Если появилось окно с заголовком "Подбор товаров" Тогда
		Когда открылось окно 'Подбор товаров'
		Тогда я нажимаю на кнопку 'OK'

Сценарий: Работа с корзиной + команда Аналоги и Сопутствующие товары
	Допустим В командном интерфейсе я выбираю 'Продажи' 'Номенклатура'
	И открылось окно 'Номенклатура'
	И я нажимаю на кнопку 'Настройки'
	
	Когда открылось окно 'Настройки'
	Тогда я устанавливаю флаг 'Корзину'
	И я устанавливаю флаг 'Изображение'
	И я устанавливаю флаг 'Аналоги'
	И я устанавливаю флаг 'Сопутствующие товары'
	И я нажимаю на кнопку 'ОК'
	И Пауза 1

	Когда в таблице "СписокЗапасы" я активизирую поле с именем "КартинкаКорзина"
	Тогда в таблице "СписокЗапасы" я выбираю текущую строку
	И я нажимаю на гиперссылку "НадписьПодобраноТоваров"
	
	Когда открылось окно 'Ваша корзина:  * на сумму * р.'
	Тогда я нажимаю на кнопку 'Очистить корзину'
	
	Когда открылось окно 'Номенклатура'
	Тогда в таблице "СписокЗапасы" я выбираю текущую строку
	И я выбираю пункт контекстного меню с именем 'СписокЗапасыКонтекстноеМенюДобавитьВКорзину' на элементе формы с именем "СписокЗапасы"
	И Пауза 1
	И я нажимаю на гиперссылку "НадписьПодобраноТоваров"
	
	Когда открылось окно 'Ваша корзина:  * на сумму * р.'
	Тогда я нажимаю на кнопку 'Продолжить подбор'
		
	Когда открылось окно 'Номенклатура'
	Тогда в таблице "СписокЗапасы" я выбираю текущую строку
	И я выбираю пункт контекстного меню с именем 'СписокЗапасыКонтекстноеМенюУдалитьИзКорзины' на элементе формы с именем "СписокЗапасы"
	
	Когда открылось окно '1С:Предприятие'
	Тогда я нажимаю на кнопку 'Да'

	Когда открылось окно 'Номенклатура'
	Тогда я выбираю пункт контекстного меню "Аналоги" на элементе формы с именем "СписокЗапасы"
	
	Когда открылось окно 'Аналоги номенклатуры: *'
	Тогда Я закрываю окно 'Аналоги номенклатуры: *'
	
	Когда открылось окно 'Номенклатура'
	Тогда я выбираю пункт контекстного меню "Сопутствующие товары" на элементе формы с именем "СписокЗапасы"
	
	Когда открылось окно 'Сопутствующие товары'
	Тогда Я закрываю окно 'Сопутствующие товары'
	
	Когда открылось окно 'Номенклатура'
	Тогда в таблице "СписокЗапасы" я выбираю текущую строку
	И я нажимаю на гиперссылку "НадписьПодобраноТоваров"
	
	Когда открылось окно 'Ваша корзина:  * на сумму * р.'
	Тогда я нажимаю на кнопку 'Заказ покупателя'
	
	Когда открылось окно 'Заказ покупателя (создание)'
	Тогда Я закрываю окно 'Заказ покупателя (создание)'
	
	Когда открылось окно 'Номенклатура'
	Тогда Я закрываю окно 'Номенклатура'
