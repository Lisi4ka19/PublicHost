# language: ru
@Email
@tree

Функциональность: Отправка печатных форм по электронной почте
	Как пользователь УНФ
	Я хочу отправлять печатные документы по электронной почте
	Чтобы взаимодействовать с покупателями и поставщиками

Контекст:
	Допустим Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Подготовить данные для сценария отправки Email
	Допустим Я добавляю учетную запись "docs@localhost"
	И Я добавляю покупателя "Покупатель для отправки Email"
	И Я добавляю поставщика "Поставщик для отправки Email"
	И Я добавляю номенклатуру "Позиция для отправки Email"
	И Я добавляю услугу "Услуга для отправки Email"

Сценарий: Подготовить цепочку заказ-приход-расход для отправки Email
	Допустим Я создаю новый заказ покупателя
	И я выбираю покупателя "Покупатель для отправки Email"
	И в таблице "Запасы" по кнопке "ЗапасыДобавить" я добавляю позицию "Позиция для отправки Email" "3" "4 567,00" "-8,00"

	Когда я нажимаю на кнопку 'Провести'
	Тогда не появилось окно предупреждения системы

	Когда я нажимаю на кнопку 'Заказ поставщику: создать на основании'
	Тогда открылось окно 'Заказ поставщику (создание)'
	И из выпадающего списка "Поставщик" я выбираю по строке "Поставщик для отправки Email"
	Тогда открылось окно '1С:Предприятие'
	И я нажимаю на кнопку 'Да'

	Когда открылось окно 'Заказ поставщику (создание) *'
	И в таблице "Запасы" я активизирую поле "Цена"
	И в таблице "Запасы" я выбираю текущую строку
	И в таблице "Запасы" в поле 'Цена' я ввожу текст '3 425,25'
	И в таблице "Запасы" я завершаю редактирование строки

	Когда я нажимаю на кнопку 'Провести'
	Тогда не появилось окно предупреждения системы

	Когда я нажимаю на кнопку 'Приходная накладная: создать на основании'
	Тогда открылось окно 'Приходная накладная (создание)'
	
	Когда я нажимаю на кнопку 'Провести и закрыть'
	Тогда я жду закрытия окна 'Приходная накладная (создание)' в течение 20 секунд

Сценарий: Подготовить цепочку заказ-расход для отправки Email
	Допустим В командном интерфейсе я выбираю 'Продажи' 'Заказы покупателей'
	Когда открылось окно 'Заказы покупателей'
	Тогда в таблице "Список" я выбираю текущую строку

	Когда открылось окно 'Заказ покупателя*'
	Тогда я нажимаю на кнопку 'Расходная накладная: создать на основании'

	Когда открылось окно 'Расходная накладная (создание)'
	Тогда я нажимаю на кнопку 'Провести и закрыть'
	И я жду закрытия окна 'Расходная накладная (создание)' в течение 20 секунд

Сценарий: Подготовить цепочку акт-счет для отправки Email
	Допустим Я создаю новый акт выполненных работ
	И я выбираю покупателя "Покупатель для отправки Email"
	И в таблице "РаботыИУслуги" по кнопке "Добавить" я добавляю позицию "Услуга для отправки Email" "1" "1 837,00"

	Когда я нажимаю на кнопку 'Провести'
	Тогда не появилось окно предупреждения системы

	Когда я нажимаю на кнопку 'Счет на оплату: создать на основании'
	Тогда открылось окно 'Счет на оплату (создание)'
	
	Когда я нажимаю на кнопку 'Провести и закрыть'
	Тогда я жду закрытия окна 'Счет на оплату (создание)' в течение 20 секунд

