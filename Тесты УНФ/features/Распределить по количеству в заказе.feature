#language: ru
@tree

Функциональность: Распределение по количеству в заказе

Как пользователь УНФ
Я хочу распределить позиции в приходной накладной по количеству в заказе
Чтобы удобно проводить документы с учетом перепоставки по заказу

Контекст:
	Допустим Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Подготовить настройки и данные для сценария
	Допустим В командном интерфейсе я выбираю 'Закупки' 'Еще больше возможностей'
	И открылось окно 'Больше возможностей: настройка программы'
	Тогда я устанавливаю флаг 'Скидки и наценки в закупках'

	Допустим Я добавляю поставщика "Поставщик перепоставки"
	И Я добавляю номенклатуру "Перепоставка"
	И Я добавляю номенклатуру "Недопоставка"

	Допустим Я создаю новый заказ поставщику
	И Я выбираю поставщика "Поставщик перепоставки"
	И в таблице "Запасы" по кнопке "Добавить" я добавляю позицию "Перепоставка" "2" "3 456,00" "7,00"
	И в таблице "Запасы" по кнопке "Добавить" я добавляю позицию "Недопоставка" "3" "4 567,00" "8,00"
	И я нажимаю на кнопку 'Провести и закрыть'
	Тогда я жду закрытия окна 'Заказ поставщику (создание) *' в течение 20 секунд

Сценарий: Распределить по количеству в заказе из контекстного меню
	Допустим В командном интерфейсе я выбираю 'Закупки' 'Заказы поставщикам'
	И открылось окно 'Заказы поставщикам'
	И в таблице "Список" я перехожу к последней строке
	И я нажимаю на кнопку 'Приходная накладная: создать на основании'

	Когда открылось окно 'Приходная накладная (создание)'
	Тогда Я устанавливаю флаг 'Проверять расхождения с входящим документом'
	И Я устанавливаю флаг 'Проверять расхождения с заказом'
	И Я меняю значение переключателя 'Принять по колонке' на 'Количество по факту'

	Когда в таблице "Запасы" я перехожу к строке:
	| Номенклатура |
	| Перепоставка |
	Тогда в таблице "Запасы" я активизирую поле "Количество по факту"
	И в таблице "Запасы" я выбираю текущую строку
	И в таблице "Запасы" в поле 'Количество по факту' я ввожу текст '3,000'
	И в таблице "Запасы" я завершаю редактирование строки

	Когда в таблице "Запасы" я перехожу к строке:
	| Номенклатура |
	| Недопоставка |
	Тогда в таблице "Запасы" я активизирую поле "Количество по факту"
	И в таблице "Запасы" я выбираю текущую строку
	И в таблице "Запасы" в поле 'Количество по факту' я ввожу текст '2,000'
	И в таблице "Запасы" я завершаю редактирование строки

	Когда я нажимаю на кнопку 'Провести'
	Тогда открылось окно '1С:Предприятие'
	И я нажимаю на кнопку 'OK'
	Тогда в логе сообщений TestClient есть строка 'Ошибка: оформлено больше, чем указано в заказе поставщику.'
	И в логе сообщений TestClient есть строка 'Кликните правой кнопкой мыши в таблице "Товары" и выберите "Распределить по количеству в заказе" в контекстном меню.'
	
	Когда я нажимаю на кнопку с именем 'ЗапасыИзменитьСтроки'
	И из выпадающего списка с именем "ЗапасыИзменениеСтрокДействие" я выбираю точное значение 'Распределить по количеству в заказе'
	И я нажимаю на кнопку с именем 'ЗапасыВыполнитьДействие'
	Тогда таблица "Запасы" стала равной по шаблону:
	| Номенклатура | Количество\nпо вх. документу | Количество\nпо факту | Заказ поставщику   |
	| Перепоставка | '2,000'                      | '2,000'              | Заказ поставщику * |
	| Перепоставка | '1,000 / 3,000'              | '1,000 / 3,000'      |                    |
	| Недопоставка | '3,000'                      | '2,000'              | Заказ поставщику * |

	Когда я нажимаю на кнопку с именем 'ЗапасыОтменитьИзменения'
	Тогда таблица "Запасы" стала равной по шаблону:
	| Номенклатура | Количество\nпо вх. документу | Количество\nпо факту | Заказ поставщику   |
	| Перепоставка | '2,000'                      | '3,000'              | Заказ поставщику * |
	| Недопоставка | '3,000'                      | '2,000'              | Заказ поставщику * |
	
	Когда я выбираю пункт контекстного меню "Распределить по количеству в заказе" на элементе формы с именем "Запасы"
	Тогда таблица "Запасы" стала равной по шаблону:
	| Номенклатура | Количество\nпо вх. документу | Количество\nпо факту | Заказ поставщику   |
	| Перепоставка | '2,000'                      | '2,000'              | Заказ поставщику * |
	| Перепоставка | '1,000 / 3,000'              | '1,000 / 3,000'      |                    |
	| Недопоставка | '3,000'                      | '2,000'              | Заказ поставщику * |

	Когда я нажимаю на кнопку 'Провести и закрыть'
	Тогда я жду закрытия окна 'Приходная накладная (создание) *' в течение 20 секунд