Структура сценария: Я отправляю заказ покупателя по электронной почте
	Допустим В командном интерфейсе я выбираю 'Продажи' 'Заказы покупателей'
	Когда открылось окно 'Заказы покупателей'
	Тогда в таблице "Список" я выбираю текущую строку

	Когда открылось окно 'Заказ покупателя * от *'
	Тогда я нажимаю на кнопку 'Отправить по электронной почте'

	Когда открылось окно 'Шаблоны электронных писем'
	Тогда в таблице "ПечатныеФормы" я перехожу к строке:
		| 'Представление' |
		| <ПечатнаяФорма> |
	И в таблице "ПечатныеФормы" я устанавливаю флаг 'Пометка'
	И в таблице "ПечатныеФормы" я завершаю редактирование строки
	И я нажимаю на кнопку 'Сформировать'

	Когда открылось окно 'Подготовка нового письма'
	И я выбираю пункт контекстного меню "Выбрать всех получателей" на элементе формы с именем "Получатели"
	Тогда я нажимаю на кнопку 'Подготовить...'

	Когда открылось окно 'Исходящее письмо  (создание)'
	И я нажимаю кнопку выбора у поля "Учетная запись"
	И открылось окно 'Учетные записи электронной почты'
	И в таблице "Список" я перехожу к строке:
		| 'Наименование'   |
		| 'docs@localhost' |
	Тогда я нажимаю на кнопку с именем 'ФормаВыбрать'

	Когда открылось окно 'Исходящее письмо  (создание) *'
	И я нажимаю на кнопку 'Отправить'
	Тогда не появилось окно предупреждения системы

Примеры:
  | Номер | ПечатнаяФорма                         |
  |   1.  | Заказ покупателя                      |
  |   2.  | Счет на оплату                        |
  |   3.  | Счет на оплату (частичная)            |
  |   4.  | Счет на оплату (факсимиле)            |
  |   5.  | Счет на оплату (частичная, факсимиле) |
  |   6.  | Калькуляция                           |
  |   7.  | Сводно о заказе                       |
  |   8.  | Приложение к договору (устарела)      |
  |   9.  | Договор купли-продажи (.docx)         |
  |  10.  | Договор оказания услуг (.docx)        |
  |  11.  | Коммерческое предложение              |
  |  12.  | Коммерческое предложение (.docx)      |
  |  13.  | Коммерческое предложение (.odt)       |

Структура сценария: Я отправляю счет на оплату по электронной почте
	Допустим В командном интерфейсе я выбираю 'Продажи' 'Счета на оплату'
	Когда открылось окно 'Счета на оплату'
	Тогда в таблице "Список" я выбираю текущую строку

	Когда открылось окно 'Счет на оплату * от *'
	Тогда я нажимаю на кнопку 'Отправить по электронной почте'

	Когда открылось окно 'Шаблоны электронных писем'
	Тогда в таблице "ПечатныеФормы" я перехожу к строке:
		| 'Представление' |
		| <ПечатнаяФорма> |
	И в таблице "ПечатныеФормы" я устанавливаю флаг 'Пометка'
	И в таблице "ПечатныеФормы" я завершаю редактирование строки
	И я нажимаю на кнопку 'Сформировать'

	Когда открылось окно 'Подготовка нового письма'
	И я выбираю пункт контекстного меню "Выбрать всех получателей" на элементе формы с именем "Получатели"
	Тогда я нажимаю на кнопку 'Подготовить...'

	Когда открылось окно 'Исходящее письмо  (создание)'
	И я нажимаю кнопку выбора у поля "Учетная запись"
	И открылось окно 'Учетные записи электронной почты'
	И в таблице "Список" я перехожу к строке:
		| 'Наименование'   |
		| 'docs@localhost' |
	Тогда я нажимаю на кнопку с именем 'ФормаВыбрать'

	Когда открылось окно 'Исходящее письмо  (создание) *'
	И я нажимаю на кнопку 'Отправить'
	Тогда не появилось окно предупреждения системы

Примеры:
  | Номер | ПечатнаяФорма                         |
  |   1.  | Счет на оплату                        |
  |   2.  | Счет на оплату (частичная)            |
  |   3.  | Счет на оплату (факсимиле)            |
  |   4.  | Счет на оплату (частичная, факсимиле) |
  |   5.  | Приложение к договору (устарела)      |
  |   6.  | Договор купли-продажи (.docx)         |
  |   7.  | Договор оказания услуг (.docx)        |

Структура сценария: Я отправляю расходную накладную по электронной почте
	Допустим В командном интерфейсе я выбираю 'Продажи' 'Расходные накладные'
	Когда открылось окно 'Расходные накладные'
	Тогда в таблице "Список" я выбираю текущую строку

	Когда открылось окно 'Расходная накладная * от *'
	Тогда я нажимаю на кнопку 'Отправить по электронной почте'

	Когда открылось окно 'Шаблоны электронных писем'
	Тогда в таблице "ПечатныеФормы" я перехожу к строке:
		| 'Представление' |
		| <ПечатнаяФорма> |
	И в таблице "ПечатныеФормы" я устанавливаю флаг 'Пометка'
	И в таблице "ПечатныеФормы" я завершаю редактирование строки
	И я нажимаю на кнопку 'Сформировать'

	Когда открылось окно 'Подготовка нового письма'
	И я выбираю пункт контекстного меню "Выбрать всех получателей" на элементе формы с именем "Получатели"
	Тогда я нажимаю на кнопку 'Подготовить...'

	Когда открылось окно 'Исходящее письмо  (создание)'
	И я нажимаю кнопку выбора у поля "Учетная запись"
	И открылось окно 'Учетные записи электронной почты'
	И в таблице "Список" я перехожу к строке:
		| 'Наименование'   |
		| 'docs@localhost' |
	Тогда я нажимаю на кнопку с именем 'ФормаВыбрать'

	Когда открылось окно 'Исходящее письмо  (создание) *'
	И я нажимаю на кнопку 'Отправить'
	Тогда не появилось окно предупреждения системы

Примеры:
  | Номер | ПечатнаяФорма                                      |
  |   1.  | Акт об оказании услуг                              |
  |   2.  | Акт об оказании услуг (факсимиле)                  |
  |   3.  | Акт передачи прав                                  |
  |   4.  | ТОРГ-12 (Товарная накладная с услугами)            |
  |   5.  | ТОРГ-12 (Товарная накладная)                       |
  |   6.  | ТОРГ-12 (Товарная накладная с услугами, факсимиле) |
  |   7.  | ТОРГ-12 (Товарная накладная, факсимиле)            |
  |   8.  | М15 (Накладная на отпуск материалов)               |
  |   9.  | 1-Т (Товарно-транспортная накладная)               |
  |  10.  | МХ-1 (Акт о приеме-передаче запасов на хранение)   |
  |  11.  | МХ-3 (Акт о возврате запасов сданных на хранение)  |
  |  12.  | Счет-фактура                                       |
  |  13.  | Универсальный передаточный документ                |
  |  14.  | Универсальный передаточный документ (факсимиле)    |
  |  15.  | Накладная                                          |
  |  16.  | Накладная (с услугами)                             |
  |  17.  | Накладная (с услугами, факсимиле)                  |
  |  18.  | Накладная (факсимиле)                              |
  |  19.  | Счет на оплату                                     |
  |  20.  | Счет на оплату (факсимиле)                         |
  |  21.  | Товарный чек                                       |
  |  22.  | Гарантийный талон                                  |
  |  23.  | Бланк товарного наполнения                         |

Структура сценария: Я отправляю акт выполненных работ по электронной почте
	Допустим В командном интерфейсе я выбираю 'Продажи' 'Акты выполненных работ'
	Когда открылось окно 'Акты выполненных работ'
	Тогда в таблице "Список" я выбираю текущую строку

	Когда открылось окно 'Акт выполненных работ * от *'
	Тогда я нажимаю на кнопку 'Отправить по электронной почте'

	Когда открылось окно 'Шаблоны электронных писем'
	Тогда в таблице "ПечатныеФормы" я перехожу к строке:
		| 'Представление' |
		| <ПечатнаяФорма> |
	И в таблице "ПечатныеФормы" я устанавливаю флаг 'Пометка'
	И в таблице "ПечатныеФормы" я завершаю редактирование строки
	И я нажимаю на кнопку 'Сформировать'

	Когда открылось окно 'Подготовка нового письма'
	И я выбираю пункт контекстного меню "Выбрать всех получателей" на элементе формы с именем "Получатели"
	Тогда я нажимаю на кнопку 'Подготовить...'

	Когда открылось окно 'Исходящее письмо  (создание)'
	И я нажимаю кнопку выбора у поля "Учетная запись"
	И открылось окно 'Учетные записи электронной почты'
	И в таблице "Список" я перехожу к строке:
		| 'Наименование'   |
		| 'docs@localhost' |
	Тогда я нажимаю на кнопку с именем 'ФормаВыбрать'

	Когда открылось окно 'Исходящее письмо  (создание) *'
	И я нажимаю на кнопку 'Отправить'
	Тогда не появилось окно предупреждения системы

Примеры:
  | Номер | ПечатнаяФорма                                      |
  |   1.  | Акт об оказании услуг                              |
  |   2.  | Акт об оказании услуг (факсимиле)                  |
  |   3.  | Счет-фактура                                       |
  |   4.  | Универсальный передаточный документ                |
  |   5.  | Универсальный передаточный документ (факсимиле)    |